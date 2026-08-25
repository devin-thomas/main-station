update public.game_versions
set selection_schema = '{
  "version": 1,
  "noun": "Team",
  "verified": true,
  "ordered": true,
  "uniqueCharacters": true,
  "slots": [
    {"id": "point", "label": "Point", "allowedRoles": ["fighter"]},
    {"id": "assist", "label": "Assist", "allowedRoles": ["fighter"]}
  ],
  "teamOptionLabel": "Fuse",
  "teamOptionValues": ["Double Down", "Juggernaut", "Sidekick", "2X Assist", "Freestyle", "Teamfight"],
  "constraintNote": "Riot does not publish a same-Champion team rule. MainStation conservatively requires distinct Point and Assist picks so saved teams remain valid under either outcome."
}'::jsonb,
source_checked_at = '2026-08-25T00:00:00Z'
where slug = '2xko';
