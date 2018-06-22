
CREATE PROCEDURE Add_Product
	@Code NVARCHAR(100),
	@Name NVARCHAR(100),
	@ProductCategoryId INT NULL
AS
BEGIN

	-- Add Product Node

	INSERT INTO Products ( [Code], [Name] )
	VALUES ( @Code, @Name )

	DECLARE @ProductId INT = SCOPE_IDENTITY()
	
	-- Add Product Category

	IF ( @ProductCategoryId IS NOT NULL )
	BEGIN
		EXEC Add_ProductCategory @ProductId, @ProductCategoryId
	END

	-- Return Product Id

	SELECT @ProductId
END
