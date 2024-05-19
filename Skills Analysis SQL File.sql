select * from colab
where gender is null
--What is the distribution of participants based on gender?
select Gender, count(*) from colab
group by gender
--What is the average age of participants?
select avg(age) from colab

--What is the distribution of participants based on educational background?
select distinct education, count(*) as total from colab
group by education
order by total desc
--What is the most common skill area participants are interested in learning?
select program, count(*)as total from colab
group by program
order by total desc
--How has the enrollment trend varied over the period from 2020 to 2022?
select distinct year, count(*) from colab
group by year
--Are there any seasonal patterns in enrollment?
select education, month(month), count(*) from colab
where month(month) in ('1', '2', '3')
group by education, month
--Which months had the highest enrollment rates?
select distinct month, count(*) from colab
where year = 2020
group by month
--What is the average duration of completion for different programs?

select program, avg(duration_months) from colab
where year in ('2020', '2021', '2022')
group by program
--Are there any correlations between educational background and program completion rates?

select education, program, count(*),
rank() over (order by count(*) desc) from colab
group by education, program
order by count(*) desc