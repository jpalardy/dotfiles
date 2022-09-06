
-- get a sample

WHERE random() < 0.05
LIMIT 30

-- truncate, with sequence reset

TRUNCATE TABLE tbl_name RESTART IDENTITY CASCADE;

-- count all tables

SELECT schemaname, relname, n_live_tup
FROM pg_stat_user_tables
ORDER BY schemaname, relname;

-- show triggers

SELECT event_object_table AS table_name, trigger_name, array_agg(event_manipulation) AS events
FROM information_schema.triggers
GROUP BY 1, 2
ORDER BY 1, 2;

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

