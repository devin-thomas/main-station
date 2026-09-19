# Email sender setup (deferred)

Email sign-in works, but it is not fit for public traffic until MainStation sends its own
mail. This is the runbook for finishing that. **Deferred 2026-09-19: waiting on a domain.**

## Why it is blocked

Supabase's built-in email provider imposes three limits at once, none of which the
application can work around:

| Limit | Effect |
| --- | --- |
| `rate_limit_email_sent = 2` | Two sign-in emails per hour, for the entire project |
| Template customisation refused on free tier with the default provider | The mail cannot say MainStation anywhere |
| `smtp_sender_name` refused without custom SMTP | Sender stays `Supabase Auth <noreply@mail.app.supabase.io>` |

The exact refusal, from the Management API: *"Email template modification is not available
for free tier projects using the default email provider. Please upgrade your plan or
configure a custom SMTP provider."*

Configuring any SMTP provider lifts all three together. A Resend account exists; what is
missing is a verified sending domain. Resend's fallback sender, `onboarding@resend.dev`, only
delivers to the account holder's own address, so wiring it up would leave public sign-in
exactly as restricted as it is now. Verify a domain first.

Until then, **Discord is the sign-in path that works for real users.** It is fully configured
and carries none of these limits.

## Finish it

1. **Verify a domain in Resend** and add the DNS records it asks for. A subdomain such as
   `mail.<your-domain>` keeps sending reputation separate from your main domain.
2. **Create a Resend API key.** Supply it to the session as the `RESEND_API_KEY` environment
   variable rather than pasting it into a conversation.
3. **Point Supabase Auth at it.** `PATCH https://api.supabase.com/v1/projects/bqfzzrasfunysseoogcg/config/auth`:

   ```json
   {
     "smtp_host": "smtp.resend.com",
     "smtp_port": 465,
     "smtp_user": "resend",
     "smtp_pass": "<RESEND_API_KEY>",
     "smtp_admin_email": "noreply@mail.<your-domain>",
     "smtp_sender_name": "MainStation",
     "rate_limit_email_sent": 30
   }
   ```

   Set `smtp_admin_email` to an address on the domain verified in step 1; Resend rejects
   anything else. Raise `rate_limit_email_sent` to whatever suits expected signup volume.
4. **Apply the branded templates below**, in the same request or a follow-up. They are
   refused until custom SMTP is configured.
5. **Verify**: request a link from the deployed sign-in form, confirm the subject names
   MainStation and the sender is your domain, then open the link *in the same browser* and
   confirm it signs in. That also closes the browser round trip left open in
   `docs/releases/2026-09-19-public-release.md`.

## Templates

Written and validated against Supabase's template variables, held here because the API
refuses them until custom SMTP exists. Subjects:

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
