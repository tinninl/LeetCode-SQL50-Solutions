SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%' -- no idea how this regex works
OR conditions LIKE '% DIAB1%'