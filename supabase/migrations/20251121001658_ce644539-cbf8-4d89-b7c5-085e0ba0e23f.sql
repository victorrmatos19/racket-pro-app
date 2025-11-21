-- Adicionar novos campos para dias da semana e horário das aulas
ALTER TABLE public.students 
  DROP COLUMN next_class,
  ADD COLUMN class_days text[] DEFAULT '{}',
  ADD COLUMN class_time text;