create schema if not exists mainstation_policy;
revoke all on schema mainstation_policy from public, anon, authenticated, service_role;

create or replace function mainstation_policy.lineup_is_publishable(p_lineup_id uuid)
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

revoke all on function mainstation_policy.lineup_is_publishable(uuid) from public, anon, authenticated, service_role;
grant usage on schema mainstation_policy to anon, authenticated, service_role;
grant execute on function mainstation_policy.lineup_is_publishable(uuid) to anon, authenticated, service_role;

drop policy lineups_public_or_owner_read on public.lineups;
create policy lineups_public_or_owner_read on public.lineups for select
using (mainstation_policy.lineup_is_publishable(id) or (select auth.uid()) = owner_id);

drop policy character_picks_public_or_owner_read on public.character_picks;
create policy character_picks_public_or_owner_read on public.character_picks for select
using (exists (
  select 1 from public.lineups l
  where l.id = character_picks.lineup_id
    and (mainstation_policy.lineup_is_publishable(l.id) or l.owner_id = (select auth.uid()))
));

create or replace view public.public_lineups
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
  and mainstation_policy.lineup_is_publishable(l.id);

drop function public.lineup_is_publishable(uuid);

comment on schema mainstation_policy is 'Non-exposed security helpers used by RLS and security-invoker views. Browser roles receive only schema usage and explicit helper execution.';
comment on function mainstation_policy.lineup_is_publishable(uuid) is 'Recomputes complete public Lineup eligibility without exposing the SECURITY DEFINER helper through the public API schema.';
