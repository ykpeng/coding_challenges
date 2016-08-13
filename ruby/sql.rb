<<-SQL
SELECT
  COUNT(*)
FROM
  users;
SQL

User.count

<<-SQL
SELECT
  COUNT(*)
FROM
  users
WHERE
  users.active = true;
SQL

User.where(active: "TRUE").count

<<-SQL
SELECT
  COUNT(*)
FROM
  users
WHERE
  last_login BETWEEN :time_period_start AND :time_period_end;
SQL

User.where(last_login: (time_period_start..time_period_end).count
