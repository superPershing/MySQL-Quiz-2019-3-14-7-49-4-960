# 取得每个company中最高薪水的人员名字
# 输出结果包含公司名称和人员名称：companyName name
select companyName, name from Employee join Company on Company.id=companyId where (CompanyId, salary) in (select CompanyId, MAX(salary) as salary from Employee group by CompanyId);