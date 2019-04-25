## practice1
```
mysql> select * from Employee where salary>6000 and name like '%n%';
+------+------------+------+----------+-----------+--------+
| id   | name       | age  | gender   | companyId | salary |
+------+------------+------+----------+-----------+--------+
|    1 | 'xiaohong' |   19 | 'female' |         1 |   7000 |
+------+------------+------+----------+-----------+--------+
1 row in set (0.00 sec)
```
## practice2
```
mysql> select companyName, name from Employee join Company on Company.id=companyId where (CompanyId, salary) in (select CompanyId, MAX(salary) as salary from Employee group by CompanyId);
+-------------+------------+
| companyName | name       |
+-------------+------------+
| 'baidu'     | 'xiaoming' |
| 'alibaba'   | 'xiaohong' |
| 'tengxun'   | 'xiaozhi'  |
+-------------+------------+
3 rows in set (0.01 sec)
```
## parctice3
```
mysql> select companyName,avgSalary from Company join (select CompanyId, avg(salary) as avgSalary from Employee group by CompanyId) as T on Company.id=CompanyId order by avgSalary DESC limit 1;
+-------------+-----------+
| companyName | avgSalary |
+-------------+-----------+
| 'tengxun'   | 8000.0000 |
+-------------+-----------+
1 row in set (0.00 sec)
```
## practice4
```
mysql> select * from Employee join (select CompanyId, avg(salary) as avgSal from Employee group by CompanyId) as T on Employee.companyId=T.CompanyId having salary>avgsal;
+------+------------+------+----------+-----------+--------+-----------+-----------+
| id   | name       | age  | gender   | companyId | salary | CompanyId | avgSal    |
+------+------------+------+----------+-----------+--------+-----------+-----------+
|    0 | 'xiaoming' |   20 | 'male'   |         0 |   6000 |         0 | 5000.0000 |
|    1 | 'xiaohong' |   19 | 'female' |         1 |   7000 |         1 | 6500.0000 |
+------+------------+------+----------+-----------+--------+-----------+-----------+
2 rows in set (0.00 sec)
```