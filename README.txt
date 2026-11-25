CleanMap V1.1 — TEST BUILD
==========================

Included:
- Separate V1.1 package; original V1 files preserved in original_v1_backup/
- Current single-photo site updates.
- Update status selector: waste present / not cleaned or community-reported cleaned.
- Newest update appears first.
- Pins turn green when marked community-reported cleaned.
- Counters for reported waste sites and cleaned sites.
- Cleanup workflow disabled in the site detail panel.
- Camera capture request via HTML capture="environment" (not enforceable in all browsers).
- Book-support and partner banner placeholders.
- Supabase JS SDK and Google OAuth sign-in scaffold.

IMPORTANT BACKEND STATUS:
This V1.1 prototype is STILL LOCAL DEMO MODE for map submissions, pins and photo updates.
Supabase OAuth login scaffold can be configured, but site submissions, site updates and images
are not yet stored in Supabase or shared between users. Do not publish it as a shared live
community database until this is implemented and tested.

Supabase setup for the sign-in scaffold:
1. Create a Supabase project.
2. In Authentication > Providers, configure Google OAuth credentials.
3. In Supabase Authentication URL settings, set the deployed website URL and redirect URLs.
4. Copy the project URL and anon/public key (never service-role key).
5. In index.html, replace window.CLEANMAP_SUPABASE url and anonKey.
6. Test login on HTTPS.

The SQL in supabase_schema.sql is a STARTER and is not wired to app.js submissions.
Review and refine RLS policies, storage policies, moderation, abuse prevention and privacy before
connecting it to public submissions. Never put service-role keys in front-end code.

Edit:
- Google Play Books link: index.html, replace the placeholder href on #bookLink.
- Company/partner banner: edit the .company-banner section in index.html.
- Email address: replace EDIT_EMAIL_HERE in the mailto link.
- Supabase configuration: window.CLEANMAP_SUPABASE in index.html.

Camera-only limitations:
capture="environment" requests the device camera in browsers that support it, but a web app
cannot reliably prevent every browser/platform from allowing gallery selection. Strict camera-only
capture requires a native Android/iOS app or a platform-specific controlled flow and still needs
server-side validation.

Static web deployment:
Use the same static hosting setup as V1.1/V1 (HTML/CSS/JS; no build step). Deploy on HTTPS.

Privacy and safety:
Images are resized in the browser before local storage; this is not backend validation or a secure
shared upload process. localStorage limits apply. The public OSM tile and Nominatim services
have usage policies. This build remains a test prototype.
