
CREATE TABLE HasStatus (
	[Id] INT IDENTITY PRIMARY KEY,
	[DateCreated] DateTime2 NOT NULL DEFAULT getdate()
) AS EDGE;
