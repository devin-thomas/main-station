import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import { catalog, catalogBySlug } from '../data/catalog';
import { useAuth } from '../features/auth/AuthProvider';
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
      setError('Recommendations require an internet connection.');
      return;
    }
    if (!session) {
      setError('Sign in and save your profile before requesting recommendations.');
      return;
    }
    if (!registeredHandle) {
      setError('Finish your profile setup before requesting recommendations.');
      return;
    }
    setLoading(true);
    try {
      setRun(await runRecommendations(target));
    } catch {
      setRun(null);
      setError('Recommendations could not be loaded.');
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
    } catch {
      setFeedbackError('Your feedback could not be saved.');
    } finally {
      setFeedbackPending(null);
    }
  }

  return (
    <div className="recommend-page page-frame">
      <header className="page-title">
        <h1>Recommendations</h1>
        <p>Based on saved public profiles. Private entries and drafts stay excluded.</p>
      </header>

      <div className="recommend-console">
        <section className="recommend-console__target" aria-labelledby="target-heading">
          <h2 id="target-heading">Find a character</h2>
          <label className="field-row">
            <span>Game</span>
            <select value={target} onChange={(event) => chooseTarget(event.target.value)}>
              {catalog.map((game) => <option value={game.slug} key={game.slug}>{game.name}</option>)}
            </select>
          </label>
          <button
            type="button"
            className="button-primary recommend-console__run"
            disabled={loading || sessionLoading || profileLoading || !online || !supabaseConfigured}
            onClick={() => void requestRecommendations()}
          >
            {loading ? 'Finding matches...' : 'Find matches'}
          </button>
          {!online && <p className="inline-status" role="status">Recommendations require an internet connection.</p>}
          {!supabaseConfigured && <p className="inline-status" role="status">Recommendations are currently unavailable.</p>}
          {!sessionLoading && !session && <p className="fine-print"><Link className="text-link" to="/settings?next=%2Frecommend">Sign in</Link> to get recommendations.</p>}
          {!profileLoading && session && !registeredHandle && <p className="fine-print">Finish <Link className="text-link" to="/settings">your profile setup</Link> before using recommendations.</p>}
        </section>

        <section className="recommend-console__result" aria-labelledby="result-heading">
          <div className="route-branch" aria-hidden="true"><span /></div>
          {error ? (
            <div className="inline-error" role="alert"><h2 id="result-heading">{error}</h2></div>
          ) : loading ? (
            <h2 id="result-heading" aria-live="polite">Finding matches...</h2>
          ) : run?.candidates.length ? (
            <>
              <h2 id="result-heading">{targetGame.shortName} matches</h2>
              <p>Each count shows the players behind that match. Feedback does not affect rankings.</p>
              <ol className="recommend-results">
                {run.candidates.map((candidate) => (
                  <li key={candidate.characterId}>
                    <span className="recommend-results__rank">{String(candidate.rank).padStart(2, '0')}</span>
                    <div>
                      <Link to={`/games/${targetGame.slug}/characters/${candidate.characterSlug}`}>{candidate.characterName}</Link>
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
              <p className="fine-print">Updated {new Date(run.createdAt).toLocaleString()}</p>
            </>
          ) : run ? (
            <>
              <h2 id="result-heading">Not enough public data yet</h2>
              <p>No players connect your saved characters to {targetGame.shortName} yet.</p>
              <div className="command-row">
                <Link className="button-primary" to="/build">Complete your Mainline</Link>
                <Link className="button-secondary" to={`/games/${targetGame.slug}`}>Browse {targetGame.shortName}</Link>
              </div>
            </>
          ) : (
            <h2 id="result-heading">No matches requested</h2>
          )}
        </section>
      </div>
    </div>
  );
}
