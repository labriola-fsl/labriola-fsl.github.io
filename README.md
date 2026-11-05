# Diario di bordo PCTO

Diario di bordo della formazione scuola-lavoro (FSL, ex PCTO) pensato per gli studenti del Liceo Scientifico Antonio Labriola.

Strumento personale: non è un servizio ufficiale della scuola e non sostituisce i moduli consegnati dai tutor.

## Cosa fa

- Accesso con email e password (oppure con un link via email): ogni studente ha il suo diario, salvato online e visibile solo a lui.
- Registro delle giornate: orario, ore calcolate in automatico, attività, competenze, riflessioni, firma del tutor.
- Catalogo dei percorsi FSL del Liceo Labriola (a.s. 2026/27 e 2025/26) con circolari e materie collegate.
- Controllo delle regole: 90 ore nel triennio, tre quarti delle ore di ogni percorso, Patto formativo, certificazione delle competenze, confronto con le ore certificate dalla scuola.
- Relazione finale in sei sezioni, con bozza automatica dai dati del diario e scaletta per le slide.
- Esportazioni: relazione in PDF, Word e Markdown; foglio presenze e diario di ogni progetto in PDF; registro per Excel (CSV); backup in JSON.

## File

| File | A cosa serve |
|---|---|
| `index.html` | L'app |
| `config.js` | I due dati del tuo progetto Supabase |
| `setup.sql` | Crea la tabella dei diari e le regole di sicurezza |
| `README.md` | Queste istruzioni |

## 1. Prepara Supabase (accesso con email)

1. Crea un account su [supabase.com](https://supabase.com) e poi **New project**. Come regione scegli una in Europa (per esempio Frankfurt). Annota la password del database: non serve all'app, ma Supabase la chiede.
2. Apri **SQL Editor**, incolla tutto il contenuto di `setup.sql` e premi **Run**. Deve comparire «Success».
3. Vai in **Authentication → Sign In / Providers → Email**. Lascia attivo il provider Email e **disattiva «Confirm email»**, poi salva.
   Motivo: il servizio email gratuito di Supabase manda messaggi solo ai membri del progetto e al massimo 2 all'ora, quindi i tuoi compagni non riceverebbero l'email di conferma. Senza conferma, ci si registra con email e password e si entra subito.
4. Vai in **Authentication → URL Configuration**:
   - **Site URL**: l'indirizzo del sito su GitHub Pages, per esempio `https://tuonome.github.io/diario-pcto/`
   - **Redirect URLs**: aggiungi lo stesso indirizzo.
5. Vai in **Project Settings → API Keys** e copia:
   - il **Project URL** (`https://....supabase.co`), che trovi anche in Project Settings → Data API;
   - la chiave **publishable** (`sb_publishable_...`) oppure, se non c'è, la chiave **anon public**.
6. Apri `config.js` e incolla i due valori tra le virgolette.

La chiave publishable è fatta per stare in una pagina pubblica: i dati sono protetti dalle regole create con `setup.sql`, per cui ogni studente legge e modifica solo il proprio diario. **Non mettere mai la chiave secret o service_role in `config.js`.**

### Facoltativo: link via email e «Password dimenticata?»

Questi due pulsanti mandano un'email, quindi funzionano per tutti solo se colleghi un servizio email (SMTP). Brevo e Resend hanno piani gratuiti:
**Authentication → Emails → SMTP Settings** in Supabase, con i dati forniti dal servizio. Finché non lo fai, l'app spiega allo studente di usare email e password.

## 2. Pubblica su GitHub Pages

1. Su GitHub crea un repository **pubblico**, per esempio `diario-pcto`.
2. **Add file → Upload files**: carica `index.html`, `config.js`, `setup.sql` e `README.md`, poi **Commit changes**.
3. **Settings → Pages → Build and deployment**: Source «Deploy from a branch», branch `main`, cartella `/ (root)` → **Save**.
4. Dopo un paio di minuti il sito è online su `https://tuonome.github.io/diario-pcto/`. Controlla che sia lo stesso indirizzo messo in Supabase al passo 4.

Per aggiornare `config.js` in seguito: aprilo su GitHub, tocca la matita, incolla i valori e fai **Commit changes**.

## Dove finiscono i dati

- **Con Supabase configurato**: ogni diario è una riga della tabella `diari`, legata all'account dello studente. Una copia resta nel browser per lavorare anche senza connessione; quando lo studente esce dall'account la copia viene cancellata, così su un computer condiviso nessuno la ritrova.
- **Senza Supabase** (campi di `config.js` vuoti): tutto resta nel browser, senza accesso. Per spostare il diario si usano «Scarica backup» e «Importa backup» nel Profilo.

## Librerie esterne

Supabase JS (accesso e salvataggio) da jsDelivr; jsPDF e jsPDF-AutoTable (PDF) e JSZip (Word) da cdnjs, caricate solo quando servono; font da Google Fonts.

## Fonti

- Percorsi FSL del Liceo Labriola: https://www.liceolabriola.edu.it/servizio/attivita-e-percorsi-formativi-pcto/
- Informativa FSL del Liceo Labriola: https://www.liceolabriola.edu.it/informativa-pcto-ex-asl/
- Limiti del servizio email di Supabase: https://supabase.com/docs/guides/auth/auth-smtp

Catalogo e regole aggiornati al 5 novembre 2026.
