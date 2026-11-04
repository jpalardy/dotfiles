return {
  { prefix = 'ea',  body = 'EXPLAIN ANALYZE' },
  { prefix = 'cte', body = 'WITH results AS (\n  $1\n-- ), other_results AS (\n)\nSELECT * FROM results WHERE $2' },
  { prefix = 'csv', body = [[\copy (SELECT * FROM $1) to '$1.csv' with csv header]] },
  { prefix = 's',   body = 'SELECT ${1:attrs} FROM ${2:table}' },
  { prefix = 'sc',  body = 'SELECT ${1:attrs}, count(*) FROM ${2:table} GROUP BY 1 ORDER BY 1' },
}
