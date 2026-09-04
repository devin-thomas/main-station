export type IconName = 'arrow-down' | 'arrow-up' | 'check' | 'chevron-right' | 'compass' | 'pencil' | 'plus' | 'settings' | 'trash-2' | 'user-round' | 'x';

/** Decorative glyphs; the containing control supplies its accessible name. */
export function Icon({ name }: { name: IconName }) {
  return <span className={`ui-icon ui-icon--${name}`} aria-hidden="true" />;
}
