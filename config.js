// Collegamento a Supabase per l'accesso con email.
// Trovi i due valori nel tuo progetto Supabase: Project Settings → API Keys (o Data API).
// Usa la chiave "publishable" (inizia con sb_publishable_) oppure la "anon public".
// NON incollare mai la chiave "secret" o "service_role": quella non deve finire su GitHub.
// Se lasci i campi vuoti, il diario funziona lo stesso ma si salva solo nel browser.

window.DIARIO_CONFIG = {
  supabaseUrl: "https://vjiftnqlavfmctqicbek.supabase.co",
  supabaseKey: "sb_publishable_TerVtyhAGP-1AppW_EidQw_VBol8QVW"    // es. "sb_publishable_xxxxxxxxxxxxxxxx"
};
