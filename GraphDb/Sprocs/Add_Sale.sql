
CREATE PROCEDURE Add_Sale
	@OrderId INT,
	@DateCompleted DateTime2,
	@Notes NVARCHAR(2000) NULL
AS
BEGIN

	-- Add Sale Node

	INSERT INTO Sales ( [DateCompleted], [Notes] )
	VALUES ( @DateCompleted, @Notes )

	DECLARE @SaleId INT = SCOPE_IDENTITY()

	-- Add Has Sale Edge

	INSERT INTO HasSale ( $from_id, $to_id )
	VALUES (
		( SELECT $node_id FROM Orders WHERE Id = @OrderId ),
		( SELECT $node_id FROM Sales WHERE Id = @SaleId )
	)

	-- Return Sale Id

	SELECT @SaleId
END
