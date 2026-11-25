-- CleanMap V1.1 Supabase starter schema (NOT wired to submissions in this prototype)
-- Run only after reviewing in your own Supabase project.
create table if not exists public.sites (
  id text primary key,
  name text not null,
  category text not null check (category in ('litter','drainage','dumping','dustbin')),
  landmark text,
  area text,
  address text,
  lat double precision not null,
  lng double precision not null,
  initial_photo_path text,
  status text not null default 'reported' check (status in ('reported','cleaned')),
  created_at timestamptz not null default now(),
  submitted_by uuid references auth.users(id)
);
create table if not exists public.site_updates (
  id uuid primary key default gen_random_uuid(),
  site_id text not null references public.sites(id) on delete cascade,
  condition text not null check (condition in ('reported','cleaned')),
  photo_path text not null,
  created_at timestamptz not null default now(),
  submitted_by uuid references auth.users(id)
);
alter table public.sites enable row level security;
alter table public.site_updates enable row level security;
-- Public reads; submissions/authenticated writes require production review and policy refinement.
create policy "public read sites" on public.sites for select using (true);
create policy "public read updates" on public.site_updates for select using (true);
-- Placeholder policies: replace/review carefully before public launch.
create policy "authenticated insert sites" on public.sites for insert to authenticated with check (submitted_by = auth.uid());
create policy "authenticated insert updates" on public.site_updates for insert to authenticated with check (submitted_by = auth.uid());
