CREATE DATABASE SQL_PROJECT;
USE SQL_PROJECT;

SELECT * FROM EMPLOYEE;

# Customer Demographics & Behavior >>>>>>>>>>>>>>>>>>>>>

-- 1.How many customers are there in total?
select count(RowNumber) from employee;

-- 2.What is the average age of customers?
select avg(age) from employee;

-- 3.What is the gender distribution of customers?
select gender,count(*) from employee group by gender;

-- 4.What is the distribution of customers by geography (country/region)?
select geography,count(*) from employee group by geography;

-- 5.What is the average credit score by gender and geography?
select gender,geography,avg(creditscore) from employee group by gender,geography;

-- 6.What is the average estimated salary of customers with and without a credit card?
select customerId,avg(EstimatedSalary) from employee group by customerId;

-- 7.How many active members are there in each country?
select geography,count(isactiveMember) from employee group by geography;

-- 8.What is the average balance of customers grouped by number of products they use?
select Numofproducts,avg(balance) from employee group by Numofproducts;

# Churn Analysis (Exited = Yes/No) >>>>>>>>>>>>>>>>>>>>>>>

-- 9.How many customers have exited the bank?
select count(*) from employee where exited= 1='yes';

-- 10.What is the churn rate (percentage of customers who exited)?
select (count(case when exited = 'Terminated' then 1 end) * 100.0) / count(*) as churn_rate_percentage from employee;

-- 11.What is the average credit score of customers who exited vs those who didn’t?
select exited,avg(creditscore) as average_credit_score from employee group by exited;

-- 12.Is there any correlation between tenure and churn? (e.g., churn rate per tenure value)


-- 13 Which age group has the highest churn rate?
select tenure,max(age) from employee group by tenure;

-- 14.Which geography has the highest number of customer exits?
select geography,count(exited) from employee where exited=1 group by geography order by exited desc limit 1;

-- 15.What is the average salary of churned vs retained customers?
select exited,avg(EstimatedSalary) from employee group by exited;

-- 16.Does being an active member affect the churn rate?


# Product Usage >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- 17.What is the distribution of number of products among customers?
select Numofproducts,max(surname) from employee group by Numofproducts;

-- 18.Do customers with more products tend to have higher account balances?
select Numofproducts,max(balance) from employee group by Numofproducts;

-- 19.What is the churn rate for customers using only one product vs multiple products?


-- 20.How many customers have both a credit card and are active members?
select surname,count(creditscore),count(isactivemember) from employee where isactivemember=1 group by surname;

-- 21.How many customers have no credit card and are not active?
select surname,count(creditscore),count(isactivemember) from employee where isactivemember=0 group by surname;

# Advanced/Analytical >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

-- 22.Find the top 10 customers with the highest balances.
select * from employee order by balance desc limit 10;

-- 23.Calculate the average tenure of customers grouped by geography and gender.
select geography,gender,avg(tenure) from employee group by geography,gender;

-- 24.Find the age group (e.g., 20–30, 30–40, etc.) with the highest average salary.
select age,avg(EstimatedSalary) as Average_Salary,max(EstimatedSalary) as Highest_Salary from employee where age  between 20 and 30  group by age;

-- 25.What is the relationship between credit score and balance? (e.g., group by score ranges and average balance)
select creditscore as Credit_Score,avg(balance) from employee group by creditscore;

-- 26.Find the most common profile of a churned customer (e.g., geography, age group, products, credit card).
select geography,age,numofproducts,creditscore from employee group by geography,age,numofproducts,creditscore;

-- 27.What is the percentage of customers aged above 50 who exited the bank?
select * from employee where age>50 and exited=1;

-- 28.Which combination of credit card and active membership status has the highest churn rate?
select creditscore as Credit_Card,isactivemember,max(tenure) as Churn_Rate from employee where isactivemember=1 group by creditscore,isactivemember;
