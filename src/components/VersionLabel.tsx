const redundantLabels = new Set(['Current live roster', 'Current official roster', 'Ultimate roster', 'Plus R']);

export function VersionLabel({ label, className }: { label: string; className?: string }) {
  if (redundantLabels.has(label)) return null;
  return <small className={className}>{label}</small>;
}
