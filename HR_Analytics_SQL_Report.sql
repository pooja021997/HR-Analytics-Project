create database Hr_Analytics_project;
select* from HR_1_DA

select*from HR_2_DA

ALTER TABLE HR_1_DA
ALTER COLUMN HourlyRate INT;

UPDATE HR_1_DA
SET HourlyRate = CAST(HourlyRate AS INT )
WHERE ISNUMERIC(HourlyRate) = 1;

EXEC sp_rename 'HR_1_DA.EmployeeNumber', 'Employee_ID', 'COLUMN';



-----Q1.Average of attrition rate for all department-----
select Department , count('Employee ID') as rating_yes from HR_1_DA  
where Attrition='Yes'
group by (Department)



------Q2.Average hourly rate of male research scientist------
select JobRole ,avg(HourlyRate) from HR_1_DA
Where Gender='Male' and JobRole='Research scientist'
group by (JobRole)

-----Q3.Average of hourly rate of female research scientist--------
select JobRole,avg(HourlyRate) as Hourlyratefemale from HR_1_DA
Where Gender='Female' and JobRole='Research scientist'
group by JobRole

-------Q4. Attrition Rate vs Monthly Income Stats-----------
--------------Record of Attrition rate yes----------------------
select department, SUM(Monthlyincome)as SMI ,AVG(Monthlyincome)AS AMI,MIN(Monthlyincome)AS MMI,MAX(Monthlyincome) as MAMI from HR_1_DA full join  HR_2_DA ON HR_1_DA.Employee_ID = HR_2_DA.Employee_ID
WHERE Attrition ='Yes'
group by department

--------------Record of attrition rate No----------------------
select department, sum(Monthlyincome) as SMI,AVG(Monthlyincome) as AMI, min(Monthlyincome) as MMI,MAX(Monthlyincome) as MAMI from HR_1_DA full join HR_2_DA ON HR_1_DA.Employee_ID=HR_2_DA.Employee_ID    
where Attrition ='NO'
group by department

--------Q5.Average working year of each department----------
select department ,AVG(TotalWorkingYears)as Avgoftotalworkingyears from HR_1_DA full join HR_2_DA ON HR_1_DA.Employee_ID = HR_2_DA.Employee_ID
group by department

-------Q5.Job role vs work life balance-----------
select JobRole , avg(WorkLifeBalance) from HR_1_DA full join HR_2_DA On HR_1_DA.Employee_ID=HR_2_DA.Employee_ID
group by JobRole

-----------Q6.Attrition rate vs year since last year promotion----------------
select department , count(YearsSinceLastPromotion)from HR_1_DA full join HR_2_DA on HR_1_DA.Employee_ID =HR_2_DA.Employee_ID
Where Attrition='Yes'
group by department


select department , count(YearsSinceLastPromotion)from HR_1_DA full join HR_2_DA on HR_1_DA.Employee_ID =HR_2_DA.Employee_ID
Where Attrition='No'
group by department
