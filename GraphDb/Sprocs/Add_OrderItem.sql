
CREATE PROCEDURE Add_OrderItem
	@OrderId INT,
	@ProductId INT,
	@Quantity DECIMAL(9,3)
AS
BEGIN

	-- Add Has Order Item Edge

	INSERT INTO HasOrderItem ( $from_id, $to_id, Quantity )
	VALUES (
		( SELECT $node_id FROM Orders WHERE Id = @OrderId ),
		( SELECT $node_id FROM Products WHERE Id = @ProductId ),
		@Quantity
	)

END
