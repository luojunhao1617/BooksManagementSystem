USE BookManagement
GO
CREATE VIEW jieyuanxinxi
AS
SELECT dbo.Book.编号,dbo.Book.书名,dbo.Book.作者,dbo.Book.版本,dbo.Book.出版社,
dbo.Borrow.借书日期,dbo.Borrow.还书日期,dbo.Borrow.学号,case when dbo.Borrow.还书日期<
CAST(GETDATE() as date)
then N'是'
else N'否' END AS 是否超期
FROM dbo.Book INNER JOIN
dbo.Borrow ON dbo.Book.编号=dbo.Borrow.编号