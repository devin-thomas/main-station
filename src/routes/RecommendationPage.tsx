import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { catalog, catalogBySlug } from '../data/catalog';
import { useAuth } from '../features/auth/AuthProvider';
import { useDraft } from '../features/draft/DraftProvider';
import {
  runRecommendations,
  saveRecommendationFeedback,
  type RecommendationFeedback,
  type RecommendationRun,
} from '../features/recommendations/recommendations';
import { supabaseConfigured } from '../lib/supabase';

const feedbackLabels: Record<RecommendationFeedback, string> = {
  would_try: 'Would try',
  not_for_me: 'Not for me',
  already_play: 'Already play',
};

export function RecommendationPage() {
  const { draft } = useDraft();
  const { session, sessionLoading, registeredHandle, profileLoading } = useAuth();
  const [target, setTarget] = useState('umvc3');
  const [run, setRun] = useState<RecommendationRun | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [feedback, setFeedback] = useState<Record<string, RecommendationFeedback>>({});
  const [feedbackPending, setFeedbackPending] = useState<string | null>(null);
  const [feedbackError, setFeedbackError] = useState<string | null>(null);
  const [online, setOnline] = useState(() => navigator.onLine);
  const targetGame = catalogBySlug.get(target) ?? catalog[0];
  const eligibleStops = useMemo(
    () => draft.lineups.filter((lineup) => lineup.visibility === 'public' && lineup.gameSlug !== target),
    [draft.lineups, target],
  );

  useEffect(() => {
    const updateConnection = () => setOnline(navigator.onLine);
    window.addEventListener('online', updateConnection);
    window.addEventListener('offline', updateConnection);
    return () => {
      window.removeEventListener('online', updateConnection);
      window.removeEventListener('offline', updateConnection);
    };
  }, []);

  function chooseTarget(nextTarget: string) {
    setTarget(nextTarget);
    setRun(null);
    setError(null);
    setFeedback({});
    setFeedbackError(null);
  }

  async function requestRecommendations() {
    setError(null);
    setFeedbackError(null);
    if (!online) {
      setError('Fresh recommendations require a network connection. No stale result is being presented as current.');
      return;
    }
    if (!session || !registeredHandle) {
      setError('Sign in and claim a complete registered Mainline before requesting profile-based recommendations.');
      return;
    }
    setLoading(true);
    try {
      setRun(await runRecommendations(target));
    } catch (recommendationError) {
      setRun(null);
      setError(recommendationError instanceof Error ? recommendationError.message : 'The recommendation run failed.');
    } finally {
      setLoading(false);
    }
  }

  async function recordFeedback(characterId: string, response: RecommendationFeedback) {
    if (!run) return;
    setFeedbackError(null);
    setFeedbackPending(characterId);
    try {
      await saveRecommendationFeedback(run.runId, characterId, response);
      setFeedback((current) => ({ ...current, [characterId]: response }));
    } catch (saveError) {
      setFeedbackError(saveError instanceof Error ? saveError.message : 'Recommendation feedback could not be saved.');
    } finally {
      setFeedbackPending(null);
    }
  }

  const supportLoaded = run?.candidates.length
    ? `${Math.max(...run.candidates.map((candidate) => candidate.supportCount)).toLocaleString()} players max`
    : run
      ? '0 players'
      : 'Not requested';

  return (
    <div className="recommend-page page-frame">
      <header className="page-title">
        <div><p className="eyebrow">CROSS-GAME ROUTING / ASSOCIATION-V1</p><h1>Choose the next stop.</h1></div>
        <p>Recommendations rank only observed links among registered public profiles. A private local draft never enters the model.</p>
      </header>

      <div className="recommend-console">
        <section className="recommend-console__target" aria-labelledby="target-heading">
          <p className="eyebrow">01 / TARGET GAME</p>
          <h2 id="target-heading">Where are you going?</h2>
          <label className="field-row">
            <span>Game Version</span>
            <select value={target} onChange={(event) => chooseTarget(event.target.value)}>
              {catalog.map((game) => <option value={game.slug} key={game.slug}>{game.name}</option>)}
            </select>
          </label>
          <dl className="route-evidence">
            <div><dt>Local public stops</dt><dd>{eligibleStops.length} not submitted</dd></div>
            <div><dt>Registered support loaded</dt><dd>{supportLoaded}</dd></div>
            <div><dt>Policy</dt><dd>association-v1</dd></div>
          </dl>
          <button
            type="button"
            className="button-primary recommend-console__run"
            disabled={loading || sessionLoading || profileLoading || !online || !supabaseConfigured}
            onClick={() => void requestRecommendations()}
          >
            {loading ? 'Reading public graph...' : 'Run current recommendation'}
          </button>
          {!sessionLoading && !session && <p className="fine-print">Sign in to use your profile: <Link className="text-link" to="/settings?next=%2Frecommend">continue to account</Link>.</p>}
          {!profileLoading && session && !registeredHandle && <p className="fine-print">Claim your local draft in <Link className="text-link" to="/settings">your account</Link> first.</p>}
        </section>

        <section className="recommend-console__result" aria-labelledby="result-heading">
          <div className="route-branch" aria-hidden="true"><span /></div>
          <p className="eyebrow">02 / {targetGame.shortName} CANDIDATES</p>
          {error ? (
            <>
              <h2 id="result-heading">Route unavailable.</h2>
              <p className="inline-error" role="alert">{error}</p>
              <div className="command-row"><Link className="button-secondary" to="/settings?next=%2Frecommend">Check account</Link></div>
            </>
          ) : loading ? (
            <><h2 id="result-heading">Reading observed links.</h2><p role="status">Computing from eligible registered public Mainlines and recording the audit run.</p></>
          ) : run?.candidates.length ? (
            <>
              <h2 id="result-heading">Observed routes into {targetGame.shortName}.</h2>
              <p>Support is the distinct contributing Player count behind each association. Feedback is analytics-only and cannot change this ranking.</p>
              <ol className="recommend-results">
                {run.candidates.map((candidate) => (
                  <li key={candidate.characterId}>
                    <span className="recommend-results__rank">{String(candidate.rank).padStart(2, '0')}</span>
                    <div>
                      <Link to={`/games/${targetGame.slug}/characters/${candidate.characterSlug}`}>{candidate.characterName}</Link>
                      <small>score {candidate.score.toFixed(4)} · {candidate.policyVersion}</small>
                    </div>
                    <strong>{candidate.supportCount} {candidate.supportCount === 1 ? 'player' : 'players'}</strong>
                    <div className="recommend-results__feedback" aria-label={`Feedback for ${candidate.characterName}`}>
                      {(Object.entries(feedbackLabels) as [RecommendationFeedback, string][]).map(([response, label]) => (
                        <button
                          type="button"
                          className={feedback[candidate.characterId] === response ? 'button-quiet button-quiet--selected' : 'button-quiet'}
                          disabled={feedbackPending === candidate.characterId}
                          aria-pressed={feedback[candidate.characterId] === response}
                          key={response}
                          onClick={() => void recordFeedback(candidate.characterId, response)}
                        >{label}</button>
                      ))}
                    </div>
                  </li>
                ))}
              </ol>
              {feedbackError && <p className="inline-error" role="alert">{feedbackError}</p>}
              <p className="fine-print">Run {run.runId.slice(0, 8)} · {new Date(run.createdAt).toLocaleString()}</p>
            </>
          ) : run ? (
            <>
              <h2 id="result-heading">Not enough public data yet.</h2>
              <p>This run found zero registered cross-game associations, so MainStation did not substitute popularity, founder opinion, or an authored match.</p>
              <div className="support-zero"><span>SUPPORT</span><strong>0 players</strong></div>
              <div className="command-row">
                <Link className="button-primary" to="/build">Complete your Mainline</Link>
                <Link className="button-secondary" to={`/games/${targetGame.slug}`}>Inspect {targetGame.shortName}</Link>
              </div>
            </>
          ) : (
            <>
              <h2 id="result-heading">No route has been requested.</h2>
              <p>Choose a target and run the registered profile graph. MainStation records the exact returned candidates so later feedback cannot rewrite the evidence.</p>
              <div className="support-zero"><span>STATUS</span><strong>Awaiting run</strong></div>
            </>
          )}
        </section>
      </div>
    </div>
  );
}
