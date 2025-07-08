USE portfolio;

-- View Dataset
-- select * FROM portfolio.impact_of_remote_work_on_mental_health

-- -- Count of employees general and by work location
-- select
-- 	IFNULL(Work_Location, 'Total') as Work_Location,
--     no_of_employees
-- FROM
-- (select 
--     Work_Location,
-- 	count(distinct Employee_ID) as no_of_employees
-- FROM portfolio.impact_of_remote_work_on_mental_health
-- Group by 1 
-- with rollup
-- ) as data

-- Count of employees by 1. stress level, 2. mental health condition, 3. productivity
	-- by work location
   
with work_data as
(    
	Select 
		Work_Location,
		Stress_Level,
		-- Mental_Health_Condition,
		count(distinct Employee_ID) as no_of_employees
	FROM impact_of_remote_work_on_mental_health
	Group by 1,2
)


select
	sum(case when Work_Location = 'Remote' and Stress_Level = 'High' then no_of_employees else 0 end)
    -- *
FROM work_data
	