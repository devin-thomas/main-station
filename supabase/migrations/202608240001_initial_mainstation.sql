create extension if not exists citext with schema extensions;
create extension if not exists pgcrypto with schema extensions;

create schema if not exists mainstation_private;
revoke all on schema mainstation_private from public, anon, authenticated, service_role;

create or replace function public.selection_schema_is_valid(candidate jsonb)
returns boolean
language sql
immutable
security invoker
set search_path = ''
as $$
  with slots as (
    select slot.value
    from jsonb_array_elements(
      case
        when jsonb_typeof(candidate -> 'slots') = 'array' then candidate -> 'slots'
        else '[]'::jsonb
      end
    ) as slot(value)
  ), slot_validation as (
    select
      count(*) between 1 and 8 as valid_slot_count,
      count(*) = count(distinct slot.value ->> 'id') as unique_slot_ids,
      bool_and(coalesce(
        jsonb_typeof(slot.value) = 'object'
        and jsonb_typeof(slot.value -> 'id') = 'string'
        and coalesce(slot.value ->> 'id', '') ~ '^[a-z0-9][a-z0-9-]*$'
        and char_length(coalesce(slot.value ->> 'id', '')) <= 48
        and jsonb_typeof(slot.value -> 'label') = 'string'
        and char_length(coalesce(slot.value ->> 'label', '')) between 1 and 80
        and jsonb_typeof(slot.value -> 'allowedRoles') = 'array'
        and jsonb_array_length(
          case
            when jsonb_typeof(slot.value -> 'allowedRoles') = 'array' then slot.value -> 'allowedRoles'
            else '[]'::jsonb
          end
        ) > 0
        and not exists (
          select 1
          from jsonb_array_elements_text(
            case
              when jsonb_typeof(slot.value -> 'allowedRoles') = 'array' then slot.value -> 'allowedRoles'
              else '[]'::jsonb
            end
          ) as role(value)
          where role.value not in ('fighter', 'kameo')
        )
        and (
          not (slot.value ? 'optionLabel')
          or (
            jsonb_typeof(slot.value -> 'optionLabel') = 'string'
            and char_length(coalesce(slot.value ->> 'optionLabel', '')) between 1 and 80
          )
        )
        and (
          not (slot.value ? 'optionValues')
          or (
            jsonb_typeof(slot.value -> 'optionValues') = 'array'
            and jsonb_array_length(slot.value -> 'optionValues') <= 32
            and not exists (
              select 1
              from jsonb_array_elements(
                case
                  when jsonb_typeof(slot.value -> 'optionValues') = 'array' then slot.value -> 'optionValues'
                  else '[]'::jsonb
                end
              ) as option_value(value)
              where jsonb_typeof(option_value.value) <> 'string'
                or char_length(option_value.value #>> '{}') not between 1 and 80
            )
            and (
              select count(*) = count(distinct option_value.value)
              from jsonb_array_elements_text(
                case
                  when jsonb_typeof(slot.value -> 'optionValues') = 'array' then slot.value -> 'optionValues'
                  else '[]'::jsonb
                end
              ) as option_value(value)
            )
          )
        )
        and (
          not (slot.value ? 'optionValues')
          or slot.value ? 'optionLabel'
        )
        and (
          candidate -> 'verified' <> 'true'::jsonb
          or not (slot.value ? 'optionLabel')
          or jsonb_array_length(
            case
              when jsonb_typeof(slot.value -> 'optionValues') = 'array' then slot.value -> 'optionValues'
              else '[]'::jsonb
            end
          ) > 0
        ),
        false
      )) as slots_valid
    from slots slot
  )
  select coalesce(
    jsonb_typeof(candidate) = 'object'
    and candidate -> 'version' = '1'::jsonb
    and jsonb_typeof(candidate -> 'noun') = 'string'
    and candidate ->> 'noun' in ('Character', 'Team')
    and jsonb_typeof(candidate -> 'verified') = 'boolean'
    and jsonb_typeof(candidate -> 'ordered') = 'boolean'
    and jsonb_typeof(candidate -> 'uniqueCharacters') = 'boolean'
    and jsonb_typeof(candidate -> 'slots') = 'array'
    and slot_validation.valid_slot_count
    and slot_validation.unique_slot_ids
    and slot_validation.slots_valid
    and (
      not (candidate ? 'teamOptionLabel')
      or (
        jsonb_typeof(candidate -> 'teamOptionLabel') = 'string'
        and char_length(coalesce(candidate ->> 'teamOptionLabel', '')) between 1 and 80
      )
    )
    and (
      not (candidate ? 'teamOptionValues')
      or (
        candidate ? 'teamOptionLabel'
        and jsonb_typeof(candidate -> 'teamOptionValues') = 'array'
        and jsonb_array_length(candidate -> 'teamOptionValues') <= 32
        and not exists (
          select 1
          from jsonb_array_elements(
            case
              when jsonb_typeof(candidate -> 'teamOptionValues') = 'array' then candidate -> 'teamOptionValues'
              else '[]'::jsonb
            end
          ) as team_option(value)
          where jsonb_typeof(team_option.value) <> 'string'
            or char_length(team_option.value #>> '{}') not between 1 and 80
        )
        and (
          select count(*) = count(distinct team_option.value)
          from jsonb_array_elements_text(
            case
              when jsonb_typeof(candidate -> 'teamOptionValues') = 'array' then candidate -> 'teamOptionValues'
              else '[]'::jsonb
            end
          ) as team_option(value)
        )
      )
    )
    and (
      candidate -> 'verified' <> 'true'::jsonb
      or not (candidate ? 'teamOptionLabel')
      or jsonb_array_length(
        case
          when jsonb_typeof(candidate -> 'teamOptionValues') = 'array' then candidate -> 'teamOptionValues'
          else '[]'::jsonb
        end
      ) > 0
    ),
    false
  )
  from slot_validation;
$$;

create type public.lineup_category as enum ('main', 'secondary');
create type public.lineup_lifecycle as enum ('active', 'retired');
create type public.lineup_visibility as enum ('public', 'private');
create type public.character_role as enum ('fighter', 'kameo');
create type public.feedback_response as enum ('would_try', 'not_for_me', 'already_play');
create type public.art_review_state as enum ('pending', 'approved', 'disabled', 'replaced');

create table public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  handle extensions.citext not null unique,
  display_name text not null,
  bio text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint profiles_handle_shape check (handle::text ~ '^[a-z0-9][a-z0-9-]{1,30}[a-z0-9]$'),
  constraint profiles_display_name_length check (char_length(display_name) between 1 and 48),
  constraint profiles_bio_length check (bio is null or char_length(bio) <= 160)
);

create table public.game_versions (
  id uuid primary key default extensions.gen_random_uuid(),
  slug text not null unique,
  name text not null,
  short_name text not null,
  release_label text not null,
  launch_order smallint not null unique,
  selection_schema jsonb not null,
  catalog_source_url text not null,
  catalog_status text not null default 'preview',
  source_checked_at timestamptz not null,
  active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint game_versions_slug_shape check (slug ~ '^[a-z0-9][a-z0-9-]*$'),
  constraint game_versions_selection_schema_size check (pg_column_size(selection_schema) <= 32768),
  constraint game_versions_selection_schema_valid check (public.selection_schema_is_valid(selection_schema)),
  constraint game_versions_catalog_status check (catalog_status in ('preview', 'verified', 'retired'))
);

create table public.characters (
  id uuid primary key default extensions.gen_random_uuid(),
  game_version_id uuid not null references public.game_versions(id) on delete cascade,
  slug text not null,
  display_name text not null,
  roster_role public.character_role not null default 'fighter',
  roster_status text not null default 'released',
  is_playable boolean not null default true,
  roster_order smallint not null default 0,
  summary text not null,
  summary_source_url text not null,
  summary_source_publisher text not null,
  summary_reuse_mode text not null default 'attributed-paraphrase',
  source_checked_at timestamptz not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (game_version_id, slug, roster_role),
  unique (id, game_version_id),
  constraint characters_slug_shape check (slug ~ '^[a-z0-9][a-z0-9-]*$'),
  constraint characters_roster_status check (roster_status in ('announced', 'released', 'retired')),
  constraint characters_summary_reuse check (summary_reuse_mode in ('licensed-copy', 'attributed-paraphrase', 'direct-permission'))
);

create table public.character_art_assets (
  id uuid primary key default extensions.gen_random_uuid(),
  character_id uuid not null references public.characters(id) on delete cascade,
  storage_path text not null,
  source_url text not null,
  source_publisher text not null,
  license_url text,
  asset_reuse_mode text not null,
  credit_text text not null,
  permission_evidence text,
  asset_sha256 text not null,
  review_state public.art_review_state not null default 'pending',
  is_primary boolean not null default false,
  retrieved_at timestamptz not null,
  reviewed_at timestamptz,
  disabled_at timestamptz,
  replaced_by uuid references public.character_art_assets(id) on delete set null,
  created_at timestamptz not null default now(),
  unique (asset_sha256),
  constraint character_art_storage_owned check (storage_path ~ '^/art/[a-z0-9][a-z0-9._/-]*$'),
  constraint character_art_hash_shape check (asset_sha256 ~ '^sha256:[0-9a-f]{64}$'),
  constraint character_art_reuse_mode check (asset_reuse_mode in ('express-fan-kit', 'conditional-fan-kit', 'written-permission', 'community-licensed'))
);

create unique index character_art_one_active_primary
  on public.character_art_assets(character_id)
  where is_primary and review_state = 'approved' and disabled_at is null;

create table public.lineups (
  id uuid primary key default extensions.gen_random_uuid(),
  owner_id uuid not null references public.profiles(id) on delete cascade,
  game_version_id uuid not null references public.game_versions(id),
  category public.lineup_category not null,
  lifecycle public.lineup_lifecycle not null,
  visibility public.lineup_visibility not null,
  options jsonb not null default '{}'::jsonb,
  sort_order integer not null default 0,
  is_complete boolean not null default false,
  client_request_id uuid not null default extensions.gen_random_uuid(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (owner_id, client_request_id),
  unique (id, game_version_id),
  constraint lineups_options_object check (jsonb_typeof(options) = 'object'),
  constraint lineups_options_size check (pg_column_size(options) <= 512)
);

create table public.character_picks (
  id uuid primary key default extensions.gen_random_uuid(),
  lineup_id uuid not null,
  game_version_id uuid not null references public.game_versions(id),
  character_id uuid not null,
  slot_id text not null,
  slot_index smallint not null,
  pick_kind public.character_role not null default 'fighter',
  options jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  unique (lineup_id, slot_id),
  unique (lineup_id, slot_index),
  foreign key (lineup_id, game_version_id) references public.lineups(id, game_version_id) on delete cascade,
  foreign key (character_id, game_version_id) references public.characters(id, game_version_id),
  constraint character_picks_slot_index_nonnegative check (slot_index >= 0),
  constraint character_picks_options_object check (jsonb_typeof(options) = 'object'),
  constraint character_picks_options_size check (pg_column_size(options) <= 512)
);

create table public.profile_claims (
  id uuid primary key default extensions.gen_random_uuid(),
  owner_id uuid not null references auth.users(id) on delete cascade,
  request_id uuid not null,
  response jsonb,
  created_at timestamptz not null default now(),
  completed_at timestamptz,
  unique (owner_id, request_id)
);

create table public.recommendation_runs (
  id uuid primary key default extensions.gen_random_uuid(),
  owner_id uuid not null references public.profiles(id) on delete cascade,
  target_game_version_id uuid not null references public.game_versions(id),
  scoring_policy text not null,
  candidates jsonb not null,
  created_at timestamptz not null default now(),
  constraint recommendation_runs_policy check (scoring_policy in ('association-v1')),
  constraint recommendation_runs_candidates_array check (jsonb_typeof(candidates) = 'array')
);

create table public.recommendation_feedback (
  id uuid primary key default extensions.gen_random_uuid(),
  recommendation_run_id uuid not null references public.recommendation_runs(id) on delete cascade,
  owner_id uuid not null references public.profiles(id) on delete cascade,
  character_id uuid not null references public.characters(id),
  response public.feedback_response not null,
  reason_code text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (owner_id, recommendation_run_id, character_id)
);

create index character_art_assets_character_id_idx on public.character_art_assets(character_id);
create index character_art_assets_replaced_by_idx on public.character_art_assets(replaced_by);
create index lineups_game_version_id_idx on public.lineups(game_version_id);
create index lineups_public_game_owner_idx on public.lineups(game_version_id, owner_id)
  where visibility = 'public' and is_complete;
create index character_picks_game_version_id_idx on public.character_picks(game_version_id);
create index character_picks_lineup_game_version_idx on public.character_picks(lineup_id, game_version_id);
create index character_picks_character_game_version_idx on public.character_picks(character_id, game_version_id);
create index recommendation_runs_owner_id_idx on public.recommendation_runs(owner_id);
create index recommendation_runs_target_game_version_id_idx on public.recommendation_runs(target_game_version_id);
create index recommendation_feedback_recommendation_run_id_idx on public.recommendation_feedback(recommendation_run_id);
create index recommendation_feedback_character_id_idx on public.recommendation_feedback(character_id);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger profiles_set_updated_at before update on public.profiles
for each row execute function public.set_updated_at();
create trigger game_versions_set_updated_at before update on public.game_versions
for each row execute function public.set_updated_at();
create trigger characters_set_updated_at before update on public.characters
for each row execute function public.set_updated_at();
create trigger lineups_set_updated_at before update on public.lineups
for each row execute function public.set_updated_at();
create trigger recommendation_feedback_set_updated_at before update on public.recommendation_feedback
for each row execute function public.set_updated_at();

create or replace function public.enforce_pick_lineup_game()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $$
declare
  expected_game uuid;
begin
  select game_version_id into expected_game from public.lineups where id = new.lineup_id;
  if expected_game is null then
    raise exception 'Unknown Lineup.' using errcode = '23503';
  end if;
  if new.game_version_id <> expected_game then
    raise exception 'Character Pick and Lineup must share one Game Version.' using errcode = '23514';
  end if;
  return new;
end;
$$;

create trigger character_picks_same_game
before insert or update on public.character_picks
for each row execute function public.enforce_pick_lineup_game();

create or replace function public.lineup_is_complete(p_lineup_id uuid)
returns boolean
language sql
stable
security invoker
set search_path = ''
as $$
  with target as (
    select l.id, l.owner_id, l.visibility, l.game_version_id, l.options, gv.selection_schema
    from public.lineups l
    join public.game_versions gv on gv.id = l.game_version_id
    where l.id = p_lineup_id
      and (
        l.owner_id = (select auth.uid())
        or l.visibility = 'public'
        or current_user in ('postgres', 'service_role', 'supabase_admin')
      )
  )
  select coalesce(
    target.selection_schema @> '{"verified": true}'::jsonb
    and jsonb_array_length(target.selection_schema -> 'slots') > 0
    and (
      select count(*)
      from public.character_picks cp
      where cp.lineup_id = target.id
    ) = jsonb_array_length(target.selection_schema -> 'slots')
    and not exists (
      select 1
      from jsonb_array_elements(target.selection_schema -> 'slots') with ordinality as slot(value, ordinal)
      where not exists (
        select 1
        from public.character_picks cp
        join public.characters c on c.id = cp.character_id and c.game_version_id = cp.game_version_id
        where cp.lineup_id = target.id
          and cp.game_version_id = target.game_version_id
          and cp.slot_id = slot.value ->> 'id'
          and c.is_playable
          and c.roster_status <> 'retired'
          and coalesce(slot.value -> 'allowedRoles', '[]'::jsonb) ? c.roster_role::text
          and cp.pick_kind = c.roster_role
          and (
            case
              when coalesce(jsonb_array_length(slot.value -> 'optionValues'), 0) = 0
                then cp.options = '{}'::jsonb
              else jsonb_typeof(cp.options -> 'selection') = 'string'
                and (cp.options - 'selection') = '{}'::jsonb
                and (slot.value -> 'optionValues') ? (cp.options ->> 'selection')
            end
          )
          and (
            not coalesce((target.selection_schema ->> 'ordered')::boolean, false)
            or cp.slot_index = slot.ordinal - 1
          )
      )
    )
    and (
      not coalesce((target.selection_schema ->> 'uniqueCharacters')::boolean, false)
      or (
        select count(*) = count(distinct cp.character_id)
        from public.character_picks cp
        where cp.lineup_id = target.id
      )
    )
    and (
      case
        when coalesce(jsonb_array_length(target.selection_schema -> 'teamOptionValues'), 0) = 0
          then target.options = '{}'::jsonb
        else jsonb_typeof(target.options -> 'selection') = 'string'
          and (target.options - 'selection') = '{}'::jsonb
          and (target.selection_schema -> 'teamOptionValues') ? (target.options ->> 'selection')
      end
    ),
    false
  )
  from target;
$$;

create or replace function public.lineup_is_publishable(p_lineup_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select coalesce((
    select l.visibility = 'public'
      and l.is_complete
      and public.lineup_is_complete(l.id)
    from public.lineups l
    where l.id = p_lineup_id
  ), false);
$$;

create or replace function public.prevent_invalid_complete_lineup()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $$
begin
  if new.is_complete and not public.lineup_is_complete(new.id) then
    raise exception 'Lineup does not satisfy the Game Version Selection Schema.' using errcode = '23514';
  end if;
  return new;
end;
$$;

create constraint trigger lineups_require_complete_selection
after insert or update on public.lineups
deferrable initially deferred
for each row execute function public.prevent_invalid_complete_lineup();

create or replace function public.prevent_invalid_complete_lineup_after_pick()
returns trigger
language plpgsql
security invoker
set search_path = ''
as $$
begin
  if tg_op <> 'INSERT'
    and exists (select 1 from public.lineups where id = old.lineup_id and is_complete)
    and not public.lineup_is_complete(old.lineup_id)
  then
    raise exception 'A completed Lineup cannot contain invalid Character Picks.' using errcode = '23514';
  end if;

  if tg_op <> 'DELETE'
    and (tg_op <> 'UPDATE' or new.lineup_id is distinct from old.lineup_id)
    and exists (select 1 from public.lineups where id = new.lineup_id and is_complete)
    and not public.lineup_is_complete(new.lineup_id)
  then
    raise exception 'A completed Lineup cannot contain invalid Character Picks.' using errcode = '23514';
  end if;

  if tg_op = 'DELETE' then
    return old;
  end if;
  return new;
end;
$$;

create constraint trigger completed_lineups_recheck_character_picks
after insert or update or delete on public.character_picks
deferrable initially deferred
for each row execute function public.prevent_invalid_complete_lineup_after_pick();

create or replace function public.revalidate_lineups_after_schema_change()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  update public.lineups l
  set is_complete = false
  where l.game_version_id = new.id
    and l.is_complete
    and not public.lineup_is_complete(l.id);
  return new;
end;
$$;

create trigger game_versions_revalidate_completed_lineups
after update of selection_schema on public.game_versions
for each row
when (old.selection_schema is distinct from new.selection_schema)
execute function public.revalidate_lineups_after_schema_change();

create or replace function public.revalidate_lineups_after_character_change()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
begin
  update public.lineups l
  set is_complete = false
  where l.is_complete
    and exists (
      select 1
      from public.character_picks cp
      where cp.lineup_id = l.id
        and cp.character_id = new.id
    )
    and not public.lineup_is_complete(l.id);
  return new;
end;
$$;

create trigger characters_revalidate_completed_lineups
after update of game_version_id, roster_role, roster_status, is_playable on public.characters
for each row
when (
  old.game_version_id is distinct from new.game_version_id
  or old.roster_role is distinct from new.roster_role
  or old.roster_status is distinct from new.roster_status
  or old.is_playable is distinct from new.is_playable
)
execute function public.revalidate_lineups_after_character_change();

alter table public.profiles enable row level security;
alter table public.game_versions enable row level security;
alter table public.characters enable row level security;
alter table public.character_art_assets enable row level security;
alter table public.lineups enable row level security;
alter table public.character_picks enable row level security;
alter table public.profile_claims enable row level security;
alter table public.recommendation_runs enable row level security;
alter table public.recommendation_feedback enable row level security;

create policy profiles_public_read on public.profiles for select using (true);
create policy profiles_owner_insert on public.profiles for insert to authenticated with check ((select auth.uid()) = id);
create policy profiles_owner_update on public.profiles for update to authenticated using ((select auth.uid()) = id) with check ((select auth.uid()) = id);

create policy game_versions_public_read on public.game_versions for select using (active);
create policy characters_public_read on public.characters for select using (is_playable and roster_status <> 'retired');
create policy character_art_public_read on public.character_art_assets for select using (review_state = 'approved' and disabled_at is null);

create policy lineups_public_or_owner_read on public.lineups for select
using (public.lineup_is_publishable(id) or (select auth.uid()) = owner_id);
create policy lineups_owner_insert on public.lineups for insert to authenticated with check ((select auth.uid()) = owner_id);
create policy lineups_owner_update on public.lineups for update to authenticated using ((select auth.uid()) = owner_id) with check ((select auth.uid()) = owner_id);
create policy lineups_owner_delete on public.lineups for delete to authenticated using ((select auth.uid()) = owner_id);

create policy character_picks_public_or_owner_read on public.character_picks for select
using (exists (
  select 1 from public.lineups l
  where l.id = character_picks.lineup_id
    and (public.lineup_is_publishable(l.id) or l.owner_id = (select auth.uid()))
));
create policy character_picks_owner_insert on public.character_picks for insert to authenticated
with check (exists (select 1 from public.lineups l where l.id = character_picks.lineup_id and l.owner_id = (select auth.uid())));
create policy character_picks_owner_update on public.character_picks for update to authenticated
using (exists (select 1 from public.lineups l where l.id = character_picks.lineup_id and l.owner_id = (select auth.uid())))
with check (exists (select 1 from public.lineups l where l.id = character_picks.lineup_id and l.owner_id = (select auth.uid())));
create policy character_picks_owner_delete on public.character_picks for delete to authenticated
using (exists (select 1 from public.lineups l where l.id = character_picks.lineup_id and l.owner_id = (select auth.uid())));

create policy profile_claims_owner_read on public.profile_claims for select to authenticated using ((select auth.uid()) = owner_id);
create policy recommendation_runs_owner_read on public.recommendation_runs for select to authenticated using ((select auth.uid()) = owner_id);
create policy recommendation_runs_owner_insert on public.recommendation_runs for insert to authenticated with check ((select auth.uid()) = owner_id);
create policy recommendation_feedback_owner_read on public.recommendation_feedback for select to authenticated using ((select auth.uid()) = owner_id);
create policy recommendation_feedback_owner_insert on public.recommendation_feedback for insert to authenticated
with check (
  (select auth.uid()) = owner_id
  and exists (select 1 from public.recommendation_runs r where r.id = recommendation_run_id and r.owner_id = (select auth.uid()))
);
create policy recommendation_feedback_owner_update on public.recommendation_feedback for update to authenticated
using ((select auth.uid()) = owner_id)
with check (
  (select auth.uid()) = owner_id
  and exists (select 1 from public.recommendation_runs r where r.id = recommendation_run_id and r.owner_id = (select auth.uid()))
);

revoke all on table
  public.profiles,
  public.game_versions,
  public.characters,
  public.character_art_assets,
  public.lineups,
  public.character_picks,
  public.profile_claims,
  public.recommendation_runs,
  public.recommendation_feedback
from public, anon, authenticated, service_role;

grant select on public.profiles, public.game_versions, public.characters, public.character_art_assets, public.lineups, public.character_picks to anon, authenticated;
grant insert, update on public.profiles to authenticated;
grant insert, update, delete on public.lineups, public.character_picks to authenticated;
grant select on public.profile_claims, public.recommendation_runs, public.recommendation_feedback to authenticated;
grant insert on public.recommendation_runs, public.recommendation_feedback to authenticated;
grant update on public.recommendation_feedback to authenticated;
grant select, insert, update, delete on public.profiles, public.game_versions, public.characters, public.character_art_assets, public.lineups, public.character_picks, public.profile_claims, public.recommendation_runs, public.recommendation_feedback to service_role;

create view public.public_lineups
with (security_invoker = true)
as
select
  l.id,
  l.owner_id,
  p.handle,
  p.display_name,
  l.game_version_id,
  gv.slug as game_slug,
  gv.name as game_name,
  l.category,
  l.lifecycle,
  l.visibility,
  l.options,
  l.sort_order,
  l.created_at,
  l.updated_at
from public.lineups l
join public.profiles p on p.id = l.owner_id
join public.game_versions gv on gv.id = l.game_version_id
where l.visibility = 'public'
  and l.is_complete
  and public.lineup_is_publishable(l.id);

create view public.registered_player_counts
with (security_invoker = true)
as
select game_version_id, count(distinct owner_id)::bigint as registered_player_count
from public.public_lineups
group by game_version_id;

create view public.character_usage_stats
with (security_invoker = true)
as
select
  cp.character_id,
  l.game_version_id,
  count(distinct l.owner_id)::bigint as public_player_count,
  count(distinct l.owner_id) filter (where l.category = 'main')::bigint as main_player_count,
  count(distinct l.owner_id) filter (where l.category = 'secondary')::bigint as secondary_player_count,
  count(distinct l.owner_id) filter (where l.lifecycle = 'active')::bigint as active_player_count,
  count(distinct l.owner_id) filter (where l.lifecycle = 'retired')::bigint as retired_player_count,
  case when rpc.registered_player_count > 0
    then count(distinct l.owner_id)::numeric / rpc.registered_player_count::numeric
    else null
  end as registered_player_share
from public.public_lineups l
join public.character_picks cp on cp.lineup_id = l.id
left join public.registered_player_counts rpc on rpc.game_version_id = l.game_version_id
group by cp.character_id, l.game_version_id, rpc.registered_player_count;

create view public.player_game_signatures
with (security_invoker = true)
as
with appearance_weights as (
  select
    l.owner_id as profile_id,
    l.game_version_id,
    cp.character_id,
    sum(
      (case l.category when 'main' then 1.0 else 0.65 end)
      * (case l.lifecycle when 'active' then 1.0 else 0.5 end)
    )::numeric as raw_weight
  from public.public_lineups l
  join public.character_picks cp on cp.lineup_id = l.id
  group by l.owner_id, l.game_version_id, cp.character_id
)
select
  profile_id,
  game_version_id,
  character_id,
  raw_weight,
  raw_weight / sum(raw_weight) over (partition by profile_id, game_version_id) as normalized_weight,
  'signature-v1'::text as policy_version
from appearance_weights;

create view public.public_profile_mainline
with (security_invoker = true)
as
select
  l.id,
  l.owner_id,
  p.handle,
  p.display_name,
  p.bio,
  gv.slug as game_slug,
  l.category,
  l.lifecycle,
  l.visibility,
  l.sort_order,
  l.options ->> 'selection' as team_option,
  jsonb_agg(
    jsonb_strip_nulls(jsonb_build_object(
      'slotId', cp.slot_id,
      'characterSlug', c.slug,
      'option', cp.options ->> 'selection'
    ))
    order by cp.slot_index
  ) as picks,
  l.created_at,
  l.updated_at
from public.public_lineups l
join public.profiles p on p.id = l.owner_id
join public.game_versions gv on gv.id = l.game_version_id
join public.character_picks cp on cp.lineup_id = l.id
join public.characters c on c.id = cp.character_id and c.game_version_id = cp.game_version_id
group by l.id, l.owner_id, p.handle, p.display_name, p.bio, gv.slug, l.category, l.lifecycle, l.visibility, l.sort_order, l.options, l.created_at, l.updated_at;

revoke all on table
  public.public_lineups,
  public.registered_player_counts,
  public.character_usage_stats,
  public.player_game_signatures,
  public.public_profile_mainline
from public, anon, authenticated, service_role;

grant select on public.public_lineups, public.registered_player_counts, public.character_usage_stats, public.player_game_signatures, public.public_profile_mainline to anon, authenticated;

create or replace function public.finalize_lineup(p_lineup_id uuid)
returns public.lineups
language plpgsql
security invoker
set search_path = ''
as $$
declare
  result public.lineups;
begin
  if not exists (select 1 from public.lineups where id = p_lineup_id and owner_id = (select auth.uid())) then
    raise exception 'Lineup not found or not owned by the current user.' using errcode = '42501';
  end if;
  if not public.lineup_is_complete(p_lineup_id) then
    raise exception 'Lineup does not satisfy the Game Version Selection Schema.' using errcode = '23514';
  end if;
  update public.lineups set is_complete = true where id = p_lineup_id returning * into result;
  return result;
end;
$$;

create or replace function public.recommend_characters(p_profile_id uuid, p_target_game_version_id uuid)
returns table (
  character_id uuid,
  character_name text,
  rank integer,
  score numeric,
  support_count bigint,
  policy_version text
)
language sql
stable
security invoker
set search_path = ''
as $$
  with authorized as (
    select 1 where (select auth.uid()) = p_profile_id
  ), requester as (
    select signature.character_id, signature.normalized_weight
    from public.player_game_signatures signature, authorized
    where signature.profile_id = p_profile_id
      and signature.game_version_id <> p_target_game_version_id
  ), candidate_scores as (
    select
      population_target.character_id,
      sum(requester.normalized_weight * population_source.normalized_weight * population_target.normalized_weight)::numeric as score,
      count(distinct population_source.profile_id)::bigint as support_count
    from requester
    join public.player_game_signatures population_source
      on population_source.character_id = requester.character_id
      and population_source.profile_id <> p_profile_id
    join public.player_game_signatures population_target
      on population_target.profile_id = population_source.profile_id
      and population_target.game_version_id = p_target_game_version_id
    group by population_target.character_id
  ), ranked as (
    select
      candidate_scores.*,
      row_number() over (order by candidate_scores.score desc, candidate_scores.support_count desc, candidate_scores.character_id)::integer as candidate_rank
    from candidate_scores
    where candidate_scores.support_count > 0
  )
  select ranked.character_id, c.display_name, ranked.candidate_rank, ranked.score, ranked.support_count, 'association-v1'::text
  from ranked
  join public.characters c on c.id = ranked.character_id
  order by ranked.candidate_rank
  limit 20;
$$;

create or replace function public.export_my_profile()
returns jsonb
language sql
stable
security invoker
set search_path = ''
as $$
  select jsonb_build_object(
    'schemaVersion', 1,
    'exportedAt', now(),
    'profile', (select to_jsonb(p) from public.profiles p where p.id = (select auth.uid())),
    'lineups', coalesce((
      select jsonb_agg(to_jsonb(l) || jsonb_build_object(
        'picks', coalesce((select jsonb_agg(to_jsonb(cp) order by cp.slot_index) from public.character_picks cp where cp.lineup_id = l.id), '[]'::jsonb)
      ) order by l.sort_order, l.created_at)
      from public.lineups l where l.owner_id = (select auth.uid())
    ), '[]'::jsonb),
    'recommendationRuns', coalesce((select jsonb_agg(to_jsonb(r)) from public.recommendation_runs r where r.owner_id = (select auth.uid())), '[]'::jsonb),
    'feedback', coalesce((select jsonb_agg(to_jsonb(f)) from public.recommendation_feedback f where f.owner_id = (select auth.uid())), '[]'::jsonb)
  );
$$;

create or replace function public.delete_my_account()
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
begin
  if subject is null then
    raise exception 'Authentication required.' using errcode = '42501';
  end if;
  delete from auth.users where id = subject;
  if not found then
    raise exception 'Account was not deleted.' using errcode = 'P0001';
  end if;
end;
$$;

create or replace function mainstation_private.apply_profile_draft(
  p_owner uuid,
  p_payload jsonb,
  p_request_id uuid,
  p_replace boolean
)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  profile_payload jsonb;
  lineup_payload jsonb;
  pick_payload jsonb;
  lineups_payload jsonb;
  selection_schema jsonb;
  slot_schema jsonb;
  profile_handle text;
  profile_display_name text;
  profile_bio text;
  game_slug text;
  game_version uuid;
  lineup_id uuid;
  lineup_request_id uuid;
  character_id uuid;
  character_role public.character_role;
  lineup_options jsonb;
  pick_options jsonb;
  payload_request_id uuid;
  lineup_position integer := 0;
  pick_position integer;
begin
  if jsonb_typeof(p_payload) is distinct from 'object'
    or jsonb_typeof(p_payload -> 'version') is distinct from 'number'
    or p_payload -> 'version' is distinct from '1'::jsonb
  then
    raise exception 'Draft payload must be a version 1 object.' using errcode = '22023';
  end if;
  if pg_column_size(p_payload) > 65536 then
    raise exception 'Draft payload must be at most 64 KiB.' using errcode = '22023';
  end if;
  if jsonb_typeof(p_payload -> 'requestId') is distinct from 'string' then
    raise exception 'Draft payload requires a UUID requestId string.' using errcode = '22023';
  end if;
  begin
    payload_request_id := (p_payload ->> 'requestId')::uuid;
  exception when invalid_text_representation then
    raise exception 'Draft payload requires a UUID requestId string.' using errcode = '22023';
  end;
  if payload_request_id <> p_request_id then
    raise exception 'Draft payload requestId must match the RPC request id.' using errcode = '22023';
  end if;
  if jsonb_typeof(p_payload -> 'updatedAt') is distinct from 'string'
    or char_length(p_payload ->> 'updatedAt') not between 1 and 64
  then
    raise exception 'Draft payload requires an updatedAt string.' using errcode = '22023';
  end if;

  profile_payload := p_payload -> 'profile';
  lineups_payload := p_payload -> 'lineups';
  if jsonb_typeof(profile_payload) is distinct from 'object'
    or jsonb_typeof(lineups_payload) is distinct from 'array'
  then
    raise exception 'Draft payload requires profile and lineups.' using errcode = '22023';
  end if;
  if jsonb_typeof(profile_payload -> 'handle') is distinct from 'string'
    or jsonb_typeof(profile_payload -> 'displayName') is distinct from 'string'
    or (
      profile_payload ? 'bio'
      and jsonb_typeof(profile_payload -> 'bio') not in ('string', 'null')
    )
  then
    raise exception 'Draft profile fields must use their declared JSON types.' using errcode = '22023';
  end if;
  if jsonb_array_length(lineups_payload) > 100 then
    raise exception 'A draft can contain at most 100 Characters or Teams.' using errcode = '22023';
  end if;

  profile_handle := lower(btrim(coalesce(profile_payload ->> 'handle', '')));
  profile_display_name := btrim(coalesce(profile_payload ->> 'displayName', ''));
  profile_bio := nullif(btrim(coalesce(profile_payload ->> 'bio', '')), '');
  if profile_handle !~ '^[a-z0-9][a-z0-9-]{1,30}[a-z0-9]$' then
    raise exception 'Handle must be 3-32 lowercase letters, numbers, or interior hyphens.' using errcode = '22023';
  end if;
  if char_length(profile_display_name) not between 1 and 48 then
    raise exception 'Display name must be 1-48 characters.' using errcode = '22023';
  end if;
  if profile_bio is not null and char_length(profile_bio) > 160 then
    raise exception 'Bio must be at most 160 characters.' using errcode = '22023';
  end if;

  if p_replace then
    update public.profiles
    set handle = profile_handle, display_name = profile_display_name, bio = profile_bio
    where id = p_owner;
    if not found then
      raise exception 'Registered profile not found.' using errcode = 'P0002';
    end if;
    delete from public.lineups where owner_id = p_owner;
  else
    insert into public.profiles (id, handle, display_name, bio)
    values (p_owner, profile_handle, profile_display_name, profile_bio);
  end if;

  for lineup_payload in select value from jsonb_array_elements(lineups_payload)
  loop
    lineup_position := lineup_position + 1;
    if jsonb_typeof(lineup_payload) is distinct from 'object'
      or jsonb_typeof(lineup_payload -> 'picks') is distinct from 'array'
    then
      raise exception 'Draft stop % must be an object with picks.', lineup_position using errcode = '22023';
    end if;
    if jsonb_array_length(lineup_payload -> 'picks') > 8 then
      raise exception 'Draft stop % contains too many picks.', lineup_position using errcode = '22023';
    end if;
    if jsonb_typeof(lineup_payload -> 'id') is distinct from 'string'
      or jsonb_typeof(lineup_payload -> 'gameSlug') is distinct from 'string'
      or jsonb_typeof(lineup_payload -> 'category') is distinct from 'string'
      or jsonb_typeof(lineup_payload -> 'lifecycle') is distinct from 'string'
      or jsonb_typeof(lineup_payload -> 'visibility') is distinct from 'string'
      or jsonb_typeof(lineup_payload -> 'createdAt') is distinct from 'string'
      or char_length(lineup_payload ->> 'gameSlug') > 128
      or char_length(lineup_payload ->> 'createdAt') not between 1 and 64
    then
      raise exception 'Draft stop % fields must use their declared JSON types.', lineup_position using errcode = '22023';
    end if;

    begin
      lineup_request_id := (lineup_payload ->> 'id')::uuid;
    exception when invalid_text_representation then
      raise exception 'Draft stop % requires a UUID id.', lineup_position using errcode = '22023';
    end;

    game_slug := lineup_payload ->> 'gameSlug';
    select gv.id, gv.selection_schema into game_version, selection_schema
    from public.game_versions gv
    where gv.slug = game_slug and gv.active;
    if not found then
      raise exception 'Draft stop % references an unavailable Game Version.', lineup_position using errcode = '22023';
    end if;
    if not selection_schema @> '{"verified": true}'::jsonb then
      raise exception 'Draft stop % uses a Selection Schema still under review.', lineup_position using errcode = '22023';
    end if;
    if coalesce(lineup_payload ->> 'category', '') not in ('main', 'secondary')
      or coalesce(lineup_payload ->> 'lifecycle', '') not in ('active', 'retired')
      or coalesce(lineup_payload ->> 'visibility', '') not in ('public', 'private')
    then
      raise exception 'Draft stop % has an invalid classification.', lineup_position using errcode = '22023';
    end if;

    if coalesce(jsonb_array_length(selection_schema -> 'teamOptionValues'), 0) > 0 then
      if jsonb_typeof(lineup_payload -> 'teamOption') is distinct from 'string'
        or not ((selection_schema -> 'teamOptionValues') ? (lineup_payload ->> 'teamOption'))
      then
        raise exception 'Draft stop % has an invalid Team option.', lineup_position using errcode = '22023';
      end if;
      lineup_options := jsonb_build_object('selection', lineup_payload ->> 'teamOption');
    elsif lineup_payload ? 'teamOption' then
      raise exception 'Draft stop % supplies a Team option not declared by its Selection Schema.', lineup_position using errcode = '22023';
    else
      lineup_options := '{}'::jsonb;
    end if;

    insert into public.lineups (
      owner_id, game_version_id, category, lifecycle, visibility, options,
      sort_order, is_complete, client_request_id
    ) values (
      p_owner,
      game_version,
      (lineup_payload ->> 'category')::public.lineup_category,
      (lineup_payload ->> 'lifecycle')::public.lineup_lifecycle,
      (lineup_payload ->> 'visibility')::public.lineup_visibility,
      lineup_options,
      lineup_position - 1,
      false,
      lineup_request_id
    ) returning id into lineup_id;

    pick_position := 0;
    for pick_payload in select value from jsonb_array_elements(lineup_payload -> 'picks')
    loop
      if jsonb_typeof(pick_payload) is distinct from 'object' then
        raise exception 'Draft stop % contains an invalid pick.', lineup_position using errcode = '22023';
      end if;
      if jsonb_typeof(pick_payload -> 'slotId') is distinct from 'string'
        or jsonb_typeof(pick_payload -> 'characterSlug') is distinct from 'string'
        or char_length(pick_payload ->> 'slotId') > 48
        or char_length(pick_payload ->> 'characterSlug') > 128
        or (
          pick_payload ? 'option'
          and jsonb_typeof(pick_payload -> 'option') is distinct from 'string'
        )
      then
        raise exception 'Draft stop % contains Pick fields with invalid JSON types.', lineup_position using errcode = '22023';
      end if;

      select slot.value into slot_schema
      from jsonb_array_elements(selection_schema -> 'slots') as slot(value)
      where slot.value ->> 'id' = pick_payload ->> 'slotId';
      if not found then
        raise exception 'Draft stop % contains an unknown slot.', lineup_position using errcode = '22023';
      end if;

      begin
        select c.id, c.roster_role into strict character_id, character_role
        from public.characters c
        where c.game_version_id = game_version
          and c.slug = pick_payload ->> 'characterSlug'
          and c.is_playable
          and c.roster_status <> 'retired'
          and (slot_schema -> 'allowedRoles') ? c.roster_role::text;
      exception
        when no_data_found then
          raise exception 'Draft stop % contains an unavailable Character for its slot.', lineup_position using errcode = '22023';
        when too_many_rows then
          raise exception 'Draft stop % contains an ambiguous Character identity.', lineup_position using errcode = '22023';
      end;

      if coalesce(jsonb_array_length(slot_schema -> 'optionValues'), 0) > 0 then
        if jsonb_typeof(pick_payload -> 'option') is distinct from 'string'
          or not ((slot_schema -> 'optionValues') ? (pick_payload ->> 'option'))
        then
          raise exception 'Draft stop % has an invalid option for slot %.', lineup_position, pick_payload ->> 'slotId' using errcode = '22023';
        end if;
        pick_options := jsonb_build_object('selection', pick_payload ->> 'option');
      elsif pick_payload ? 'option' then
        raise exception 'Draft stop % supplies an option not declared for slot %.', lineup_position, pick_payload ->> 'slotId' using errcode = '22023';
      else
        pick_options := '{}'::jsonb;
      end if;

      insert into public.character_picks (
        lineup_id, game_version_id, character_id, slot_id, slot_index, pick_kind, options
      ) values (
        lineup_id,
        game_version,
        character_id,
        pick_payload ->> 'slotId',
        pick_position,
        character_role,
        pick_options
      );
      pick_position := pick_position + 1;
    end loop;

    if not public.lineup_is_complete(lineup_id) then
      raise exception 'Draft stop % does not satisfy its Selection Schema.', lineup_position using errcode = '23514';
    end if;
    update public.lineups set is_complete = true where id = lineup_id;
  end loop;

  return jsonb_build_object(
    'profileId', p_owner,
    'handle', profile_handle,
    'profilePath', '/p/' || profile_handle,
    'lineupCount', jsonb_array_length(lineups_payload)
  );
end;
$$;

create or replace function public.claim_profile_draft(p_payload jsonb, p_request_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  receipt_response jsonb;
  receipt_completed_at timestamptz;
  result jsonb;
begin
  if subject is null then
    raise exception 'Authentication required.' using errcode = '42501';
  end if;
  perform pg_catalog.pg_advisory_xact_lock(pg_catalog.hashtextextended(subject::text, 0));

  insert into public.profile_claims (owner_id, request_id)
  values (subject, p_request_id)
  on conflict (owner_id, request_id) do nothing;

  select response, completed_at into receipt_response, receipt_completed_at
  from public.profile_claims
  where owner_id = subject and request_id = p_request_id
  for update;

  if receipt_completed_at is not null then
    return receipt_response;
  end if;
  if exists (select 1 from public.profiles where id = subject) then
    raise exception 'This account already owns a MainStation profile. Use registered save instead.' using errcode = '23505';
  end if;

  result := mainstation_private.apply_profile_draft(subject, p_payload, p_request_id, false);
  update public.profile_claims
  set response = result, completed_at = now()
  where owner_id = subject and request_id = p_request_id;
  return result;
end;
$$;

create or replace function public.save_my_profile_draft(p_payload jsonb, p_request_id uuid)
returns jsonb
language plpgsql
security definer
set search_path = ''
as $$
declare
  subject uuid := (select auth.uid());
  receipt_response jsonb;
  receipt_completed_at timestamptz;
  result jsonb;
begin
  if subject is null then
    raise exception 'Authentication required.' using errcode = '42501';
  end if;
  perform pg_catalog.pg_advisory_xact_lock(pg_catalog.hashtextextended(subject::text, 0));
  if not exists (select 1 from public.profiles where id = subject) then
    raise exception 'Claim a guest draft before registered save.' using errcode = 'P0002';
  end if;

  insert into public.profile_claims (owner_id, request_id)
  values (subject, p_request_id)
  on conflict (owner_id, request_id) do nothing;

  select response, completed_at into receipt_response, receipt_completed_at
  from public.profile_claims
  where owner_id = subject and request_id = p_request_id
  for update;

  if receipt_completed_at is not null then
    return receipt_response;
  end if;

  result := mainstation_private.apply_profile_draft(subject, p_payload, p_request_id, true);
  update public.profile_claims
  set response = result, completed_at = now()
  where owner_id = subject and request_id = p_request_id;
  return result;
end;
$$;

revoke all on function public.selection_schema_is_valid(jsonb) from public, anon, authenticated, service_role;
revoke all on function public.set_updated_at() from public, anon, authenticated, service_role;
revoke all on function public.enforce_pick_lineup_game() from public, anon, authenticated, service_role;
revoke all on function public.lineup_is_complete(uuid) from public, anon, authenticated, service_role;
revoke all on function public.lineup_is_publishable(uuid) from public, anon, authenticated, service_role;
revoke all on function public.prevent_invalid_complete_lineup() from public, anon, authenticated, service_role;
revoke all on function public.prevent_invalid_complete_lineup_after_pick() from public, anon, authenticated, service_role;
revoke all on function public.revalidate_lineups_after_schema_change() from public, anon, authenticated, service_role;
revoke all on function public.revalidate_lineups_after_character_change() from public, anon, authenticated, service_role;
revoke all on function public.finalize_lineup(uuid) from public, anon, authenticated, service_role;
revoke all on function public.recommend_characters(uuid, uuid) from public, anon, authenticated, service_role;
revoke all on function public.export_my_profile() from public, anon, authenticated, service_role;
revoke all on function public.delete_my_account() from public, anon, authenticated, service_role;
revoke all on function mainstation_private.apply_profile_draft(uuid, jsonb, uuid, boolean) from public, anon, authenticated, service_role;
revoke all on function public.claim_profile_draft(jsonb, uuid) from public, anon, authenticated, service_role;
revoke all on function public.save_my_profile_draft(jsonb, uuid) from public, anon, authenticated, service_role;
grant execute on function public.selection_schema_is_valid(jsonb) to service_role;
grant execute on function public.lineup_is_complete(uuid) to authenticated, service_role;
grant execute on function public.lineup_is_publishable(uuid) to anon, authenticated, service_role;
grant execute on function public.finalize_lineup(uuid) to authenticated;
grant execute on function public.recommend_characters(uuid, uuid) to authenticated;
grant execute on function public.export_my_profile() to authenticated;
grant execute on function public.delete_my_account() to authenticated;
grant execute on function public.claim_profile_draft(jsonb, uuid) to authenticated;
grant execute on function public.save_my_profile_draft(jsonb, uuid) to authenticated;

comment on table public.recommendation_feedback is 'Analytics-only launch feedback. No signature or recommendation function may reference this table.';
comment on view public.player_game_signatures is 'Normalized signature-v1: each eligible Player contributes exactly one total unit per Game Version.';
comment on function public.delete_my_account() is 'Deletes source account data. Current views derive directly from eligible rows, so removal is immediate; any future cache must finish physical cleanup within 24 hours.';
