USE skolan;
--
-- Delete from database skolan.
--

-- Delete only one row 
DELETE FROM larare WHERE fornamn = 'Hagrid';

-- Delete all rows that match the condition
DELETE FROM larare WHERE avdelning = 'DIPT';

-- Delete two rows that match the condition
DELETE FROM larare WHERE lon IS NOT NULL LIMIT 2;

-- Delete all rows in teh table
DELETE FROM larare;
