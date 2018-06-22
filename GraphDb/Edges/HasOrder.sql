
CREATE TABLE HasOrder (
	[Id] INT IDENTITY PRIMARY KEY,
	[DateCreated] DateTime2 NOT NULL DEFAULT getdate()
) AS EDGE;
