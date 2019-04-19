
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/26/2018 14:23:41
-- Generated from EDMX file: C:\SKV\Projects\Task Simpler\Service\WcfRestSample\TaskSimpler.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TaskSimpler];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Task_MemberMaster]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_Task_MemberMaster];
GO
IF OBJECT_ID(N'[dbo].[FK_Task_PriorityMaster]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_Task_PriorityMaster];
GO
IF OBJECT_ID(N'[dbo].[FK_Task_ProjectMaster]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_Task_ProjectMaster];
GO
IF OBJECT_ID(N'[dbo].[FK_Task_StatusMaster]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Task] DROP CONSTRAINT [FK_Task_StatusMaster];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Book]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Book];
GO
IF OBJECT_ID(N'[dbo].[MemberMaster]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MemberMaster];
GO
IF OBJECT_ID(N'[dbo].[PriorityMaster]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PriorityMaster];
GO
IF OBJECT_ID(N'[dbo].[ProjectMaster]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProjectMaster];
GO
IF OBJECT_ID(N'[dbo].[StatusMaster]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StatusMaster];
GO
IF OBJECT_ID(N'[dbo].[Task]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Task];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [BookName] varchar(50)  NULL
);
GO

-- Creating table 'MemberMasters'
CREATE TABLE [dbo].[MemberMasters] (
    [MemberID] int IDENTITY(1,1) NOT NULL,
    [LoginName] varchar(200)  NULL,
    [FirstName] varchar(150)  NULL,
    [LastName] varchar(150)  NULL,
    [Password] varchar(50)  NULL,
    [Mobile] decimal(18,0)  NULL,
    [EmailAddress] varchar(200)  NULL,
    [Addedon] datetime  NULL
);
GO

-- Creating table 'PriorityMasters'
CREATE TABLE [dbo].[PriorityMasters] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [Priority] varchar(150)  NOT NULL,
    [Description] varchar(300)  NULL,
    [MemberID] int  NULL,
    [CreatedOn] datetime  NULL
);
GO

-- Creating table 'ProjectMasters'
CREATE TABLE [dbo].[ProjectMasters] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [ProjectName] varchar(200)  NULL,
    [Description] varchar(800)  NULL,
    [MemberId] int  NULL,
    [CreatedOn] datetime  NULL
);
GO

-- Creating table 'StatusMasters'
CREATE TABLE [dbo].[StatusMasters] (
    [StatusID] int IDENTITY(1,1) NOT NULL,
    [Status] varchar(500)  NOT NULL,
    [MemberID] int  NULL,
    [Description] varchar(500)  NULL,
    [CreatedOn] datetime  NOT NULL
);
GO

-- Creating table 'Tasks'
CREATE TABLE [dbo].[Tasks] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [TaskName] varchar(2000)  NOT NULL,
    [Addedon] datetime  NOT NULL,
    [UpdatedOn] datetime  NOT NULL,
    [MemberId] int  NOT NULL,
    [StartOn] datetime  NULL,
    [CompletedOn] datetime  NULL,
    [ProjectId] int  NOT NULL,
    [PriorityId] int  NOT NULL,
    [StatusId] int  NOT NULL,
    [Descriptioin] varchar(5000)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [MemberID] in table 'MemberMasters'
ALTER TABLE [dbo].[MemberMasters]
ADD CONSTRAINT [PK_MemberMasters]
    PRIMARY KEY CLUSTERED ([MemberID] ASC);
GO

-- Creating primary key on [ID] in table 'PriorityMasters'
ALTER TABLE [dbo].[PriorityMasters]
ADD CONSTRAINT [PK_PriorityMasters]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'ProjectMasters'
ALTER TABLE [dbo].[ProjectMasters]
ADD CONSTRAINT [PK_ProjectMasters]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [StatusID] in table 'StatusMasters'
ALTER TABLE [dbo].[StatusMasters]
ADD CONSTRAINT [PK_StatusMasters]
    PRIMARY KEY CLUSTERED ([StatusID] ASC);
GO

-- Creating primary key on [ID] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [PK_Tasks]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MemberId] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK_Task_MemberMaster]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[MemberMasters]
        ([MemberID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Task_MemberMaster'
CREATE INDEX [IX_FK_Task_MemberMaster]
ON [dbo].[Tasks]
    ([MemberId]);
GO

-- Creating foreign key on [PriorityId] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK_Task_PriorityMaster]
    FOREIGN KEY ([PriorityId])
    REFERENCES [dbo].[PriorityMasters]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Task_PriorityMaster'
CREATE INDEX [IX_FK_Task_PriorityMaster]
ON [dbo].[Tasks]
    ([PriorityId]);
GO

-- Creating foreign key on [PriorityId] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK_Task_ProjectMaster]
    FOREIGN KEY ([PriorityId])
    REFERENCES [dbo].[ProjectMasters]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Task_ProjectMaster'
CREATE INDEX [IX_FK_Task_ProjectMaster]
ON [dbo].[Tasks]
    ([PriorityId]);
GO

-- Creating foreign key on [StatusId] in table 'Tasks'
ALTER TABLE [dbo].[Tasks]
ADD CONSTRAINT [FK_Task_StatusMaster]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[StatusMasters]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Task_StatusMaster'
CREATE INDEX [IX_FK_Task_StatusMaster]
ON [dbo].[Tasks]
    ([StatusId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------