# 找出薪水在公司的平均薪水之上的人员名字
# 输出标准中包含Employee中所有字段和该employee所在公司名称以及该公司平均薪资：
# id | name | age | gender | companyId | salary | companyName | avgsal
select * from Employee join (select CompanyId, avg(salary) as avgSal from Employee group by CompanyId) as T on Employee.companyId=T.CompanyId having salary>avgsal;