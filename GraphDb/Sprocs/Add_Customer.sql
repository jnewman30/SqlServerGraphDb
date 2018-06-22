
CREATE PROCEDURE Add_Customer
	@AccountNumber NVARCHAR(100),
	@Name NVARCHAR(100),
	@CustomerStatusId INT
AS
BEGIN

	-- Add Customer Node

	INSERT INTO Customers ( [AccountNumber], [Name] )
	VALUES ( @AccountNumber, @Name )

	DECLARE @CustomerId INT = SCOPE_IDENTITY()
	
	-- Add Has Status Edge

	INSERT INTO HasStatus ( $from_id, $to_id )
	VALUES (
		( SELECT $node_id FROM Customers WHERE Id = @CustomerId ),
		( SELECT $node_id FROM CustomerStatuses WHERE Id = @CustomerStatusId )
	)

	-- Return Customer Id

	SELECT @CustomerId
END
