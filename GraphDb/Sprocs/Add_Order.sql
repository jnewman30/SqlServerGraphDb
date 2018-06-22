
CREATE PROCEDURE Add_Order
	@CustomerId INT,
	@Number NVARCHAR(100),
	@OrderDate DateTime2,
	@OrderStatusId INT
AS
BEGIN

	-- Add Order Node

	INSERT INTO Orders ( [Number], [OrderDate] )
	VALUES ( @Number, @OrderDate )

	DECLARE @OrderId INT = SCOPE_IDENTITY()

	-- Add Has Order Edge

	INSERT INTO HasOrder ( $from_id, $to_id )
	VALUES (
		( SELECT $node_id FROM Customers WHERE Id = @CustomerId ),
		( SELECT $node_id FROM Orders WHERE Id = @OrderId )
	)

	-- Add Has Status Edge

	INSERT INTO HasStatus ( $from_id, $to_id )
	VALUES (
		( SELECT $node_id FROM Orders WHERE Id = @OrderId ),
		( SELECT $node_id FROM OrderStatuses WHERE Id = @OrderStatusId )
	)

	-- Return Order Id

	SELECT @OrderId
END
