-- Add documento column to profiles table (nullable first)
ALTER TABLE public.profiles 
ADD COLUMN documento text;

-- Update the handle_new_user function to include documento
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, documento)
  VALUES (
    new.id,
    new.email,
    COALESCE(new.raw_user_meta_data->>'full_name', ''),
    COALESCE(new.raw_user_meta_data->>'documento', '')
  );
  RETURN new;
END;
$$;