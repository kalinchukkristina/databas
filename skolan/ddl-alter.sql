USE skolan;

-- Add column to table
ALTER TABLE larare ADD COLUMN IF NOT EXISTS kompetens INT;

-- Remove the newly added column
ALTER TABLE larare DROP COLUMN kompetens;

-- Add the same row with a default value and not null.
ALTER TABLE larare ADD COLUMN kompetens INT NOT NULL DEFAULT 1;

SHOW COLUMNS FROM larare;
