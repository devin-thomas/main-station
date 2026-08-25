-- Avatar Legends exposes a character-specific support picker backed by a
-- shared catalog of more than 32 names. Keep the schema bounded, but allow
-- the current 35-name union without weakening the option value checks.
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
            and jsonb_array_length(slot.value -> 'optionValues') <= 64
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
