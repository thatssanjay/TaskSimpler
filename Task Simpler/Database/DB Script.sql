USE [master]
GO
/****** Object:  Database [TaskSimpler]    Script Date: 9/21/2018 12:43:28 PM ******/
CREATE DATABASE [TaskSimpler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskSimpler', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\TaskSimpler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskSimpler_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\TaskSimpler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TaskSimpler] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskSimpler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskSimpler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskSimpler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskSimpler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskSimpler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskSimpler] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskSimpler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskSimpler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskSimpler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskSimpler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskSimpler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskSimpler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskSimpler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskSimpler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskSimpler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskSimpler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskSimpler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskSimpler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskSimpler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskSimpler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskSimpler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskSimpler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskSimpler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskSimpler] SET RECOVERY FULL 
GO
ALTER DATABASE [TaskSimpler] SET  MULTI_USER 
GO
ALTER DATABASE [TaskSimpler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskSimpler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskSimpler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskSimpler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaskSimpler] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaskSimpler', N'ON'
GO
ALTER DATABASE [TaskSimpler] SET QUERY_STORE = OFF
GO
USE [TaskSimpler]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TaskSimpler]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 9/21/2018 12:43:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [varchar](50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberMasters]    Script Date: 9/21/2018 12:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberMasters](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](200) NULL,
	[FirstName] [varchar](150) NULL,
	[LastName] [varchar](150) NULL,
	[Password] [varchar](50) NULL,
	[Mobile] [decimal](18, 0) NULL,
	[EmailAddress] [varchar](200) NULL,
	[Addedon] [datetime] NULL,
 CONSTRAINT [PK_MemberMasters] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriorityMasters]    Script Date: 9/21/2018 12:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriorityMasters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [varchar](150) NOT NULL,
	[Description] [varchar](300) NULL,
	[MemberID] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_PriorityMasters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectMasters]    Script Date: 9/21/2018 12:43:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectMasters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](200) NULL,
	[Description] [varchar](800) NULL,
	[MemberId] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_ProjectMasters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusMasters]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusMasters](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](500) NOT NULL,
	[MemberID] [int] NULL,
	[Description] [varchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_StatusMasters] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [varchar](2000) NOT NULL,
	[Addedon] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[MemberId] [int] NOT NULL,
	[StartOn] [datetime] NULL,
	[CompletedOn] [datetime] NULL,
	[ProjectId] [int] NOT NULL,
	[PriorityId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Descriptioin] [varchar](5000) NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Task_MemberMaster]    Script Date: 9/21/2018 12:43:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Task_MemberMaster] ON [dbo].[Tasks]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Task_PriorityMaster]    Script Date: 9/21/2018 12:43:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Task_PriorityMaster] ON [dbo].[Tasks]
(
	[PriorityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Task_ProjectMaster]    Script Date: 9/21/2018 12:43:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Task_ProjectMaster] ON [dbo].[Tasks]
(
	[PriorityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_Task_StatusMaster]    Script Date: 9/21/2018 12:43:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_FK_Task_StatusMaster] ON [dbo].[Tasks]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Task_MemberMaster] FOREIGN KEY([MemberId])
REFERENCES [dbo].[MemberMasters] ([MemberID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Task_MemberMaster]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Task_PriorityMaster] FOREIGN KEY([PriorityId])
REFERENCES [dbo].[PriorityMasters] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Task_PriorityMaster]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Task_ProjectMaster] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[ProjectMasters] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Task_ProjectMaster]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Task_StatusMaster] FOREIGN KEY([StatusId])
REFERENCES [dbo].[StatusMasters] ([StatusID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Task_StatusMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_addNewProject]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_addNewProject]
	@projectname varchar(200),
	@projectdescription varchar(800),
	@memberid int
AS
BEGIN
	
	SET NOCOUNT ON;

	insert into projectMasters(ProjectName,Description,MemberId,CreatedOn)
	values(@projectname,@projectdescription,@memberid,getdate())

END
GO
/****** Object:  StoredProcedure [dbo].[usp_AddNewTask]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--usp_AddNewTask 'test',1,1,1,'dds',null


CREATE PROCEDURE [dbo].[usp_AddNewTask]
	@task varchar(3000),
	@memberid int,
	@projectid int,
	@priorityid int,
	@description varchar(5000),
	@comments varchar(2000)


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	insert into Tasks(TaskName,Addedon,MemberId,ProjectId,PriorityId,StatusId,Descriptioin,UpdatedOn)
	values (@task,getdate(),@memberid,@projectid,@priorityid,2,@description, GETDATE())
	END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteProjects]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteProjects]
	@id int,
	@memberid int
AS
BEGIN
	
	SET NOCOUNT ON;
	delete from ProjectMasters where ID=@id and MemberId=@memberid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteTask]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteTask]
	 @TaskId int
AS
BEGIN
	
	SET NOCOUNT ON;
	delete from Tasks where ID=@TaskId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getPriority]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec usp_getPriority 1
CREATE PROCEDURE [dbo].[usp_getPriority]
@memberid int
AS
BEGIN
	SET NOCOUNT ON;

	select ID,Priority,Description,MemberID,CreatedOn from PriorityMasters
	union
	select ID,Priority,Description,MemberID,CreatedOn from PriorityMasters where  MemberID=@memberid
	

END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetProjects]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- usp_GetProjects 1
CREATE PROCEDURE [dbo].[usp_GetProjects]
@member int
AS
BEGIN
	SET NOCOUNT ON;
	select ID,ProjectName,Description,MemberId from ProjectMasters
	where MemberId=@member
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getSingleTask]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_getSingleTask]
	@id int
	

AS
BEGIN
	
	SET NOCOUNT ON;
	select  row_number() over(partition by t.StatusId order by t.StatusId) as ItemNo, t.ID,t.TaskName as Task, case when t.StatusId=2  then 'red' when t.StatusId=3 then 'yellow' else 'green' end as ColorCode, CONVERT(varchar, t.Addedon,103) as Addedon , CONVERT(varchar, t.UpdatedOn,103) as UpdatedOn ,t.MemberId,t.StartOn,t.CompletedOn,t.ProjectId,t.PriorityId,t.StatusId,t.Descriptioin as Description 
	,p.projectName ProjectName ,s.Status,p2.Priority,m.FirstName+' '+m.LastName as MemberName 
	from Tasks t
	inner join ProjectMasters p on t.projectid=p.id
	inner join StatusMasters s on s.statusid=t.statusid
	inner join PriorityMasters p2 on p2.id=t.priorityid
	inner join MemberMasters m on m.MemberID=t.memberid
	where t.ID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStatus]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--usp_GetStatus 1
CREATE PROCEDURE [dbo].[usp_GetStatus]
	@memberid int
AS
BEGIN
	SET NOCOUNT ON;
	select StatusID,Status,MemberID,Description from StatusMasters
	union
	select StatusID,Status,MemberID,Description from StatusMasters where MemberID=@memberid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getTask]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- usp_getTask 1,1
CREATE PROCEDURE [dbo].[usp_getTask]
	@memberid int,
	@projectid int
AS
BEGIN
	SET NOCOUNT ON;
	select  row_number() over(partition by t.StatusId order by t.StatusId) as ItemNo, t.ID,t.TaskName as Task, case when t.StatusId=2  then '#88ECAC' when t.StatusId=3 then '#EFF8A5' else '#A7D187' end as ColorCode, CONVERT(varchar, t.Addedon,103) as Addedon , CONVERT(varchar, t.UpdatedOn,103) as UpdatedOn ,t.MemberId,t.StartOn,t.CompletedOn,t.ProjectId,t.PriorityId,t.StatusId,t.Descriptioin as Description 
	,p.projectName ProjectName ,s.Status,p2.Priority,m.FirstName+' '+m.LastName as MemberName 
	from Tasks t
	inner join ProjectMasters p on t.projectid=p.id
	inner join StatusMasters s on s.statusid=t.statusid
	inner join PriorityMasters p2 on p2.id=t.priorityid
	inner join MemberMasters m on m.MemberID=t.memberid
	where t.MemberId=@memberid and ProjectId=@projectid
	order by s.DisplayOrder, p2.ID
	

END
GO
/****** Object:  StoredProcedure [dbo].[usp_transferTask]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_transferTask]
	@taskid int,
	@projectid int

AS
BEGIN
	
	SET NOCOUNT ON;
	update Tasks set ProjectId=@projectid where ID=@taskid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateProject]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdateProject]
	@Memberid int,
	@Id int,
	@ProjectName varchar(200),
	@Description varchar(800)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 update projectMasters set projectName=@projectName,
	 Description=@Description where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateTask]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_updateTask]
	@taskid int,
	@taskName varchar(200),
	@taskDescription varchar(800)

	

AS
BEGIN
	
	SET NOCOUNT ON;
	 update Tasks set TaskName=@taskName, Descriptioin=@taskDescription where ID=@taskid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatPriority]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdatPriority]
	@taskid int,
	@statusid int,
	@memberid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Tasks set priorityid =@statusid where ID=@taskid and memberid=@memberid
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatTaskStatus]    Script Date: 9/21/2018 12:43:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_UpdatTaskStatus]
	@taskid int,
	@statusid int,
	@memberid int

AS
BEGIN
	
	SET NOCOUNT ON;
	update Tasks set StatusId=@statusid where ID=@taskid and MemberId=@memberid
END
GO
USE [master]
GO
ALTER DATABASE [TaskSimpler] SET  READ_WRITE 
GO
