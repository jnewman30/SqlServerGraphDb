
CREATE TABLE HasOrderItem (
	[Id] INT IDENTITY PRIMARY KEY,
	[Quantity] DECIMAL(9,3) NOT NULL,
	[DateCreated] DateTime2 NOT NULL DEFAULT getdate()
) AS EDGE;
