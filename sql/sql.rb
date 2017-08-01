# 14.1
SELECT
MAX(Tenants.TenantName) as TenantName
FROM
AptTenants
JOIN
Tenants
ON
Tenants.TenantId = AptTenants.TenantID
GROUP BY
AptTenants.TenantID
HAVING
COUNT(AptTenants.AptID) > 1

SELECT
TenantName
FROM
AptTenants
JOIN
Tenants
ON
Tenants.TenantId = AptTenants.TenantID
GROUP BY
Tenants.TenantID, Tenants.TenantName
HAVING
COUNT(AptTenants.AptID) > 1

# 14.2
SELECT
Buildings.BuildingName, (COALESCE num_open_requests.count, 0)
FROM
Buildings
LEFT JOIN
(SELECT
Apartments.BuildingID, COUNT(Requests.RequestID) as count
FROM
Apartments
JOIN
Requests
ON
Requests.AptID = Apartments.AptID
WHERE
Requests.Status = 'Open'
GROUP BY
Apartments.BuildingID) as num_open_requests
ON
Buildings.BuildingID = num_open_requests.BuildingID

# 14.3
UPDATE Requests
SET Status = 'Closed'
WHERE AptID IN (
SELECT AptID
FROM Apartments
WHERE BuildingID = 11
)

# 14.4
JOIN = INNER JOIN, only selects rows where criteria match
LEFT JOIN = LEFT OUTER JOIN, selects all rows from left table. if no matching records were found in the right table, then its fields would be null
OUTER JOIN selects all rows from both tables. if no matching record is found, then the corresponding result fields will have be null

# 14.5
denormalization - adding redudant fields to a database for the purpose of saving expensive joins. used when need to optimized the performance of frequent queries that are costly. cons: redudant data makes it more costly to update data, multiple sources of truth, requires more storage. pros: faster lookup

# 14.6
# 14.7
students:
id
name

course_enrollments:
student_id
course_id
grade

courses:
id
name
department
professor_id

# calculate GPA of each student
# sort students by GPA and return top 10%

SELECT
student_id, AVG(grade) as gpa
FROM
course_enrollments
GROUP BY
student_id
ORDER BY
gpa DESC
LIMIT
COUNT(student_id) * 0.1
