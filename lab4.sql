	/*SELECT full_name FROM public.patient
UNION ALL SELECT full_name FROM public.doctor

SELECT full_name FROM public.patient
INTERSECT SELECT full_name FROM public.doctor
*/

-- SELECT full_name FROM public.patient
-- EXCEPT SELECT full_name FROM public.doctor
 
-- SELECT AVG(amoun_of) AS avg_of_medicaments FROM medicaments

-- SELECT MEDIAN(amoun_of) max_amount_of  FROM medicaments
-- SELECT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY amoun_of) FROM public.medicaments
-- SELECT * FROM public.medicaments ORDER BY amoun_of
-- SELECT MIN(amoun_of)  FROM medicaments
-- 	SELECT * FROM public.doctor
-- 	WHERE experience IN('4 years')
-- 	SELECT * FROM public.doctor
-- 	WHERE EXISTS(SELECT * FROM public.patient WHERE patient.full_name=doctor.full_name)
-- 	SELECT AVG(amoun_of) AS avg_of_medicaments FROM medicaments;
-- 	SELECT * FROM medicaments
-- WITH cte AS (
--   SELECT full_name, experience
--   FROM public.doctor
-- )
-- SELECT *
-- FROM cte
-- WHERE experience = '5 years';
-- 	SELECT pk_name AS name_medicaments
-- 	FROM public.medicaments
-- SELECT full_name FROM public.patient
-- WHERE full_name LIKE 'Bylinskiy%'
-- SELECT pk_job_title FROM job_title
-- WHERE pk_job_title LIKE 'P%'
	
-- SELECT * FROM job_title
-- ORDER BY employee_rate DESC

-- SELECT * FROM public.patient
-- CROSS JOIN public.doctor

-- SELECT * FROM public.patient 
-- INNER JOIN public.doctor ON patient.full_name = doctor.full_name 
-- SELECT * FROM public.patient 
-- FULL OUTER JOIN public.doctor ON patient.full_name = doctor.full_name 
-- ALTER TABLE public.patient
-- ADD CONSTRAINT phone_number UNIQUE (phone_number)
-- SELECT *
-- FROM public.patient
-- WHERE full_name < ALL (SELECT full_name FROM public.doctor);
-- SELECT *
-- FROM public.patient
-- WHERE full_name IS  NULL;
SELECT *
FROM public.doctor
WHERE experience LIKE '4%';