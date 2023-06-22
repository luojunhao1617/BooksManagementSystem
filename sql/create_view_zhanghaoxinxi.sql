USE BookManagement
GO
CREATE VIEW zhanghaoxinxi
AS
SELECT dbo.Student.学号 AS 账号,dbo.Student.姓名,dbo.Student.密码,N'学生' AS 角色
FROM dbo.Student
UNION
SELECT dbo.Teacher.工号 AS 账号,dbo.Teacher.姓名,dbo.Teacher.密码,N'教师' AS 角色
FROM dbo.Teacher