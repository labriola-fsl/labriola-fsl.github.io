-- Diario di bordo PCTO: tabella dei diari, una riga per studente.
-- Incolla tutto nel SQL Editor di Supabase e premi Run.

create table if not exists public.diari (
  user_id    uuid primary key references auth.users (id) on delete cascade,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

-- Ognuno può leggere e modificare solo il proprio diario.
alter table public.diari enable row level security;

drop policy if exists "diari_select_proprio" on public.diari;
drop policy if exists "diari_insert_proprio" on public.diari;
drop policy if exists "diari_update_proprio" on public.diari;
drop policy if exists "diari_delete_proprio" on public.diari;

create policy "diari_select_proprio" on public.diari
  for select to authenticated using ((select auth.uid()) = user_id);

create policy "diari_insert_proprio" on public.diari
  for insert to authenticated with check ((select auth.uid()) = user_id);

create policy "diari_update_proprio" on public.diari
  for update to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);

create policy "diari_delete_proprio" on public.diari
  for delete to authenticated using ((select auth.uid()) = user_id);

-- Solo gli utenti che hanno fatto l'accesso possono usare la tabella.
revoke all on public.diari from anon;
grant select, insert, update, delete on public.diari to authenticated;
