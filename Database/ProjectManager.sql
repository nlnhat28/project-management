USE [master]
GO
/****** Object:  Database [ProjectManager]    Script Date: 7/28/2022 11:21:32 PM ******/
CREATE DATABASE [ProjectManager]
GO
USE [ProjectManager]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnRemoveMark]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnRemoveMark] (
	@text nvarchar(max)
)
	RETURNS nvarchar(max)
AS
BEGIN
	SET @text = LOWER(@text)
		DECLARE @textLen int = LEN(@text)
	IF @textLen > 0
	BEGIN
		DECLARE @index int = 1
		DECLARE @lPos int
		DECLARE @SIGN_CHARS nvarchar(100) = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýđð'
		DECLARE @UNSIGN_CHARS varchar(100) = 'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyydd'

	WHILE @index <= @textLen
		BEGIN
			SET @lPos = CHARINDEX(SUBSTRING(@text,@index,1),@SIGN_CHARS)
			IF @lPos > 0
				BEGIN
					SET @text = STUFF(@text,@index,1,SUBSTRING(@UNSIGN_CHARS,@lPos,1))
				END
			SET @index = @index + 1
		END
	END
	RETURN @text
END

GO
/****** Object:  Table [dbo].[Classs]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classs](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[DepartmentId] [bigint] NULL,
	[SpecializedId] [bigint] NULL,
	[SchoolYearId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Classs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[FoundingDate] [datetime] NULL,
	[Discriptions] [nvarchar](1000) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectList]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectList](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Point] [varchar](3) NULL,
	[LinkDownload] [nvarchar](255) NULL,
	[TeacherId] [bigint] NULL,
	[StudentId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolYear]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolYear](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SchoolYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialized]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialized](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Discriptions] [nvarchar](1000) NULL,
	[DepartmentId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Specialized] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[SpecializedId] [bigint] NULL,
	[TrainingSystemId] [bigint] NULL,
	[DepartmentId] [bigint] NULL,
	[ClasssId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateOfBirth] [datetime] NULL,
	[DepartmentId] [bigint] NULL,
	[SpecializedId] [bigint] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingSystem]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingSystem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_TrainingSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserManagement]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserManagement](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhoneNumber] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[DeletedBy] [nvarchar](50) NULL,
	[DeletedDate] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserManagement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserManagement] ON 

INSERT [dbo].[UserManagement] ([Id], [Username], [Password], [Name], [PhoneNumber], [Email], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [DeletedBy], [DeletedDate], [IsDeleted]) VALUES (1, N'admin', N'21-23-2F-29-7A-57-A5-A7-43-89-4A-0E-4A-80-1F-C3', N'Administrator', N'0949234086', N'letiendung130196@gmail.com', N'system', CAST(N'2021-01-01T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[UserManagement] OFF
GO
/****** Object:  StoredProcedure [dbo].[uspClasss_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspClasss_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
	@DepartmentId BIGINT,
	@SpecializedId BIGINT,
	@SchoolYearId BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			c.[Id]
		   ,c.[Name]
		   ,c.[DepartmentId]
		   ,d.[Name] AS DepartmentName
		   ,c.[SpecializedId]
		   ,s.[Name] AS SpecializedName
		   ,c.SchoolYearId
		   ,sy.[Name] AS SchoolYearName
		   ,c.[CreatedBy]
		   ,c.[CreatedDate]
		   ,c.[ModifiedBy]
		   ,c.[ModifiedDate]
			FROM Classs c
			LEFT JOIN Department d ON d.Id = c.DepartmentId AND d.IsDeleted = 0
			LEFT JOIN Specialized s ON s.Id = c.SpecializedId AND s.IsDeleted = 0
			LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(c.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND
				  (
					ISNULL(@DepartmentId, '') = '' OR 
					c.[DepartmentId] = @DepartmentId
				  )
				  AND
				  (
					ISNULL(@SpecializedId, '') = '' OR 
					c.SpecializedId = @SpecializedId
				  )
				  AND
				  (
					ISNULL(@SchoolYearId, '') = '' OR 
					c.SchoolYearId = @SchoolYearId
				  )
				  AND c.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspDepartment_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspDepartment_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			[Id]
		   ,[Name]
		   ,[FoundingDate]
		   ,[Discriptions]
		   ,[CreatedBy]
		   ,[CreatedDate]
		   ,[ModifiedBy]
		   ,[ModifiedDate]
			FROM Department
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER([Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspProjectList_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspProjectList_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
    @TeacherId BIGINT,
    @SchoolYearId BIGINT,
	@Status BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
		-- Tất cả
		IF (@Status = 0)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

		-- Không đạt
		IF (@Status = 1)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						CAST(pl.Point AS DECIMAL(10,1)) < CAST(7 AS DECIMAL(10,1))
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

		-- Đạt
		IF (@Status = 2)
		BEGIN
			WITH TempResult AS 
			(
				SELECT
				   pl.[Id]
				  ,pl.[Name]
				  ,pl.[Point]
				  ,pl.[LinkDownload]
				  ,pl.[TeacherId]
				  ,t.Username AS TeacherCode
				  ,t.[Name] AS TeacherName
				  ,pl.[StudentId]
				  ,s.Username AS StudentCode
				  ,s.[Name] AS StudentName
				  ,pl.[CreatedBy]
				  ,pl.[CreatedDate]
				  ,pl.[ModifiedBy]
				  ,pl.[ModifiedDate]
				  ,c.[Name] AS ClasssName
				  ,s1.[Name] AS SpecializedName
				  ,d.[Name] AS DepartmentName
				  ,sy.[Name] AS SchoolYearName
				FROM ProjectList pl
				LEFT JOIN Student s ON s.Id = pl.StudentId AND s.IsDeleted = 0
				LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
				LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
				LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
				LEFT JOIN Teacher t ON t.Id = pl.[TeacherId] AND t.IsDeleted = 0
				LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
				WHERE (
						ISNULL(@Key, '') = '' OR 
						s.Username = @Key
					  )
					  AND
					  (
						ISNULL(@TeacherId, '') = '' OR 
						pl.TeacherId = @TeacherId
					  )
					  AND
					  (
						CAST(pl.Point AS DECIMAL(10,1)) >= CAST(7 AS DECIMAL(10,1))
					  )
					  AND
					  (
						ISNULL(@SchoolYearId, '') = '' OR 
						c.SchoolYearId = @SchoolYearId
					  )
					  AND pl.IsDeleted = 0 
			),
			TempCount (TotalRow)
    
			AS (SELECT COUNT(*) FROM TempResult)
			SELECT * FROM TempResult r, TempCount
			ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;
		END

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspSchoolYear_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspSchoolYear_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   [Id]
			  ,[Name]
			  ,[CreatedBy]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
			FROM SchoolYear
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER([Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspSpecialized_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspSpecialized_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   s.[Id]
			  ,s.[Name]
			  ,s.[Discriptions]
			  ,s.[DepartmentId]
			  ,d.[Name] AS DepartmentName
			  ,s.[CreatedBy]
			  ,s.[CreatedDate]
			  ,s.[ModifiedBy]
			  ,s.[ModifiedDate]
			FROM Specialized s
			LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(s.[Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND s.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStudent_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
	@DepartmentId BIGINT,
	@SpecializedId BIGINT,
	@ClasssId BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   s.[Id]
			  ,s.[Username]
			  ,s.[Password]
			  ,s.[Name]
			  ,s.[PhoneNumber]
			  ,s.[Email]
			  ,s.[Address]
			  ,s.[DateOfBirth]
			  ,s.[SpecializedId]
			  ,s1.[Name] AS SpecializedName
			  ,s.[TrainingSystemId]
			  ,ts.[Name] AS TrainingSystemName
			  ,s.[DepartmentId]
			  ,d.[Name] AS DepartmentName
			  ,s.[ClasssId]
			  ,c.[Name] AS ClasssName
			  ,s.[CreatedBy]
			  ,s.[CreatedDate]
			  ,s.[ModifiedBy]
			  ,s.[ModifiedDate]
			FROM Student s
			LEFT JOIN Specialized s1 ON s1.Id = s.[SpecializedId] AND s1.IsDeleted = 0
			LEFT JOIN TrainingSystem ts ON ts.Id = s.[TrainingSystemId] AND ts.IsDeleted = 0
			LEFT JOIN Department d ON d.Id = s.[DepartmentId] AND d.IsDeleted = 0
			LEFT JOIN Classs c ON c.Id = s.[ClasssId] AND c.IsDeleted = 0
			WHERE (
					ISNULL(@Key, '') = '' OR 
					s.[Username] = @Key
				  )
				  AND
				  (
					ISNULL(@DepartmentId, '') = '' OR 
					s.DepartmentId = @DepartmentId
				  )
				  AND(
					ISNULL(@SpecializedId, '') = '' OR 
					s.SpecializedId = @SpecializedId
				  )
				  AND(
					ISNULL(@ClasssId, '') = '' OR 
					s.ClasssId = @ClasssId
				  )
				  AND s.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectAllByUsername]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStudent_SelectAllByUsername]
	@Key NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY
		
	WITH TempResult AS 
	(
		SELECT
			 s.[Id]
			,s.[Username]
			,s.[Name]
			,s.[PhoneNumber]
			,s.[Email]
			,s.[Address]
			,s.[DateOfBirth]
			,s.[SpecializedId]
			,s.[TrainingSystemId]
			,s.[DepartmentId]
			,s.[ClasssId]
			,s1.[Name] AS SpecializedName
			,ts.[Name] AS TrainingSystemName
			,d.[Name] AS DepartmentName
			,c.[Name] AS ClasssName
			,sy.[Name] AS SchoolYearName
		FROM Student s
		LEFT JOIN Classs c ON c.Id = s.ClasssId AND c.IsDeleted = 0
		LEFT JOIN Specialized s1 ON s1.Id = s.SpecializedId AND s1.IsDeleted = 0
		LEFT JOIN Department d ON d.Id = s.DepartmentId AND d.IsDeleted = 0
		LEFT JOIN SchoolYear sy ON sy.Id = c.SchoolYearId AND sy.IsDeleted = 0
		LEFT JOIN TrainingSystem ts ON ts.Id = s.TrainingSystemId AND ts.IsDeleted = 0
		WHERE s.Username = @Key AND s.IsDeleted = 0 
	)
    	
	SELECT * FROM TempResult r

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspStudent_SelectByClasss]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspStudent_SelectByClasss]
	@Key BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   ROW_NUMBER() OVER(ORDER BY s.Id ASC) AS STT
			  ,s.[Username]
			  ,s.[Name]
			  ,s.[PhoneNumber]
			  ,s.[Address]
			  ,s.[DateOfBirth]
			  ,s.[Email]
			  ,s.[SpecializedId]
			  ,s1.[Name] AS SpecializedName
			  ,s.[TrainingSystemId]
			  ,ts.[Name] AS TrainingSystemName
			  ,s.[DepartmentId]
			  ,d.[Name] AS DepartmentName
			  ,s.[ClasssId]
			  ,c.[Name] AS ClasssName
			FROM Student s
			LEFT JOIN Specialized s1 ON s1.Id = s.[SpecializedId] AND s1.IsDeleted = 0
			LEFT JOIN TrainingSystem ts ON ts.Id = s.[TrainingSystemId] AND ts.IsDeleted = 0
			LEFT JOIN Department d ON d.Id = s.[DepartmentId] AND d.IsDeleted = 0
			LEFT JOIN Classs c ON c.Id = s.[ClasssId] AND c.IsDeleted = 0
			WHERE s.[ClasssId] = @Key AND s.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.[Name];

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspTeacher_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTeacher_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT,
	@DepartmentId BIGINT,
	@SpecializedId BIGINT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   t.[Id]
			  ,t.[Username]
			  ,t.[Password]
			  ,t.[Name]
			  ,t.[PhoneNumber]
			  ,t.[Email]
			  ,t.[Address]
			  ,t.[DateOfBirth]
			  ,t.[DepartmentId]
		      ,d.[Name] AS DepartmentName
			  ,t.[SpecializedId]
		      ,s.[Name] AS SpecializedName
			  ,t.[CreatedBy]
			  ,t.[CreatedDate]
			  ,t.[ModifiedBy]
			  ,t.[ModifiedDate]
			FROM Teacher t
			LEFT JOIN Department d ON d.Id = t.DepartmentId AND d.IsDeleted = 0
			LEFT JOIN Specialized s ON s.Id = t.SpecializedId AND s.IsDeleted = 0
			WHERE (
					ISNULL(@DepartmentId, '') = '' OR 
					t.[DepartmentId] = @DepartmentId
				  )
				  AND
				  (
					ISNULL(@SpecializedId, '') = '' OR 
					t.SpecializedId = @SpecializedId
				  )
				  AND
				  (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER(t.[Username]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND t.IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
/****** Object:  StoredProcedure [dbo].[uspTrainingSystem_SelectAll]    Script Date: 7/28/2022 11:21:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspTrainingSystem_SelectAll]
	@Key NVARCHAR(100),
    @Page INT,
    @PageSize INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE
        @strErrorMessage NVARCHAR(4000),
        @intErrorSeverity INT,
        @intErrorState INT,
        @intErrorLine INT;

    BEGIN TRY

	    WITH TempResult AS 
		(
			SELECT
			   [Id]
			  ,[Name]
			  ,[CreatedBy]
			  ,[CreatedDate]
			  ,[ModifiedBy]
			  ,[ModifiedDate]
			FROM TrainingSystem
			WHERE (
					ISNULL(@Key, '') = '' OR 
					dbo.ufnRemoveMark(TRIM(UPPER([Name]))) LIKE CONCAT('%',dbo.ufnRemoveMark(TRIM(UPPER(@Key))),'%')
				  )
				  AND IsDeleted = 0 
		),
		TempCount (TotalRow)
    
		AS (SELECT COUNT(*) FROM TempResult)
		SELECT * FROM TempResult r, TempCount
		ORDER BY r.Id DESC OFFSET (@PageSize * (@Page - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    END TRY
    BEGIN CATCH
        SELECT
            @strErrorMessage = ERROR_MESSAGE()
                    + ' Line:'
                    + CONVERT(VARCHAR(5), ERROR_LINE()),
            @intErrorSeverity = ERROR_SEVERITY(),
            @intErrorState = ERROR_STATE();
        RAISERROR(
                @strErrorMessage,   -- Message text.
                @intErrorSeverity,  -- Severity.
                @intErrorState      -- State.
        );
    END CATCH;

	
END
GO
USE [master]
GO
ALTER DATABASE [ProjectManager] SET  READ_WRITE 
GO
