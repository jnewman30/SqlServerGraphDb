
CREATE PROCEDURE Set_CustomerStatus
	@CustomerId INT,
	@CustomerStatusId INT
AS
BEGIN

	INSERT INTO HasStatus ( $from_id, $to_id )
	VALUES (
		( SELECT $node_id FROM Customers WHERE Id = @CustomerId ),
		( SELECT $node_id FROM CustomerStatuses WHERE Id = @CustomerStatusId )
	)

END
