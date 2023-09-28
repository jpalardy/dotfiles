
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

-- db activity: current queries

SELECT pid, age(clock_timestamp(), query_start), usename, query
FROM pg_stat_activity
WHERE query != '<IDLE>' AND query NOT ILIKE '%pg_stat_activity%'
ORDER BY query_start desc;

-- db activity: avg time per query

SELECT LEFT (query, 100), calls AS number_of_calls, (total_time / calls)::integer AS avg_time_ms
FROM pg_stat_statements
ORDER BY avg_time_ms DESC;

-- temporary table; for export
DROP TABLE IF EXISTS results;
CREATE TEMPORARY TABLE results AS (
    SELECT * FROM whatever
);
SELECT * FROM results;

-- -------------------------------------------------

-- export to CSV

\copy (SELECT * FROM results) to 'results.csv' with csv
\copy (SELECT * FROM results) to 'results.csv' with csv header

-- .pgpass @ 600
-- hostname:port:database:username:password

--  -------------------------------------------------
--  mysql
--  -------------------------------------------------

SHOW INDEX from tableName;

SHOW CREATE VIEW viewName;

SHOW TRIGGERS;

