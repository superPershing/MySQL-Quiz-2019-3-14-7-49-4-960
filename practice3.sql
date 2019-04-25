#取得平均薪水最高的公司
#输出公司名称和平均薪水：companyName avgSalary
select companyName,avgSalary from Company join (select CompanyId, avg(salary) as avgSalary from Employee group by CompanyId) as T on Company.id=CompanyId order by avgSalary DESC limit 1;