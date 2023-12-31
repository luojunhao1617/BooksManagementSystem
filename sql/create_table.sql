USE [BookManage]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[编号] [char](10) NOT NULL,
	[书名] [nvarchar](20) NOT NULL,
	[作者] [nvarchar](10) NOT NULL,
	[版本] [varchar](10) NULL,
	[出版社] [nvarchar](15) NOT NULL,
	[库存] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[学号] [char](10) NOT NULL,
	[编号] [char](16) NOT NULL,
	[借书日期] [date] default getdate() NULL,
	[归还日期] [date] default dateadd(day,90,getdate()) NULL,
 CONSTRAINT [PK__CS__77CFF86F0BC6C43E] PRIMARY KEY CLUSTERED 
(
	[学号] ASC,
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[学号] [char](10) NOT NULL,
	[姓名] [nvarchar](10) NOT NULL,
	[性别] [nchar](1) NOT NULL CHECK(性别='男' or 性别='女'),
	[专业] [nvarchar](10) NOT NULL,
	[学院] [nvarchar](15) NOT NULL,
	[密码] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Student__1CC396D207F6335A] PRIMARY KEY CLUSTERED 
(
	[学号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[工号] [char](10) NOT NULL,
	[姓名] [nchar](10) NOT NULL,
	[学院] [nvarchar](15) NOT NULL,
	[密码] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Teacher__287897B57F60ED59] PRIMARY KEY CLUSTERED 
(
	[工号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE PROCEDURE [dbo].[getUser]
	@role nvarchar(3),
	@uid varchar(20)
AS
BEGIN
	if @role='学生'
		SELECT 密码,姓名 from Student where 学号=@uid
	if @role='教师'
		SELECT 密码,姓名 from Teacher where 工号=@uid
END
GO