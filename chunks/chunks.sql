
-- tabulate a column

SELECT   col, COUNT(*)
FROM
GROUP BY col
ORDER BY col DESC;

-- get a sample

WHERE random() < 0.05
LIMIT 30

-- truncate, with sequence reset

TRUNCATE TABLE tbl_name RESTART IDENTITY CASCADE;

-- count all tables

SELECT schemaname, relname, n_live_tup
FROM pg_stat_user_tables
ORDER BY schemaname, relname;

-- search_path management

\dn       -- list schemas

SHOW search_path;

SET search_path TO other_schema, public;

-- -------------------------------------------------

-- .pgpass @ 600
-- hostname:port:database:username:password

