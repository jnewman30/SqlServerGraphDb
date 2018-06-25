﻿
CREATE TABLE Customers (
	[Id] INT IDENTITY PRIMARY KEY,
	[AccountNumber] NVARCHAR(100) NOT NULL,
	[Name] NVARCHAR(100) NOT NULL,
	[DateCreated] DateTime2 NOT NULL DEFAULT getdate()
) AS NODE;

