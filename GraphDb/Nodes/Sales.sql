
CREATE TABLE Sales (
	[Id] INT IDENTITY PRIMARY KEY,
	[DateCompleted] DateTime2 NOT NULL DEFAULT getdate(),
	[Notes] NVARCHAR(2000)
) AS NODE;
