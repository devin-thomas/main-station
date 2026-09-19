# Email sender setup

MainStation sends its own authentication mail through Resend. **Configured and verified
2026-09-19.**

| Setting | Value |
| --- | --- |
| Provider | Resend, `smtp.resend.com:465`, user `resend` |
| Sender | `MainStation <mainstation@lilgohan.com>` |
| Domain | `lilgohan.com`, verified in Resend, sending enabled, us-east-1 |
| DNS | DKIM, SPF, and bounce MX published via Cloudflare's Resend integration |
| `rate_limit_email_sent` | 30 per hour |

Verified end to end: a sign-in request to the deployed origin produced a Resend delivery
logged as `delivered`, from `"MainStation" <mainstation@lilgohan.com>` with subject
*"Your MainStation sign-in link"*.

## What this replaced

Supabase's built-in provider imposed three limits at once, none of which the application
could work around:

| Limit | Effect |
| --- | --- |
| `rate_limit_email_sent = 2` | Two sign-in emails per hour, for the entire project |
| Template customisation refused on free tier with the default provider | The mail could not say MainStation anywhere |
| `smtp_sender_name` refused without custom SMTP | Sender was `Supabase Auth <noreply@mail.app.supabase.io>` |

The exact refusal, from the Management API: *"Email template modification is not available
for free tier projects using the default email provider. Please upgrade your plan or
configure a custom SMTP provider."*

## Rollback

Clear the `smtp_*` fields on the project's auth config and Supabase falls back to its
built-in provider, at two emails per hour with generic templates. Auth keeps working.

## Gotchas met on the way

- `smtp_port` must be sent as a **string** (`"465"`); a number is rejected with
  `smtp_port: Invalid input: expected string, received number`.
- `api.resend.com` sits behind Cloudflare bot protection and returns `403 error code: 1010`
  to a default Python user-agent. Send a normal browser user-agent when querying it.

## Steps, for reference or a rebuild

1. **Verify a domain in Resend** and add the DNS records it asks for. A subdomain such as
   `mail.<your-domain>` keeps sending reputation separate from your main domain.
2. **Create a Resend API key.** Supply it to the session as the `RESEND_API_KEY` environment
   variable rather than pasting it into a conversation.
3. **Point Supabase Auth at it.** `PATCH https://api.supabase.com/v1/projects/bqfzzrasfunysseoogcg/config/auth`:

   ```json
   {
     "smtp_host": "smtp.resend.com",
     "smtp_port": "465",
     "smtp_user": "resend",
     "smtp_pass": "<RESEND_API_KEY>",
     "smtp_admin_email": "noreply@mail.<your-domain>",
     "smtp_sender_name": "MainStation",
     "rate_limit_email_sent": 30
   }
   ```

   Set `smtp_admin_email` to an address on the domain verified in step 1; Resend rejects
   anything else. Raise `rate_limit_email_sent` to whatever suits expected signup volume.
4. **Apply the branded templates below**, in the same request or a follow-up. Supabase
   refuses them while the default provider is in use, so custom SMTP must land first.
5. **Verify**: request a link from the deployed sign-in form, confirm the subject names
   MainStation and the sender is your domain, then open the link *in the same browser* and
   confirm it signs in. That also closes the browser round trip left open in
   `docs/releases/2026-09-19-public-release.md`.

## Templates

Applied to the project on 2026-09-19 and recorded here so they can be rebuilt or edited.
Subjects:

| Key | Value |
| --- | --- |
| `mailer_subjects_confirmation` | `Confirm your email for MainStation` |
| `mailer_subjects_magic_link` | `Your MainStation sign-in link` |
| `mailer_subjects_email_change` | `Confirm your new MainStation email` |
| `mailer_subjects_reauthentication` | `Your MainStation verification code` |
| `mailer_subjects_invite` | `You have been invited to MainStation` |

`mailer_templates_confirmation_content`:

```html
<h2>Confirm your email for MainStation</h2>

<p>You asked to create a MainStation profile &mdash; your fighting-game main history, in one place.</p>

<p><a href="{{ .ConfirmationURL }}">Confirm your email and sign in</a></p>

<p>Open this link in the same browser you requested it from, or it cannot complete the sign-in.</p>

<p>This link expires shortly. If you did not ask for it, you can ignore this email and no account is created.</p>

<p>&mdash; MainStation &middot; mainstation.uppercut-labs.workers.dev</p>
```

`mailer_templates_magic_link_content`:

```html
<h2>Your MainStation sign-in link</h2>

<p>Follow the link below to sign in to MainStation.</p>

<p><a href="{{ .ConfirmationURL }}">Sign in to MainStation</a></p>

<p>Open this link in the same browser you requested it from, or it cannot complete the sign-in.</p>

<p>This link expires shortly and can be used once. If you did not ask to sign in, you can ignore this email.</p>

<p>&mdash; MainStation &middot; mainstation.uppercut-labs.workers.dev</p>
```

`mailer_templates_email_change_content`:

```html
<h2>Confirm your new MainStation email</h2>

<p>Follow the link below to confirm {{ .NewEmail }} as the email address for your MainStation account.</p>

<p><a href="{{ .ConfirmationURL }}">Confirm the change</a></p>

<p>If you did not ask for this, ignore this email and the address stays as it is.</p>

<p>&mdash; MainStation &middot; mainstation.uppercut-labs.workers.dev</p>
```

`mailer_templates_reauthentication_content`:

```html
<h2>Your MainStation verification code</h2>

<p>Use this code to confirm it is you: <strong>{{ .Token }}</strong></p>

<p>It expires shortly. If you did not ask for it, ignore this email.</p>

<p>&mdash; MainStation &middot; mainstation.uppercut-labs.workers.dev</p>
```

The "same browser" line in the two sign-in templates is deliberate. The app uses PKCE, so the
code verifier lives in the browser that requested the link; opening it in a mail client's
in-app browser cannot complete the exchange. The callback explains this too, but saying it
before the tap avoids the failure entirely.
