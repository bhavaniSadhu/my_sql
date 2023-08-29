---SQL Query to find employee id, name and his manager id and name
Select e.employee_id empId,e.employee_name empName,m.manager_id managerId,m.employee_name managerName From EmployeeDetails e LEFT JOIN EmployeeDetails m on e.manager_id=m.employee_id;

---SQL query to Find one employee from each department who is getting highest salary in his department.
Select * from EmployeeDetails where(DepartmentId,salary) in (select DepartmentId,Max(Salary) from EmployeeDetails Group by DepartmentId);

---SQL query to Delete duplicate rows in an employee table.
Delete from EmployeeDetails where employee_id not in (Select Max(employee_id) from EmployeeDetails Group by last_name,first_name);

---What do you understand by query execution plan?
Query execution plan is a graphical representation for fetching results from database.Database engine finds best way to access the required data and process it.
we have two types of query executio plans
1.Estimated execution plan - it generates before query execution
2.Actual execution plan  - it generates after query execution

These execution plans created by using database objects and indexes,joins,output columns.

--Can we modify query execution plan? If yes then how?
Yes We can Modify query execution plan But it wont effect the existing plan, It will creates the new execution plan
We an modify execution plans using Hints, there are different types of hints like
 1.Statement level hints ,2.Transactional level hints ,3.Connection level hints

 ---Indexes vs Partitions in RDBMS?
 Index is one of the datastructure used internally for faster retrivel of data,mostly used for select query performance.
 Partitions refer to the arrangement of data in a database, and it makes easier to add new data into tables.Partitions used for huge old data.
 For example, if a database is getting huge because of old data (which is not helpful for most queries),
 we can create a copy of the database and move old records to the new database. This results in two databases; one can be used to access old information, 
 and the other only houses recent data. This can make queries accessing current data faster by reducing the amount of data they have to read
 We have two types of partitions -> one is database partition and another is table prtition.Both will split larger data into smaller more manageble.
 Partitioning is most useful when dealing with huge tables with billions of rows of data.
 Indexes used for small tables.we have two different types of indexes primary index(clustered index) and secondary index.

--- When to use indexes and when to use partitions?
Both are used for optimization of database the first preference goes to indexes,
Indexes allows fast acess for small part of tables, where Partitions used for huge part of table.
We can make many indexes on many columns but for partitions , we should have one partition definatition on particular set of colums.
Partition good for data management where is indexes good for DDL and DML.

---How index works in both cases.
In nomal Indexing, we have two types of indexes one is cluster index and another is non cluster index.
Both clustered and non-clustered indexes are stored and searched as B-trees. like binary tree data structure.
Basicall this tree structure sorts data for quick searching.
Cluster indexes uses primary key to organize the data.
Its an unique index per table.If we are searching by id it works for cluster index.But if we want search by name and age then it wont works.
In this type of scenarios we need non cluster indexes.These non cluster indexes are just like index page in the book.

In partition Indexing is  same as partitioning tables. An Index is partitioned Unless its a cluster index and defined in cluster table.
You can mix partitioned and nonpartitioned indexes with partitioned and nonpartitioned tables.
partitioned indexes are more complicated than partitioned tables because there are three types of partitioned indexes,these are 1.Local prefixed, 2.Local nonprefixed, 3.Global prefixed
Global indexes and local prefixed indexes provide better performance than local nonprefixed indexes because they minimize the number of index partition probes.
---Difference between clusters and non clustered indexes?
Cluster indexes no need to declared explicitly.Where as non clustered indexes should declared explicitly.
Cluster indexes uses Primary key for sorting and these are created when table is created.
Non cluster indexes can created by developpers based on their requirement.Non cluster indexes points to memory instead of storing  data.
Ex:CREATE INDEX emp_name_asc ON EmployeeDetails(lastName ASC); you can also create non cluster index for age or city.
these indexes works in B-Tree model, that means the data cut into half and checks whether its available in first half, if not it searches in second half.





