﻿
CREATE TABLE ProductCategories (
	[Id] INT IDENTITY PRIMARY KEY,
	[Name] NVARCHAR(100) NOT NULL,
	[DateCreated] DateTime2 NOT NULL DEFAULT getdate(),
	[IsActive] BIT NOT NULL DEFAULT 1
) AS NODE;
