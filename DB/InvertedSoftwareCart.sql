/****** Object:  Role [aspnet_Membership_BasicAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Membership_BasicAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Membership_BasicAccess'
GO
/****** Object:  Role [aspnet_Membership_ReportingAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Membership_ReportingAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Membership_ReportingAccess'
GO
/****** Object:  Role [aspnet_Membership_FullAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Membership_FullAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Membership_FullAccess'
GO
/****** Object:  Role [aspnet_Personalization_BasicAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Personalization_BasicAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Personalization_BasicAccess'
GO
/****** Object:  Role [aspnet_Personalization_ReportingAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Personalization_ReportingAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Personalization_ReportingAccess'
GO
/****** Object:  Role [aspnet_Personalization_FullAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Personalization_FullAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Personalization_FullAccess'
GO
/****** Object:  Role [aspnet_Profile_BasicAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Profile_BasicAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Profile_BasicAccess'
GO
/****** Object:  Role [aspnet_Profile_ReportingAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Profile_ReportingAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Profile_ReportingAccess'
GO
/****** Object:  Role [aspnet_Profile_FullAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Profile_FullAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Profile_FullAccess'
GO
/****** Object:  Role [aspnet_Roles_BasicAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Roles_BasicAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Roles_BasicAccess'
GO
/****** Object:  Role [aspnet_Roles_ReportingAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Roles_ReportingAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Roles_ReportingAccess'
GO
/****** Object:  Role [aspnet_Roles_FullAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_Roles_FullAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_Roles_FullAccess'
GO
/****** Object:  Role [aspnet_WebEvent_FullAccess]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysusers WHERE name = N'aspnet_WebEvent_FullAccess' AND issqlrole = 1)
EXEC dbo.sp_addrole @rolename = N'aspnet_WebEvent_FullAccess'
GO
/****** Object:  StoredProcedure [dbo].[RemoveFeaturedProduct]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RemoveFeaturedProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[RemoveFeaturedProduct] 
	@FeaturedProductID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE FROM FeaturedProduct
	WHERE
		FeaturedProductID = @FeaturedProductID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddFeaturedProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddFeaturedProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddFeaturedProduct] 
	@ProductID int,
    @CategoryID int,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO FeaturedProduct(
        ProductID,
		CategoryID,
        Active
     )VALUES(
		@ProductID,
		@CategoryID,
		@Active)
	
	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerEmail]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomerEmail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomerEmail]
	@CustomerID int,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		Email
	FROM
		Customer
	WHERE
		CustomerID = @CustomerID AND
		Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategory]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCategory]
	@CategoryID int,
	@Active bit
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CategoryID,
		ParentCategoryID,
		CategoryName,
		Active
	FROM  
		Category
	WHERE
		CategoryID =  @CategoryID AND
		Active = @Active
END' 
END
GO
/****** Object:  Table [dbo].[State]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[State]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[StateCode] [varchar](2) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_SchemaVersions]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[IsEmailExists]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IsEmailExists]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[IsEmailExists] 
	@Email varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT 1 FROM Customer WHERE Email = @Email)
		BEGIN
			SELECT 1
		END
	ELSE
		BEGIN
			SELECT 0
		END	
END
' 
END
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OrderStatus]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusName] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SearchProducts]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SearchProducts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SearchProducts]
	@PageIndex int,
    @PageSize int,
    @Keyword varchar(200) = NULL,
	@Active bit = 1
AS
BEGIN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForProducts
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ProductID int
    )

	INSERT INTO #PageIndexForProducts (ProductID)
	SELECT
		P.ProductID
	FROM
		Product p
	WHERE
		p.Active = @Active AND
		(p.ProductName LIKE ''%'' + @Keyword + ''%'' OR
		p.Description LIKE ''%'' + @Keyword + ''%'')


	SELECT @TotalRecords = @@ROWCOUNT
		
	SELECT
		p.ProductID,
		p.CatalogNumber,
		p.ProductName,
		SUBSTRING(p.Description, 0, 200) AS Description,
		(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NOT NULL ORDER BY SortOrder) AS Thumbnail,
		(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NULL ORDER BY SortOrder) AS ImageURL,
		p.price,
		p.Active 
	FROM
		Product p INNER JOIN #PageIndexForProducts i ON
		p.ProductID = i.ProductID
		INNER JOIN ProductCategory pc ON
		p.ProductID = pc.ProductID
	WHERE
		i.IndexId >= @PageLowerBound AND 
		i.IndexId <= @PageUpperBound


   
	RETURN @TotalRecords

    DROP TABLE #PageIndexForProducts
END' 
END
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Tag]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tag](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](50) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetProductsByTag]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProductsByTag]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProductsByTag]
	@PageIndex int,
    @PageSize int,
    @TagName varchar(200) = NULL,
	@Active bit = 1
AS
BEGIN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForProducts
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ProductID int
    )

	INSERT INTO #PageIndexForProducts (ProductID)
	SELECT DISTINCT
		P.ProductID
	FROM
		Product p INNER JOIN ProductTag pt ON
		p.ProductID = pt.ProductID
		INNER JOIN Tag t ON
		pt.TagID = t.TagID
	WHERE
		p.Active = @Active AND
		pt.Active = @Active AND
		t.Active = @Active AND
		t.TagName = @TagName


	SELECT @TotalRecords = @@ROWCOUNT
		
	SELECT
		p.ProductID,
		p.CatalogNumber,
		p.ProductName,
		SUBSTRING(p.Description, 0, 200) AS Description,
		(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NOT NULL ORDER BY SortOrder) AS Thumbnail,
		(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NULL ORDER BY SortOrder) AS ImageURL,
		p.price,
		p.Active 
	FROM
		Product p INNER JOIN #PageIndexForProducts i ON
		p.ProductID = i.ProductID
		INNER JOIN ProductCategory pc ON
		p.ProductID = pc.ProductID
	WHERE
		i.IndexId >= @PageLowerBound AND 
		i.IndexId <= @PageUpperBound

	RETURN @TotalRecords

    DROP TABLE #PageIndexForProducts
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetTaxes]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTaxes]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetTaxes]
	@CountryID int,
	@StateID int = null,
	@ProvinceID int = null
AS
BEGIN
	SET NOCOUNT ON;
	IF @StateID IS NOT NULL
		BEGIN
			SELECT
				TaxID,
				TaxName,
				Fixed,
				Amount,
				CountryID,
				StateID,
				ProvinceID,
				Active
			FROM
				Tax
			WHERE
				CountryID = @CountryID AND
				StateID = @StateID AND
				Active = 1
		END
	ELSE IF @ProvinceID IS NOT NULL
		BEGIN
			SELECT
				TaxID,
				TaxName,
				Fixed,
				Amount,
				CountryID,
				StateID,
				ProvinceID,
				Active
			FROM
				Tax
			WHERE
				CountryID = @CountryID AND
				ProvinceID = @ProvinceID AND
				Active = 1
		END
	ELSE
		BEGIN
			SELECT
				TaxID,
				TaxName,
				Fixed,
				Amount,
				CountryID,
				StateID,
				ProvinceID,
				Active
			FROM
				Tax
			WHERE
				CountryID = @CountryID AND
				Active = 1
		END
		
		
END
' 
END
GO
/****** Object:  Table [dbo].[ShippingProvider]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ShippingProvider]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ShippingProvider](
	[ShippingProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ShippingProviderName] [varchar](50) NOT NULL,
	[ShippingCost] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ShippingProvider] PRIMARY KEY CLUSTERED 
(
	[ShippingProviderID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCategories]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCategories]
	@ParentCategoryID int = NULL,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CategoryID,
		ParentCategoryID,
		CategoryName
	FROM  
		Category
	WHERE
		ParentCategoryID = @ParentCategoryID AND
		Active = @Active
	ORDER BY
		CategoryName
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProducts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProducts]
	@PageIndex int,
    @PageSize int,
    @CategoryID int = NULL,
	@Active bit = 1
AS
BEGIN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForProducts
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ProductID int
    )

IF @CategoryID IS NULL
	BEGIN

	 -- Insert into our temp table
    INSERT INTO #PageIndexForProducts (ProductID)
    SELECT
		ProductID
    FROM
		Product
	WHERE
		Active = @Active

	SELECT @TotalRecords = @@ROWCOUNT

		SELECT
			p.ProductID,
			p.CatalogNumber,
			p.ProductName,
			SUBSTRING(p.Description, 0, 200) AS Description,
			(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NOT NULL ORDER BY SortOrder) AS Thumbnail,
			(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NULL ORDER BY SortOrder) AS ImageURL,
			p.price,
			p.Active 
		FROM
			Product p INNER JOIN #PageIndexForProducts i ON
			p.ProductID = i.ProductID
		WHERE
			i.IndexId >= @PageLowerBound AND 
			i.IndexId <= @PageUpperBound
	END
ELSE
	BEGIN

		INSERT INTO #PageIndexForProducts (ProductID)
		SELECT
			P.ProductID
		FROM
			Product p INNER JOIN ProductCategory pc ON
			p.ProductID = pc.ProductID
		WHERE
			p.Active = @Active AND
			pc.Active = @Active AND
			pc.CategoryID = @CategoryID

		SELECT @TotalRecords = @@ROWCOUNT
		SELECT
			p.ProductID,
			p.CatalogNumber,
			p.ProductName,
			SUBSTRING(p.Description, 0, 200) AS Description,
			(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NOT NULL ORDER BY SortOrder) AS Thumbnail,
			(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = p.ProductID AND ParentID IS NULL ORDER BY SortOrder) AS ImageURL,
			p.price,
			p.Active 
		FROM
			Product p INNER JOIN #PageIndexForProducts i ON
			p.ProductID = i.ProductID
			INNER JOIN ProductCategory pc ON
			p.ProductID = pc.ProductID
		WHERE
			i.IndexId >= @PageLowerBound AND 
			i.IndexId <= @PageUpperBound

	END
   
	RETURN @TotalRecords

    DROP TABLE #PageIndexForProducts
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrder]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetOrder]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetOrder] 
	@OrderID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT 
		OrderID,
		CustomerID,
		OrderNumber,
		OrderDate,
		OrderStatusID,
		ShippingProviderID,
		Address,
		City,
		StateID,
		CountryID,
		Zipcode,
		DatePlaced,
		DateShipped,
		Total,
		Shipping,
		Tax,
		Active
	FROM
		[Order]
	WHERE
		OrderID = @OrderID
END
' 
END
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Product]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[CatalogNumber] [varchar](50) NULL,
	[Description] [text] NULL,
	[price] [money] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_Product] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_Product_1] UNIQUE NONCLUSTERED 
(
	[CatalogNumber] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateCustomer]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateCustomer]
	@CustomerID int = NULL,
	@MemberID uniqueidentifier = NULL,
	@Company varchar(50),
    @FirstName varchar(50),
    @LastName varchar(50),
    @Address varchar(50),
    @City varchar(50),
    @StateID int = NULL,
	@ProvinceID int = NULL,
    @CountryID int,
    @Zipcode varchar(50),
    @DayPhone varchar(50),
    @EveningPhone varchar(50),
    @CellPhone varchar(50),
    @Fax varchar(50),
    @Email varchar(50),
    @DateCreated datetime,
    @DateUpdated datetime = GETDATE,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @CustomerID IS NOT NULL
		BEGIN
			UPDATE
				Customer
			SET
				Company = @Company,
				FirstName = @FirstName,
				LastName = @LastName,
				Address = @Address,
				City = @City,
				StateID = @StateID,
				ProvinceID = @ProvinceID,
				CountryID = @CountryID,
				Zipcode = @Zipcode,
				DayPhone = @DayPhone,
				EveningPhone = @EveningPhone,
				CellPhone = @CellPhone,
				Fax = @Fax,
				Email = @Email,
				DateCreated = @DateCreated,
				DateUpdated = @DateUpdated,
				Active = @Active
			WHERE
				CustomerID = @CustomerID
		END
	ELSE IF @CustomerID IS NULL AND @MemberID IS NOT NULL
		BEGIN
			UPDATE
				Customer
			SET
				Company = @Company,
				FirstName = @FirstName,
				LastName = @LastName,
				Address = @Address,
				City = @City,
				StateID = @StateID,
				ProvinceID = @ProvinceID,
				CountryID = @CountryID,
				Zipcode = @Zipcode,
				DayPhone = @DayPhone,
				EveningPhone = @EveningPhone,
				CellPhone = @CellPhone,
				Fax = @Fax,
				Email = @Email,
				DateCreated = @DateCreated,
				DateUpdated = @DateUpdated,
				Active = @Active
			WHERE
				MemberID = @MemberID
		END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomer]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomer]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomer]
	@CustomerID int = NULL,
	@MemberID uniqueidentifier = NULL,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	IF @CustomerID IS NOT NULL
		BEGIN
			SELECT
				CustomerID,
				MemberID,
				Company,
				FirstName,
				LastName,
				Address,
				City,
				StateID,
				ProvinceID,
				CountryID,
				Zipcode,
				DayPhone,
				EveningPhone,
				CellPhone,
				Fax,
				Email,
				DateCreated,
				DateUpdated,
				Active
			FROM
				Customer
			WHERE
				CustomerID = @CustomerID AND
				Active = @Active
		END
	ELSE IF @MemberID IS NOT NULL
		BEGIN
			SELECT
				CustomerID,
				MemberID,
				Company,
				FirstName,
				LastName,
				Address,
				City,
				StateID,
				ProvinceID,
				CountryID,
				Zipcode,
				DayPhone,
				EveningPhone,
				CellPhone,
				Fax,
				Email,
				DateCreated,
				DateUpdated,
				Active
			FROM
				Customer
			WHERE
				MemberID = @MemberID AND
				Active = @Active
		END

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerOrders]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomerOrders]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomerOrders]
	@CustomerID int,
	@PageIndex int,
    @PageSize int,
	@Active bit = 1
AS
BEGIN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForCustomerOrders
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        OrderID int
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForCustomerOrders (OrderID)
    SELECT
		OrderID
    FROM
		[OrderID]
	WHERE
		CustomerID = @CustomerID

	SELECT
		OrderID,
		CustomerID,
		OrderNumber,
		OrderDate,
		OrderStatusID,
		ShippingProviderID,
		Address,
		City,
		StateID,
		CountryID,
		Zipcode,
		DatePlaced,
		DateShipped,
		Total,
		Shipping,
		Tax,
		Active
	FROM
		[Order],
		#PageIndexForCustomerOrders i
	WHERE
		Active = @Active AND
		i.IndexId >= @PageLowerBound AND 
		i.IndexId <= @PageUpperBound
	ORDER BY
		OrderDate DESC
	
	RETURN @TotalRecords

    DROP TABLE #PageIndexForCustomerOrders
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddCategory]
	@ParentCategoryID int,
    @CategoryName varchar(50),
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO Category(
		ParentCategoryID,
        CategoryName,
        Active
    )VALUES(
		@ParentCategoryID,
        @CategoryName,
        @Active)

	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomers]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomers]
	@PageIndex int,
    @PageSize int,
	@Active bit = 1
AS
BEGIN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForCustomers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        CustomerID int
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForCustomers (CustomerID)
    SELECT
		CustomerID
    FROM
		Customer

	SELECT @TotalRecords = @@ROWCOUNT

	SELECT
		CustomerID,
		MemberID,
		Company,
		FirstName,
		LastName,
		Address,
		City,
		StateID,
		CountryID,
		Zipcode,
		DayPhone,
		EveningPhone,
		CellPhone,
		Fax,
		Email,
		DateCreated,
		DateUpdated,
		Active
	FROM
			Customer,
			#PageIndexForCustomers i
		WHERE
			Active = @Active AND
			i.IndexId >= @PageLowerBound AND 
			i.IndexId <= @PageUpperBound
	

   
	RETURN @TotalRecords

    DROP TABLE #PageIndexForCustomers
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateProduct]
	@ProductID int,
    @CatalogNumber varchar(50),
    @ProductName varchar(50),
    @Description varchar(400),
    @price money,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		Product
	SET
		CatalogNumber = @CatalogNumber,
		ProductName = @ProductName,
		Description = @Description,
		price = @price,
		Active = @Active
	WHERE
		ProductID = @ProductID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddProduct]
    @CatalogNumber varchar(50),
    @ProductName varchar(50),
    @Description varchar(400),
    @price money,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO Product(
		CatalogNumber,
		ProductName,
		Description,
		price,
		Active
    )VALUES(
		@CatalogNumber,
		@ProductName,
		@Description,
		@price,
		@Active)
END
' 
END
GO
/****** Object:  Table [dbo].[Category]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Category]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryID] [int] NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_Category] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetOrders]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetOrders]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetOrders]
	@OrderStatusID int = NULL,
	@CustomerID int = NULL,
	@StartDate datetime,
	@EndDate datetime,
	@PageIndex int,
    @PageSize int,
	@Active bit = 1
AS
BEGIN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForCustomerOrders
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        OrderID int
    )

    -- Insert into our temp table
	IF @OrderStatusID IS NOT NULL AND @CustomerID IS NULL
		BEGIN
			INSERT INTO #PageIndexForCustomerOrders (OrderID)
			SELECT
				OrderID
			FROM
				[Order]
			WHERE
				OrderStatusID = @OrderStatusID AND
				(OrderDate BETWEEN @StartDate AND @EndDate)

			SELECT @TotalRecords = @@ROWCOUNT
		END
	ELSE IF @OrderStatusID IS NULL AND @CustomerID IS NOT NULL
		BEGIN
			INSERT INTO #PageIndexForCustomerOrders (OrderID)
			SELECT
				OrderID
			FROM
				[Order]
			WHERE
				CustomerID = @CustomerID AND
				(OrderDate BETWEEN @StartDate AND @EndDate)

			SELECT @TotalRecords = @@ROWCOUNT
		END

	SELECT
		O.OrderID,
		O.CustomerID,
		O.OrderNumber,
		O.OrderDate,
		O.OrderStatusID,
		(Select OrderStatusName FROM OrderStatus WHERE OrderStatusID = O.OrderStatusID) AS OrderStatusName,
		O.ShippingProviderID,
		(Select ShippingProviderName FROM ShippingProvider WHERE ShippingProviderID = O.ShippingProviderID) AS ShippingProviderName,
		O.ShippingNumber,
		O.Address,
		O.City,
		O.StateID,
		(Select StateName FROM State WHERE StateID = O.StateID) AS StateName,
		O.ProvinceID,
		(Select ProvinceName FROM Province WHERE ProvinceID = O.ProvinceID) AS ProvinceName,
		O.CountryID,
		(Select CountryName FROM Country WHERE CountryID = O.CountryID) AS CountryName,
		O.Zipcode,
		O.DatePlaced,
		O.DateShipped,
		O.Total,
		O.Shipping,
		O.Tax,
		O.Active
	FROM
		[Order] O INNER JOIN #PageIndexForCustomerOrders i ON
		O.OrderID = i.OrderID
	WHERE
		O.Active = @Active AND
		i.IndexId >= @PageLowerBound AND 
		i.IndexId <= @PageUpperBound
	ORDER BY
		OrderDate DESC
	
	RETURN @TotalRecords

    DROP TABLE #PageIndexForOrders
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_WebEvent_Events]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) NULL,
	[ApplicationPath] [nvarchar](256) NULL,
	[ApplicationVirtualPath] [nvarchar](256) NULL,
	[MachineName] [nvarchar](256) NOT NULL,
	[RequestUrl] [nvarchar](1024) NULL,
	[ExceptionType] [nvarchar](256) NULL,
	[Details] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerID]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomerID]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomerID]
	@MemberID uniqueidentifier
AS
BEGIN
	SELECT
		CustomerID
	FROM
		Customer
	WHERE
		MemberID = @MemberID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderStatus]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateOrderStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateOrderStatus]
	@OrderID int,
    @OrderStatusID int
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		[Order]
	SET
		OrderStatusID = @OrderStatusID
	WHERE
		OrderID = @OrderID
END
' 
END
GO
/****** Object:  Table [dbo].[Country]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Country]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RestorePermissions]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Setup_RestorePermissions]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + '' '' + @action + '' on '' + @object + '' TO ['' + @grantee + '']''
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END' 
END
GO
/****** Object:  Table [dbo].[Province]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Province]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [varchar](50) NOT NULL,
	[ProvinceCode] [varchar](2) NOT NULL,
	[Active] [char](10) NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Setup_RemoveAllRoleMembers]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Setup_RemoveAllRoleMembers]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = ''EXEC sp_droprolemember '' + '''''''' + @name + '''''', '''''' + USER_NAME(@user_id) + ''''''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END' 
END
GO
/****** Object:  Table [dbo].[aspnet_Applications]    Script Date: 05/23/2009 17:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) NOT NULL,
	[LoweredApplicationName] [nvarchar](256) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND name = N'aspnet_Applications_Index')
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications] 
(
	[LoweredApplicationName] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomFieldType]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CustomFieldType]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CustomFieldType](
	[CustomFieldTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CustomFieldTypeName] [varchar](50) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CustomFieldType] PRIMARY KEY CLUSTERED 
(
	[CustomFieldTypeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Order]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderNumber] [varchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[OrderStatusID] [int] NULL,
	[ShippingProviderID] [int] NULL,
	[ShippingNumber] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StateID] [int] NULL,
	[ProvinceID] [int] NULL,
	[CountryID] [int] NULL,
	[Zipcode] [varchar](50) NULL,
	[Comments] [varchar](400) NULL,
	[DatePlaced] [datetime] NULL,
	[DateShipped] [datetime] NULL,
	[Total] [money] NULL,
	[Shipping] [money] NULL,
	[Tax] [money] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Customer]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [uniqueidentifier] NOT NULL,
	[Company] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[StateID] [int] NULL,
	[ProvinceID] [int] NULL,
	[CountryID] [int] NULL,
	[Zipcode] [varchar](50) NULL,
	[DayPhone] [varchar](50) NULL,
	[EveningPhone] [varchar](50) NULL,
	[CellPhone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
) ON [PRIMARY],
 CONSTRAINT [IX_Customer] UNIQUE NONCLUSTERED 
(
	[Email] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Tax]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Tax](
	[TaxID] [int] IDENTITY(1,1) NOT NULL,
	[TaxName] [varchar](50) NOT NULL,
	[Fixed] [bit] NOT NULL,
	[Amount] [decimal](18, 3) NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NULL,
	[ProvinceID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Tax] PRIMARY KEY CLUSTERED 
(
	[TaxID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Shipping]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Shipping](
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NULL,
	[ProvinceID] [int] NULL,
	[ProductID] [int] NOT NULL,
	[ShippingProviderID] [int] NOT NULL,
	[Rate] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrderProductCustomField]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OrderProductCustomField]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderProductCustomField](
	[OrderProductCustomFieldID] [int] IDENTITY(1,1) NOT NULL,
	[OrderProductID] [int] NOT NULL,
	[CustomFieldID] [int] NOT NULL,
	[OrderProductCustomFieldValue] [varchar](400) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OrderProductCustomField] PRIMARY KEY CLUSTERED 
(
	[OrderProductCustomFieldID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderProductOption]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OrderProductOption]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderProductOption](
	[OrderProductOptionID] [int] IDENTITY(1,1) NOT NULL,
	[OrderProductID] [int] NOT NULL,
	[ProductOptionID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OrderProductOption] PRIMARY KEY CLUSTERED 
(
	[OrderProductOptionID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductTag]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProductTag]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProductTag](
	[ProductTagID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductTagID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductOption]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProductOption]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProductOption](
	[ProductOptionID] [int] IDENTITY(1,1) NOT NULL,
	[ProductOptionName] [varchar](50) NOT NULL,
	[ProductOptionGroup] [varchar](50) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PriceChange] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductOption] PRIMARY KEY CLUSTERED 
(
	[ProductOptionID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RelatedProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RelatedProduct]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[RelatedProduct](
	[RelatedProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductOneID] [int] NOT NULL,
	[ProductTwoID] [int] NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_RelatedProduct] PRIMARY KEY CLUSTERED 
(
	[RelatedProductID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ProductCategory]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[FeaturedProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FeaturedProduct]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[FeaturedProduct](
	[FeaturedProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_FeaturedProduct] PRIMARY KEY CLUSTERED 
(
	[FeaturedProductID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OrderProduct]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[OrderProduct](
	[OrderProductID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PricePerUnit] [money] NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[Discount] [money] NULL,
	[Shipping] [money] NULL,
	[OrderDate] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CustomField]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[CustomField]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[CustomField](
	[CustomFieldID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CustomFieldName] [varchar](50) NOT NULL,
	[CustomFieldTypeID] [int] NOT NULL,
	[IsRequired] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CustomField] PRIMARY KEY CLUSTERED 
(
	[CustomFieldID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Image]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Image]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[ProductID] [int] NOT NULL,
	[SortOrder] [int] NULL,
	[ImageName] [varchar](200) NULL,
	[ImageURL] [varchar](200) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[aspnet_UsersInRoles]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND name = N'aspnet_UsersInRoles_index')
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles] 
(
	[RoleId] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationPerUser]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[PathId] ASC,
	[UserId] ASC
) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_ncindex2')
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser] 
(
	[UserId] ASC,
	[PathId] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_PersonalizationAllUsers]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[aspnet_Paths]    Script Date: 05/23/2009 17:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Path] [nvarchar](256) NOT NULL,
	[LoweredPath] [nvarchar](256) NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND name = N'aspnet_Paths_index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths] 
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Membership]    Script Date: 05/23/2009 17:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL DEFAULT (0),
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[MobilePIN] [nvarchar](16) NULL,
	[Email] [nvarchar](256) NULL,
	[LoweredEmail] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND name = N'aspnet_Membership_index')
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership] 
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL DEFAULT (null),
	[IsAnonymous] [bit] NOT NULL DEFAULT (0),
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index2')
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users] 
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Roles]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[RoleName] [nvarchar](256) NOT NULL,
	[LoweredRoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND name = N'aspnet_Roles_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles] 
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aspnet_Profile]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] NOT NULL,
	[PropertyValuesString] [ntext] NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[GetStates]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetStates]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetStates]
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		StateID,
		StateName
	FROM
		State
	WHERE
		Active = @Active
    ORDER BY
		StateName
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetStateCode]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetStateCode]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetStateCode] 
	@StateID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		StateCode
	FROM
		State
	WHERE
		StateID = @StateID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderProductCustomFields]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetOrderProductCustomFields]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetOrderProductCustomFields] 
	@OrderProductID int,
	@Active bit = 1
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		OrderProductCustomFieldID
		OrderProductID,
        OrderProductCustomField.CustomFieldID,
		CustomField.CustomFieldName,
        OrderProductCustomFieldValue,
        OrderProductCustomField.Active
	FROM
		OrderProductCustomField JOIN CustomField ON
		OrderProductCustomField.CustomFieldID = CustomField.CustomFieldID
	WHERE
		OrderProductCustomField.OrderProductID = @OrderProductID AND
		OrderProductCustomField.Active = @Active AND
		CustomField.Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomFields]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomFields]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomFields] 
	@ProductID int = NULL,
	@Active bit = 1
AS
BEGIN

	SET NOCOUNT ON;

    SELECT
		CustomFieldID,
		ProductID,
		CustomFieldName,
		CustomFieldTypeName,
		IsRequired,
		CustomField.Active
	FROM
		CustomField JOIN CustomFieldType ON
		CustomField.CustomFieldTypeID = CustomFieldType.CustomFieldTypeID
	WHERE
		(ProductID = @ProductID OR ProductID IS NULL) AND
		CustomField.Active = @Active AND
		CustomFieldType.Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UnRegisterSchemaVersion]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UnRegisterSchemaVersion]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_RegisterSchemaVersion]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_RegisterSchemaVersion]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_CheckSchemaVersion]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_CheckSchemaVersion]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderProducts]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetOrderProducts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetOrderProducts]
	@OrderID int,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		OP.OrderProductID,
		OP.OrderID,
		OP.ProductID,
		OP.Quantity,
		OP.PricePerUnit,
		OP.TotalPrice,
		OP.Discount,
		OP.Shipping,
		OP.OrderDate,
		OP.Active,
		P.ProductName,
		P.CatalogNumber
	FROM
		OrderProduct OP INNER JOIN Product P ON
		OP.ProductID = P.ProductID
	WHERE
		OrderID = @OrderID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddOrderProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddOrderProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddOrderProduct] 
	@OrderID int,
    @ProductID int,
    @Quantity int,
    @PricePerUnit money,
    @TotalPrice money,
    @Discount money,
    @Shipping money,
    @OrderDate datetime,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO OrderProduct(
		OrderID,
        ProductID,
        Quantity,
        PricePerUnit,
        TotalPrice,
        Discount,
        Shipping,
        OrderDate,
        Active
     )VALUES(
		@OrderID,
		@ProductID,
		@Quantity,
		@PricePerUnit,
		@TotalPrice,
		@Discount,
		@Shipping,
		@OrderDate,
		@Active)
	
	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderProduct]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateOrderProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateOrderProduct]
	@OrderProductID int,
	@OrderID int,
    @ProductID int,
    @Quantity int,
    @PricePerUnit money,
    @TotalPrice money,
    @Discount money,
    @Shipping money,
    @OrderDate datetime,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		[OrderProduct]
	SET
		OrderID = @OrderID,
		ProductID = @ProductID,
		Quantity = @Quantity,
		PricePerUnit = @PricePerUnit,
		TotalPrice = @TotalPrice,
		Discount = @Discount,
		Shipping = @Shipping,
		OrderDate = @OrderDate,
		Active = @Active
	WHERE
		OrderProductID = @OrderProductID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderStatus]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetOrderStatus]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetOrderStatus]
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		OrderStatusID
		OrderStatusName
	FROM
		OrderStatus
	WHERE
		Active = @Active
    ORDER BY
		OrderStatusName
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetTags]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetTags]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetTags]
	@Active bit = 1
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT DISTINCT
		TagName
	FROM
		Tag
	WHERE
		Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByName]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByEmail]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByEmail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetUserByUserId]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByUserId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPasswordWithFormat]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPasswordWithFormat]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_MembershipUsers]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_MembershipUsers]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetNumberOfUsersOnline]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetNumberOfUsersOnline]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ResetPassword]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_ResetPassword]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUserInfo]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUserInfo]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            SET @LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetPassword]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPassword]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_SetPassword]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_SetPassword]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UnlockUser]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_UnlockUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 ),
        LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )
    WHERE @UserId = UserId

    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_UpdateUser]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetShippingPoviders]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetShippingPoviders]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetShippingPoviders]
	@Active bit = 1
AS

SELECT
	ShippingProviderID,
	ShippingProviderName,
	ShippingCost
FROM  
	ShippingProvider
WHERE
	Active = @Active
ORDER BY
	ShippingProviderName' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetShippingCosts]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetShippingCosts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetShippingCosts]
	@ShippingProviderID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		ShippingCost
	FROM  
		ShippingProvider
	WHERE
		ShippingProviderID = @ShippingProviderID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteInactiveProfiles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteInactiveProfiles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProperties]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProperties]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_Profiles]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_Profiles]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  '
GO
/****** Object:  StoredProcedure [dbo].[GetFeaturedProducts]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetFeaturedProducts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetFeaturedProducts]
	@CategoryID int = NULL,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @CategoryID IS NOT NULL
		BEGIN
			SELECT
				fp.FeaturedProductID,
				fp.ProductID,
				p.ProductName,
				(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = fp.ProductID AND ParentID IS NOT NULL) AS Thumbnail,
				fp.CategoryID,
				fp.Active
			FROM
				FeaturedProduct fp INNER JOIN Product p ON
				fp.ProductID = p.ProductID
			WHERE
				fp.CategoryID = @CategoryID AND
				fp.Active = @Active AND
				p.Active = @Active
		END
	ELSE
		BEGIN
			SELECT
				fp.FeaturedProductID,
				fp.ProductID,
				p.ProductName,
				(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = fp.ProductID AND ParentID IS NOT NULL) AS Thumbnail,
				fp.CategoryID,
				fp.Active
			FROM
				FeaturedProduct fp INNER JOIN Product p ON
				fp.ProductID = p.ProductID
			WHERE
				CategoryID IS NULL AND
				fp.Active = @Active AND
				p.Active = @Active
		END

END
' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_Roles]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_Roles]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetRolesForUser]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetRolesForUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_IsUserInRole]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_IsUserInRole]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_RoleExists]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Roles_RoleExists]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_GetAllRoles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Roles_GetAllRoles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_FindUsersInRole]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_FindUsersInRole]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_AddUsersToRoles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_AddUsersToRoles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_DeleteRole]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Roles_DeleteRole]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'''', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_UsersInRoles_GetUsersInRoles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetUsersInRoles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_UsersInRoles]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_UsersInRoles]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  '
GO
/****** Object:  StoredProcedure [dbo].[RemoveProductCategory]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RemoveProductCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[RemoveProductCategory] 
	@ProductCategoryID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE FROM ProductCategory
	WHERE
		ProductCategoryID = @ProductCategoryID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductCategory]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateProductCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateProductCategory]
	@ProductCategoryID int,
	@ProductID int,
    @CategoryID int,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		ProductCategory
	SET
		ProductID = @ProductID,
		CategoryID = @CategoryID,
		Active = @Active
	WHERE
		ProductCategoryID = @ProductCategoryID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddProductCategory]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddProductCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddProductCategory]
	@CategoryID int,
    @ProductID int,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO ProductCategory(
		CategoryID,
        ProductID,
        Active
    )VALUES(
		@CategoryID,
        @ProductID,
        @Active)

	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveCategory]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RemoveCategory]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[RemoveCategory] 
	@CategoryID int
AS
BEGIN
	SET NOCOUNT ON;

    DELETE FROM ProductCategory
	WHERE
		CategoryID = @CategoryID

	DELETE FROM Category
	WHERE
		CategoryID = @CategoryID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveRelatedProduct]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RemoveRelatedProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[RemoveRelatedProduct] 
	@RelatedProductID int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM RelatedProduct
	WHERE
		RelatedProductID = @RelatedProductID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetRelatedProducts]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetRelatedProducts]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetRelatedProducts]
	@ProductID int,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		rp.RelatedProductID,
		rp.ProductTwoID AS ProductID,
		p.ProductName,
		(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = ProductID AND ParentID IS NOT NULL) AS Thumbnail,
		rp.Active
	FROM
		RelatedProduct rp INNER JOIN Product p ON
		rp.ProductTwoID = p.ProductID
	WHERE
		rp.ProductOneID = @ProductID AND
		rp.Active = @Active AND
		P.Active = @Active

	UNION
	
	SELECT
		rp.RelatedProductID,
		rp.ProductOneID AS ProductID,
		p.ProductName,
		(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = ProductID AND ParentID IS NOT NULL) AS Thumbnail,
		rp.Active
	FROM
		RelatedProduct rp INNER JOIN Product p ON
		rp.ProductOneID = p.ProductID
	WHERE
		rp.ProductTwoID = @ProductID AND
		rp.Active = @Active AND
		P.Active = @Active
	
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddRelatedProduct]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddRelatedProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddRelatedProduct] 
	@ProductOneID int,
    @ProductTwoID int,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO RelatedProduct(
        ProductOneID,
		ProductTwoID,
        Active
     )VALUES(
		@ProductOneID,
		@ProductTwoID,
		@Active)
	
	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Paths]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Paths]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Paths_CreatePath]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Paths_CreatePath]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_Shared]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Shared]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  '
GO
/****** Object:  View [dbo].[vw_aspnet_WebPartState_User]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_User]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  '
GO
/****** Object:  StoredProcedure [dbo].[GetProductShipping]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProductShipping]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProductShipping] 
	@CountryID int,
    @StateID int = null,
    @ProvinceID int = null,
    @ProductID int,
    @ShippingProviderID int,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		Rate
	FROM
		Shipping
	WHERE
		CountryID = @CountryID AND
		(StateID = @StateID OR StateID IS NULL) AND
		(ProvinceID = @ProvinceID OR ProvinceID IS NULL) AND
		ProductID = @ProductID AND
		ShippingProviderID = @ShippingProviderID AND
		Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductImages]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProductImages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetProductImages] 
	@ProductID int,
	@Thums bit = 0,
	@Active bit= 1
AS
BEGIN
	SET NOCOUNT ON;

	IF @Thums = 1
		BEGIN
			SELECT
				ImageURL
			FROM
				[Image]
			WHERE
				ProductID = @ProductID AND
				ParentID IS NOT NULL AND
				Active = @Active
			ORDER BY
				SortOrder
		END
	ELSE
		BEGIN
			SELECT
				ImageURL
			FROM
				[Image]
			WHERE
				ProductID  = @ProductID AND
				ParentID IS NULL AND
				Active = @Active
			ORDER BY
				SortOrder
		END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddImage]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddImage]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddImage] 
	@ProductID int,
	@ParentID int = NULL,
    @SortOrder int,
    @ImageName varchar(200),
    @ImageURL varchar(200),
	@Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO [Image](
		ProductID,
		ParentID,
        SortOrder,
        ImageName,
        ImageURL,
        Active
     )VALUES(
		@ProductID,
		@ParentID,
        @SortOrder,
        @ImageName,
        @ImageURL,
		@Active)
	
	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateImage]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateImage]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateImage]
	@ImageID int,
	@ParentID int,
	@ProductID int,
    @SortOrder int,
    @ImageName varchar(200),
    @ImageURL varchar(200),
	@Active bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		[Image]
	SET	
		ParentID = @ParentID,
		ProductID = @ProductID,
		SortOrder = @SortOrder,
		ImageName = @ImageName,
		ImageURL = @ImageURL,
		Active = @Active
	WHERE
		ImageID = @ImageID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[RemoveImage]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RemoveImage]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[RemoveImage] 
	@ImageID int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [Image]
	WHERE
		ParentID = @ImageID

    DELETE FROM [Image]
	WHERE
		ImageID = @ImageID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetImage]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetImage]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetImage]
	@ImageID int = NULL,
	@ParentID int = NULL,
	@ProductID int = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	IF @ImageID IS NOT NULL AND @ParentID IS NULL AND @ProductID IS NULL
		BEGIN
			SELECT
				ImageID,
				ParentID,
				ProductID,
				SortOrder,
				ImageName,
				ImageURL,
				Active
			FROM
				[Image]
			WHERE
				ImageID = @ImageID
		END
	ELSE IF @ImageID IS NULL AND @ParentID IS NOT NULL AND @ProductID IS NULL
		BEGIN
			SELECT
				ImageID,
				ParentID,
				ProductID,
				SortOrder,
				ImageName,
				ImageURL,
				Active
			FROM
				[Image]
			WHERE
				ParentID = @ParentID
		END
	ELSE IF @ImageID IS NULL AND @ParentID IS NULL AND @ProductID IS NOT NULL
		BEGIN
			SELECT
				ImageID,
				ParentID,
				ProductID,
				SortOrder,
				ImageName,
				ImageURL,
				Active
			FROM
				[Image]
			WHERE
				ProductID = @ProductID
		END

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProduct]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProduct]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProduct] 
	@ProductID int = NULL,
	@ProductName varchar(50) = NULL,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	IF @ProductName IS NULL
		BEGIN
			SELECT 
				ProductID,
				CatalogNumber,
				ProductName,
				Description,
				(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = ProductID AND ParentID IS NOT NULL ORDER BY SortOrder) AS Thumbnail,
				(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = ProductID AND ParentID IS NULL ORDER BY SortOrder) AS ImageURL,
				price,
				Active 
			FROM
				[Product]
			WHERE
				ProductID = @ProductID
		END
	ELSE
		BEGIN
			SELECT 
				ProductID,
				CatalogNumber,
				ProductName,
				Description,
				(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = ProductID AND ParentID IS NOT NULL ORDER BY SortOrder) AS Thumbnail,
				(SELECT TOP 1 ImageURL FROM [Image] WHERE ProductID = ProductID AND ParentID IS NULL ORDER BY SortOrder) AS ImageURL,
				price,
				Active 
			FROM
				[Product]
			WHERE
				ProductName = @ProductName
		END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_WebEvent_LogEvent]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_LogEvent]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerMemberID]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCustomerMemberID]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCustomerMemberID]
	@CustomerID int
AS
BEGIN
	SELECT
		MemberID
	FROM
		Customer
	WHERE
		CustomerID = @CustomerID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddCustomer]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddCustomer] 
	@MemberID uniqueidentifier,
	@Company varchar(50) = null,
    @FirstName varchar(50) = null,
    @LastName varchar(50) = null,
    @Address varchar(50) = null,
    @City varchar(50) = null,
    @StateID int = null,
	@ProvinceID int = null,
    @CountryID int = null,
    @Zipcode varchar(50) = null,
    @DayPhone varchar(50) = null,
    @EveningPhone varchar(50) = null,
    @CellPhone varchar(50) = null,
    @Fax varchar(50) = null,
    @Email varchar(50),
    @DateCreated datetime,
    @DateUpdated datetime = GETDATE,
    @Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO Customer(
		MemberID,
        Company,
        FirstName,
        LastName,
        Address,
        City,
        StateID,
		ProvinceID,
        CountryID,
        Zipcode,
        DayPhone,
        EveningPhone,
        CellPhone,
        Fax,
        Email,
        DateCreated,
        DateUpdated,
        Active
	)VALUES(
		@MemberID,
		@Company,
		@FirstName,
		@LastName,
		@Address,
		@City,
		@StateID,
		@ProvinceID,
		@CountryID,
		@Zipcode,
		@DayPhone,
		@EveningPhone,
		@CellPhone,
		@Fax,
		@Email,
		@DateCreated,
		@DateUpdated,
		@Active)

	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddOrder]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddOrder]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddOrder]
	@CustomerID int,
    @OrderNumber varchar(50),
    @OrderDate datetime,
    @OrderStatusID int,
    @ShippingProviderID int,
    @Address varchar(50),
    @City varchar(50),
    @StateID int = null,
	@ProvinceID int = null,
    @CountryID int,
    @Zipcode varchar(50),
	@Comments varchar(50) = null,
    @DatePlaced datetime,
    @DateShipped datetime = null,
    @Total money,
    @Shipping money,
    @Tax money,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO [Order](
		CustomerID,
        OrderNumber,
        OrderDate,
        OrderStatusID,
        ShippingProviderID,
        Address,
        City,
        StateID,
		ProvinceID,
        CountryID,
        Zipcode,
		Comments,
        DatePlaced,
        DateShipped,
        Total,
        Shipping,
        Tax,
        Active
	)VALUES(
		@CustomerID,
		@OrderNumber,
		@OrderDate,
		@OrderStatusID,
		@ShippingProviderID,
		@Address,
		@City,
		@StateID,
		@ProvinceID,
		@CountryID,
		@Zipcode,
		@Comments,
		@DatePlaced,
		@DateShipped,
		@Total,
		@Shipping,
		@Tax,
		@Active)
	
	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateOrder]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[UpdateOrder]
	@OrderID int,
	@CustomerID int,
    @OrderNumber varchar(50),
    @OrderDate datetime,
    @OrderStatusID int,
    @ShippingProviderID int,
    @Address varchar(50),
    @City varchar(50),
    @StateID int,
    @CountryID int,
    @Zipcode varchar(50),
	@Comments varchar(50) = null,
    @DatePlaced datetime,
    @DateShipped datetime,
    @Total money,
    @Shipping money,
    @Tax money,
    @Active bit
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE
		[Order]
	SET
		CustomerID = @CustomerID,
		OrderNumber = @OrderNumber,
		OrderDate = @OrderDate,
		OrderStatusID = @OrderStatusID,
		ShippingProviderID = @ShippingProviderID,
		Address = @Address,
		City = @City,
		StateID = @StateID,
		CountryID = @CountryID,
		Zipcode = @Zipcode,
		Comments = @Comments,
		DatePlaced = @DatePlaced,
		DateShipped = @DateShipped,
		Total = @Total,
		Shipping = @Shipping,
		Tax = @Tax,
		Active = @Active
	WHERE
		OrderID = @OrderID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountryCode]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCountryCode]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCountryCode] 
	@CountryID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		CountryCode
	FROM
		Country
	WHERE
		CountryID = @CountryID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountries]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetCountries]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetCountries]
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		CountryID,
		CountryName
	FROM
		Country
	WHERE
		Active = @Active
    ORDER BY
		CountryName
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductOptions]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProductOptions]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProductOptions] 
	@ProductID int,
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		ProductOptionID,
		ProductOptionName,
		ProductOptionGroup,
		ProductID,
		PriceChange,
		Active
	FROM
		ProductOption
	WHERE
		ProductID = @ProductID AND
		Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderProductOptions]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetOrderProductOptions]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetOrderProductOptions] 
	@OrderProductID int,
	@Active int = 1
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
		OPO.OrderProductOptionID,
		OPO.OrderProductID,
		OPO.ProductOptionID,
		PO.ProductOptionName,
		OPO.Active
	FROM
		OrderProductOption OPO JOIN ProductOption PO ON
		OPO.ProductOptionID = po.ProductOptionID
	WHERE
		OPO.OrderProductID = @OrderProductID AND
		OPO.Active = @Active
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[IsProductOptionsExist]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[IsProductOptionsExist]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[IsProductOptionsExist] 
	@ProductID int,
	@Active bit = 1
AS
BEGIN
	
	SET NOCOUNT ON;

    IF EXISTS(SELECT 1 FROM ProductOption WHERE ProductID = @ProductID AND Active = @Active)
		BEGIN
			SELECT 1
		END
	ELSE
		BEGIN
			SELECT 0
		END	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[AddOrderProductOption]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddOrderProductOption]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddOrderProductOption] 
	@OrderProductID int,
    @ProductOptionID int,
    @Active bit = 1
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO OrderProductOption(
		OrderProductID,
        ProductOptionID,
        Active
	)VALUES(
		@OrderProductID,
        @ProductOptionID,
        @Active)

	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProvinceCode]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProvinceCode]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProvinceCode] 
	@ProvinceID int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT
		ProvinceCode
	FROM
		Province
	WHERE
		ProvinceID = @ProvinceID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetProvinces]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[GetProvinces]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[GetProvinces]
	@Active bit = 1
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT
		ProvinceID,
		ProvinceName
	FROM
		Province
	WHERE
		Active = @Active
    ORDER BY
		ProvinceName
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Applications_CreateApplication]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Applications_CreateApplication]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Personalization_GetApplicationId]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Personalization_GetApplicationId]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByName]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByName]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_FindUsersByEmail]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByEmail]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_GetAllUsers]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetAllUsers]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_Applications]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_Applications]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  '
GO
/****** Object:  StoredProcedure [dbo].[aspnet_AnyDataInTables]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_AnyDataInTables]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_MembershipUsers'') AND (type = ''V''))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N''aspnet_Membership''
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Roles'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N''aspnet_Roles''
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Profiles'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N''aspnet_Profile''
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_WebPartState_User'') AND (type = ''V''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N''aspnet_PersonalizationPerUser''
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''aspnet_WebEvent_LogEvent'') AND (type = ''P''))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N''aspnet_WebEvent_Events''
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N''aspnet_Users''
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N''aspnet_Applications''
            RETURN
        END
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_DeleteUser]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Users_DeleteUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_MembershipUsers'') AND (type = ''V''))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_UsersInRoles'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_Profiles'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N''vw_aspnet_WebPartState_User'') AND (type = ''V''))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_GetProfiles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProfiles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Users_CreateUser]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Users_CreateUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END' 
END
GO
/****** Object:  View [dbo].[vw_aspnet_Users]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vw_aspnet_Users]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  '
GO
/****** Object:  StoredProcedure [dbo].[AddOrderProductCustomField]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[AddOrderProductCustomField]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[AddOrderProductCustomField]
	@OrderProductID int,
    @CustomFieldID int,
    @OrderProductCustomFieldValue varchar(400),
    @Active bit = 1
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO OrderProductCustomField(
		OrderProductID,
        CustomFieldID,
        OrderProductCustomFieldValue,
        Active
     )VALUES(
        @OrderProductID,
        @CustomFieldID,
        @OrderProductCustomFieldValue,
        @Active)

	SELECT SCOPE_IDENTITY()
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Membership_CreateUser]    Script Date: 05/23/2009 17:25:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Membership_CreateUser]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, ''17540101'', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_SetProperties]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile_SetProperties]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_SetPageSettings]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Roles_CreateRole]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Roles_CreateRole]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_Profile_DeleteProfiles]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteProfiles]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N'','', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_GetCountOfState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_DeleteAllState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetSharedState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_ResetUserState]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetUserState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_GetPageSettings]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[aspnet_PersonalizationAdministration_FindState]    Script Date: 05/23/2009 17:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_FindState]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END' 
END
GO
/****** Object:  ForeignKey [FK__aspnet_Me__Appli__0EA330E9]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__0EA330E9]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Me__UserI__0F975522]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__0F975522]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pa__Appli__403A8C7D]    Script Date: 05/23/2009 17:25:58 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__403A8C7D]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__45F365D3]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__45F365D3]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__PathI__49C3F6B7]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__49C3F6B7]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pe__UserI__4AB81AF0]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__4AB81AF0]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Pr__UserI__239E4DCF]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__239E4DCF]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK__aspnet_Ro__Appli__2D27B809]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__2D27B809]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__Appli__7E6CC920]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__7E6CC920]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__RoleI__31EC6D26]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__31EC6D26]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
/****** Object:  ForeignKey [FK__aspnet_Us__UserI__30F848ED]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__30F848ED]') AND type = 'F')
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
/****** Object:  ForeignKey [FK_Customer_aspnet_Users]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Customer_aspnet_Users]') AND type = 'F')
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_aspnet_Users] FOREIGN KEY([MemberID])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_aspnet_Users]
GO
/****** Object:  ForeignKey [FK_Customer_Country]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Customer_Country]') AND type = 'F')
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Country]
GO
/****** Object:  ForeignKey [FK_Customer_Province]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Customer_Province]') AND type = 'F')
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Province]
GO
/****** Object:  ForeignKey [FK_Customer_State]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Customer_State]') AND type = 'F')
ALTER TABLE [dbo].[Customer]  WITH NOCHECK ADD  CONSTRAINT [FK_Customer_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_State]
GO
/****** Object:  ForeignKey [FK_CustomField_CustomFieldType]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_CustomField_CustomFieldType]') AND type = 'F')
ALTER TABLE [dbo].[CustomField]  WITH CHECK ADD  CONSTRAINT [FK_CustomField_CustomFieldType] FOREIGN KEY([CustomFieldTypeID])
REFERENCES [dbo].[CustomFieldType] ([CustomFieldTypeID])
GO
ALTER TABLE [dbo].[CustomField] CHECK CONSTRAINT [FK_CustomField_CustomFieldType]
GO
/****** Object:  ForeignKey [FK_CustomField_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_CustomField_Product]') AND type = 'F')
ALTER TABLE [dbo].[CustomField]  WITH NOCHECK ADD  CONSTRAINT [FK_CustomField_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[CustomField] CHECK CONSTRAINT [FK_CustomField_Product]
GO
/****** Object:  ForeignKey [FK_FeaturedProduct_Category]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_FeaturedProduct_Category]') AND type = 'F')
ALTER TABLE [dbo].[FeaturedProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_FeaturedProduct_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[FeaturedProduct] CHECK CONSTRAINT [FK_FeaturedProduct_Category]
GO
/****** Object:  ForeignKey [FK_FeaturedProduct_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_FeaturedProduct_Product]') AND type = 'F')
ALTER TABLE [dbo].[FeaturedProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_FeaturedProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[FeaturedProduct] CHECK CONSTRAINT [FK_FeaturedProduct_Product]
GO
/****** Object:  ForeignKey [FK_Image_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Image_Product]') AND type = 'F')
ALTER TABLE [dbo].[Image]  WITH NOCHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
/****** Object:  ForeignKey [FK_Order_Country]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Order_Country]') AND type = 'F')
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Country]
GO
/****** Object:  ForeignKey [FK_Order_OrderStatus]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Order_OrderStatus]') AND type = 'F')
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
/****** Object:  ForeignKey [FK_Order_Province]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Order_Province]') AND type = 'F')
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Province]
GO
/****** Object:  ForeignKey [FK_Order_ShippingProvider]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Order_ShippingProvider]') AND type = 'F')
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_ShippingProvider] FOREIGN KEY([ShippingProviderID])
REFERENCES [dbo].[ShippingProvider] ([ShippingProviderID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ShippingProvider]
GO
/****** Object:  ForeignKey [FK_Order_State]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Order_State]') AND type = 'F')
ALTER TABLE [dbo].[Order]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_State]
GO
/****** Object:  ForeignKey [FK_OrderProduct_Order]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_OrderProduct_Order]') AND type = 'F')
ALTER TABLE [dbo].[OrderProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
/****** Object:  ForeignKey [FK_OrderProduct_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_OrderProduct_Product]') AND type = 'F')
ALTER TABLE [dbo].[OrderProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
/****** Object:  ForeignKey [FK_OrderProductCustomField_CustomField]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_OrderProductCustomField_CustomField]') AND type = 'F')
ALTER TABLE [dbo].[OrderProductCustomField]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductCustomField_CustomField] FOREIGN KEY([CustomFieldID])
REFERENCES [dbo].[CustomField] ([CustomFieldID])
GO
ALTER TABLE [dbo].[OrderProductCustomField] CHECK CONSTRAINT [FK_OrderProductCustomField_CustomField]
GO
/****** Object:  ForeignKey [FK_OrderProductCustomField_OrderProduct]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_OrderProductCustomField_OrderProduct]') AND type = 'F')
ALTER TABLE [dbo].[OrderProductCustomField]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductCustomField_OrderProduct] FOREIGN KEY([OrderProductID])
REFERENCES [dbo].[OrderProduct] ([OrderProductID])
GO
ALTER TABLE [dbo].[OrderProductCustomField] CHECK CONSTRAINT [FK_OrderProductCustomField_OrderProduct]
GO
/****** Object:  ForeignKey [FK_OrderProductOption_OrderProduct]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_OrderProductOption_OrderProduct]') AND type = 'F')
ALTER TABLE [dbo].[OrderProductOption]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductOption_OrderProduct] FOREIGN KEY([OrderProductID])
REFERENCES [dbo].[OrderProduct] ([OrderProductID])
GO
ALTER TABLE [dbo].[OrderProductOption] CHECK CONSTRAINT [FK_OrderProductOption_OrderProduct]
GO
/****** Object:  ForeignKey [FK_OrderProductOption_ProductOption]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_OrderProductOption_ProductOption]') AND type = 'F')
ALTER TABLE [dbo].[OrderProductOption]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductOption_ProductOption] FOREIGN KEY([ProductOptionID])
REFERENCES [dbo].[ProductOption] ([ProductOptionID])
GO
ALTER TABLE [dbo].[OrderProductOption] CHECK CONSTRAINT [FK_OrderProductOption_ProductOption]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Category]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_ProductCategory_Category]') AND type = 'F')
ALTER TABLE [dbo].[ProductCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Category]
GO
/****** Object:  ForeignKey [FK_ProductCategory_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_ProductCategory_Product]') AND type = 'F')
ALTER TABLE [dbo].[ProductCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductCategory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Product]
GO
/****** Object:  ForeignKey [FK_ProductOption_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_ProductOption_Product]') AND type = 'F')
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductOption_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [FK_ProductOption_Product]
GO
/****** Object:  ForeignKey [FK_ProductTag_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_ProductTag_Product]') AND type = 'F')
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Product]
GO
/****** Object:  ForeignKey [FK_ProductTag_Tag]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_ProductTag_Tag]') AND type = 'F')
ALTER TABLE [dbo].[ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[ProductTag] CHECK CONSTRAINT [FK_ProductTag_Tag]
GO
/****** Object:  ForeignKey [FK_RelatedProduct_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RelatedProduct_Product]') AND type = 'F')
ALTER TABLE [dbo].[RelatedProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_RelatedProduct_Product] FOREIGN KEY([ProductOneID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[RelatedProduct] CHECK CONSTRAINT [FK_RelatedProduct_Product]
GO
/****** Object:  ForeignKey [FK_RelatedProduct_Product1]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_RelatedProduct_Product1]') AND type = 'F')
ALTER TABLE [dbo].[RelatedProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_RelatedProduct_Product1] FOREIGN KEY([ProductTwoID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[RelatedProduct] CHECK CONSTRAINT [FK_RelatedProduct_Product1]
GO
/****** Object:  ForeignKey [FK_Shipping_Country]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Shipping_Country]') AND type = 'F')
ALTER TABLE [dbo].[Shipping]  WITH NOCHECK ADD  CONSTRAINT [FK_Shipping_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Country]
GO
/****** Object:  ForeignKey [FK_Shipping_Product]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Shipping_Product]') AND type = 'F')
ALTER TABLE [dbo].[Shipping]  WITH NOCHECK ADD  CONSTRAINT [FK_Shipping_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Product]
GO
/****** Object:  ForeignKey [FK_Shipping_Province]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Shipping_Province]') AND type = 'F')
ALTER TABLE [dbo].[Shipping]  WITH NOCHECK ADD  CONSTRAINT [FK_Shipping_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_Province]
GO
/****** Object:  ForeignKey [FK_Shipping_ShippingProvider]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Shipping_ShippingProvider]') AND type = 'F')
ALTER TABLE [dbo].[Shipping]  WITH NOCHECK ADD  CONSTRAINT [FK_Shipping_ShippingProvider] FOREIGN KEY([ShippingProviderID])
REFERENCES [dbo].[ShippingProvider] ([ShippingProviderID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_ShippingProvider]
GO
/****** Object:  ForeignKey [FK_Shipping_State]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Shipping_State]') AND type = 'F')
ALTER TABLE [dbo].[Shipping]  WITH NOCHECK ADD  CONSTRAINT [FK_Shipping_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK_Shipping_State]
GO
/****** Object:  ForeignKey [FK_Tax_Country]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Tax_Country]') AND type = 'F')
ALTER TABLE [dbo].[Tax]  WITH NOCHECK ADD  CONSTRAINT [FK_Tax_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Tax] CHECK CONSTRAINT [FK_Tax_Country]
GO
/****** Object:  ForeignKey [FK_Tax_Province]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Tax_Province]') AND type = 'F')
ALTER TABLE [dbo].[Tax]  WITH NOCHECK ADD  CONSTRAINT [FK_Tax_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[Tax] CHECK CONSTRAINT [FK_Tax_Province]
GO
/****** Object:  ForeignKey [FK_Tax_State]    Script Date: 05/23/2009 17:25:59 ******/
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[FK_Tax_State]') AND type = 'F')
ALTER TABLE [dbo].[Tax]  WITH NOCHECK ADD  CONSTRAINT [FK_Tax_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Tax] CHECK CONSTRAINT [FK_Tax_State]
GO

/****** Data ******/

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('common'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('health monitoring'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('membership'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('personalization'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('profile'
           ,'1'
           ,1)

INSERT INTO [aspnet_SchemaVersions]
           ([Feature]
           ,[CompatibleSchemaVersion]
           ,[IsCurrentVersion])
     VALUES
           ('role manager'
           ,'1'
           ,1)

INSERT INTO [aspnet_Applications]
           ([ApplicationName]
           ,[LoweredApplicationName]
           ,[ApplicationId]
           ,[Description])
     VALUES
           ('InvertedSoftwareCart'
           ,'invertedsoftwarecart'
           ,'de7c5af1-8dcc-4633-921f-8001edca639e'
           ,NULL)

INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AFGHANISTAN', 'AF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LAND ISLANDS', 'AX', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ALBANIA', 'AL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ALGERIA', 'DZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AMERICAN SAMOA', 'AS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANDORRA', 'AD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANGOLA', 'AO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANGUILLA', 'AI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANTARCTICA', 'AQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ANTIGUA AND BARBUDA', 'AG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ARGENTINA', 'AR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ARMENIA', 'AM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ARUBA', 'AW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AUSTRALIA', 'AU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AUSTRIA', 'AT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('AZERBAIJAN', 'AZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BAHAMAS', 'BS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BAHRAIN', 'BH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BANGLADESH', 'BD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BARBADOS', 'BB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BELARUS', 'BY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BELGIUM', 'BE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BELIZE', 'BZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BENIN', 'BJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BERMUDA', 'BM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BHUTAN', 'BT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOLIVIA', 'BO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOSNIA AND HERZEGOVINA', 'BA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOTSWANA', 'BW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BOUVET ISLAND', 'BV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BRAZIL', 'BR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BRITISH INDIAN OCEAN TERRITORY', 'IO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BRUNEI DARUSSALAM', 'BN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BULGARIA', 'BG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BURKINA FASO', 'BF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('BURUNDI', 'BI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAMBODIA', 'KH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAMEROON', 'CM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CANADA', 'CA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAPE VERDE', 'CV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CAYMAN ISLANDS', 'KY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CENTRAL AFRICAN REPUBLIC', 'CF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHAD', 'TD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHILE', 'CL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHINA', 'CN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CHRISTMAS ISLAND', 'CX', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COCOS (KEELING) ISLANDS', 'CC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COLOMBIA', 'CO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COMOROS', 'KM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CONGO', 'CG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COOK ISLANDS', 'CK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COSTA RICA', 'CR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('COTE D''IVOIRE', 'CI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CROATIA', 'HR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CUBA', 'CU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CYPRUS', 'CY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('CZECH REPUBLIC', 'CZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DENMARK', 'DK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DJIBOUTI', 'DJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DOMINICA', 'DM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('DOMINICAN REPUBLIC', 'DO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ECUADOR', 'EC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('EGYPT', 'EG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('EL SALVADOR', 'SV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('EQUATORIAL GUINEA', 'GQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ERITREA', 'ER', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ESTONIA', 'EE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ETHIOPIA', 'ET', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FALKLAND ISLANDS (MALVINAS)', 'FK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FAROE ISLANDS', 'FO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FIJI', 'FJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FINLAND', 'FI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRANCE', 'FR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRENCH GUIANA', 'GF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRENCH POLYNESIA', 'PF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('FRENCH SOUTHERN TERRITORIES', 'TF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GABON', 'GA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GAMBIA', 'GM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GEORGIA', 'GE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GERMANY', 'DE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GHANA', 'GH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GIBRALTAR', 'GI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GREECE', 'GR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GREENLAND', 'GL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GRENADA', 'GD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUADELOUPE', 'GP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUAM', 'GU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUATEMALA', 'GT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUERNSEY', 'GG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUINEA', 'GN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUINEA-BISSAU', 'GW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('GUYANA', 'GY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HAITI', 'HT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HEARD ISLAND AND MCDONALD ISLANDS', 'HM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HOLY SEE (VATICAN CITY STATE)', 'VA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HONDURAS', 'HN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HONG KONG', 'HK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('HUNGARY', 'HU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ICELAND', 'IS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('INDIA', 'IN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('INDONESIA', 'ID', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('IRAN, ISLAMIC REPUBLIC OF', 'IR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('IRAQ', 'IQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('IRELAND', 'IE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ISLE OF MAN', 'IM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ISRAEL', 'IL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ITALY', 'IT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JAMAICA', 'JM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JAPAN', 'JP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JERSEY', 'JE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('JORDAN', 'JO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KAZAKHSTAN', 'KZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KENYA', 'KE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KIRIBATI', 'KI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'KP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KOREA, REPUBLIC OF', 'KR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KUWAIT', 'KW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('KYRGYZSTAN', 'KG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'LA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LATVIA', 'LV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LEBANON', 'LB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LESOTHO', 'LS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LIBERIA', 'LR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LIBYAN ARAB JAMAHIRIYA', 'LY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LIECHTENSTEIN', 'LI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LITHUANIA', 'LT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('LUXEMBOURG', 'LU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MACAO', 'MO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MADAGASCAR', 'MG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALAWI', 'MW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALAYSIA', 'MY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALDIVES', 'MV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALI', 'ML', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MALTA', 'MT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MARSHALL ISLANDS', 'MH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MARTINIQUE', 'MQ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MAURITANIA', 'MR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MAURITIUS', 'MU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MAYOTTE', 'YT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MEXICO', 'MX', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MICRONESIA, FEDERATED STATES OF', 'FM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MOLDOVA, REPUBLIC OF', 'MD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MONACO', 'MC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MONGOLIA', 'MN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MONTSERRAT', 'MS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MOROCCO', 'MA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MOZAMBIQUE', 'MZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('MYANMAR', 'MM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NAMIBIA', 'NA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NAURU', 'NR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NEPAL', 'NP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NETHERLANDS', 'NL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NETHERLANDS ANTILLES', 'AN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NEW CALEDONIA', 'NC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NEW ZEALAND', 'NZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NICARAGUA', 'NI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NIGER', 'NE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NIGERIA', 'NG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NIUE', 'NU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NORFOLK ISLAND', 'NF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NORTHERN MARIANA ISLANDS', 'MP', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('NORWAY', 'NO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('OMAN', 'OM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PAKISTAN', 'PK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PALAU', 'PW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PALESTINIAN TERRITORY, OCCUPIED', 'PS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PANAMA', 'PA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PAPUA NEW GUINEA', 'PG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PARAGUAY', 'PY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PERU', 'PE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PHILIPPINES', 'PH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PITCAIRN', 'PN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('POLAND', 'PL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PORTUGAL', 'PT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('PUERTO RICO', 'PR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('QATAR', 'QA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('REUNION', 'RE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ROMANIA', 'RO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('RUSSIAN FEDERATION', 'RU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('RWANDA', 'RW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT HELENA', 'SH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT KITTS AND NEVIS', 'KN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT LUCIA', 'LC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT PIERRE AND MIQUELON', 'PM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAINT VINCENT AND THE GRENADINES', 'VC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAMOA', 'WS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAN MARINO', 'SM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAO TOME AND PRINCIPE', 'ST', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SAUDI ARABIA', 'SA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SENEGAL', 'SN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SERBIA AND MONTENEGRO', 'CS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SEYCHELLES', 'SC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SIERRA LEONE', 'SL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SINGAPORE', 'SG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SLOVAKIA', 'SK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SLOVENIA', 'SI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOLOMON ISLANDS', 'SB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOMALIA', 'SO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOUTH AFRICA', 'ZA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'GS', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SPAIN', 'ES', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SRI LANKA', 'LK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SUDAN', 'SD', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SURINAME', 'SR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SVALBARD AND JAN MAYEN', 'SJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SWAZILAND', 'SZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SWEDEN', 'SE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SWITZERLAND', 'CH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('SYRIAN ARAB REPUBLIC', 'SY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TAIWAN, PROVINCE OF CHINA', 'TW', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TAJIKISTAN', 'TJ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TANZANIA, UNITED REPUBLIC OF', 'TZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('THAILAND', 'TH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TIMOR-LESTE', 'TL', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TOGO', 'TG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TOKELAU', 'TK', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TONGA', 'TO', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TRINIDAD AND TOBAGO', 'TT', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TUNISIA', 'TN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TURKEY', 'TR', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TURKMENISTAN', 'TM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TURKS AND CAICOS ISLANDS', 'TC', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('TUVALU', 'TV', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UGANDA', 'UG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UKRAINE', 'UA', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED ARAB EMIRATES', 'AE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED KINGDOM', 'GB', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED STATES', 'US', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UNITED STATES MINOR OUTLYING ISLANDS', 'UM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('URUGUAY', 'UY', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('UZBEKISTAN', 'UZ', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VANUATU', 'VU', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VENEZUELA', 'VE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VIET NAM', 'VN', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VIRGIN ISLANDS, BRITISH', 'VG', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('VIRGIN ISLANDS, U.S.', 'VI', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('WALLIS AND FUTUNA', 'WF', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('WESTERN SAHARA', 'EH', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('YEMEN', 'YE', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ZAMBIA', 'ZM', 1)
INSERT INTO Country (CountryName, CountryCode, Active) VALUES ('ZIMBABWE', 'ZW', 1)


INSERT INTO State (StateName, StateCode, Active) VALUES ('Alabama', 'AL', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Alaska', 'AK', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('American Samoa', 'AS', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Arizona', 'AZ', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Arkansas', 'AR', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('California', 'CA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Colorado', 'CO', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Connecticut', 'CT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Delaware', 'DE', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('District of Columbia', 'DC', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Federated States of Micronesia', 'FM', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Florida', 'FL', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Georgia', 'GA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Guam', 'GU', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Hawaii', 'HI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Idaho', 'ID', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Illinois', 'IL', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Indiana', 'IN', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Iowa', 'IA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Kansas', 'KS', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Kentucky', 'KY', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Louisiana', 'LA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Maine', 'ME', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Marshall Islands', 'MH', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Maryland', 'MD', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Massachusetts', 'MA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Michigan', 'MI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Minnesota', 'MN', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Mississippi', 'MS', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Missouri', 'MO', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Montana', 'MT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Nebraska', 'NE', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Nevada', 'NV', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New Hampshire', 'NH', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New Jersey', 'NJ', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New Mexico', 'NM', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('New York', 'NY', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('North Carolina', 'NC', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('North Dakota', 'ND', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Northern Mariana Islands', 'MP', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Ohio', 'OH', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Oklahoma', 'OK', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Oregon', 'OR', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Palau', 'PW', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Pennsylvania', 'PA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Puerto Rico', 'PR', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Rhode Island', 'RI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('South Carolina', 'SC', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('South Dakota', 'SD', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Tennessee', 'TN', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Texas', 'TX', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Utah', 'UT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Vermont', 'VT', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Virgin Islands', 'VI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Virginia', 'VA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Washington', 'WA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('West Virginia', 'WV', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Wisconsin', 'WI', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Wyoming', 'WY', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Armed Forces Americas', 'AA', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Armed Forces', 'AE', 1)
INSERT INTO State (StateName, StateCode, Active) VALUES ('Armed Forces Pacific', 'AP', 1)

INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Alberta', 'AB', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('British Columbia', 'BC', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Manitoba', 'MB', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('New Brunswick', 'NB', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Newfoundland and Labrador', 'NL', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Northwest Territories', 'NT', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Nova Scotia', 'NS', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Nunavut', 'NU', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Ontario', 'ON', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Prince Edward Island', 'PE', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Quebec', 'QC', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Saskatchewan', 'SK', 1)
INSERT INTO Province (ProvinceName, ProvinceCode, Active) VALUES ('Yukon', 'YT', 1)

INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('Accepted', 1)
INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('Verifyed', 1)
INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('Shipped', 1)
INSERT INTO OrderStatus (OrderStatusName, Active) VALUES ('PaymentError', 1)

INSERT INTO CustomFieldType (CustomFieldTypeName, Active) VALUES ('TextBox', 1)
INSERT INTO CustomFieldType (CustomFieldTypeName, Active) VALUES ('CheckBox', 1)
