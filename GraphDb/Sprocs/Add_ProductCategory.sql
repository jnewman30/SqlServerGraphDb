
CREATE PROCEDURE Add_ProductCategory
	@ProductId INT,
	@ProductCategoryId INT
AS
BEGIN

	INSERT INTO HasCategory ( $from_id, $to_id )
	VALUES (
		( SELECT $node_id FROM Products WHERE Id = @ProductId ),
		( SELECT $node_id FROM ProductCategories WHERE Id = @ProductCategoryId )
	)

END
