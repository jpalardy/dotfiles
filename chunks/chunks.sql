
-- get a sample

WHERE random() < 0.05
LIMIT 30

-- truncate, with sequence reset

TRUNCATE TABLE tbl_name RESTART IDENTITY CASCADE;

-- count all tables

SELECT schemaname, relname, n_live_tup
FROM pg_stat_user_tables
ORDER BY schemaname, relname;

-- -------------------------------------------------

-- export to CSV

\copy (SELECT * FROM whatever) to 'whatever.csv' with csv
\copy (SELECT * FROM whatever) to 'whatever.csv' with csv header

-- .pgpass @ 600
-- hostname:port:database:username:password

--  -------------------------------------------------
--  mysql
--  -------------------------------------------------

SHOW INDEX from tableName;

SHOW CREATE VIEW viewName;

SHOW TRIGGERS;

