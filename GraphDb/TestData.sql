
USE [GraphDb]
GO

INSERT INTO CustomerStatuses ( [Name] ) VALUES ( 'Customer' )
INSERT INTO CustomerStatuses ( [Name] ) VALUES ( 'Lead' )
INSERT INTO CustomerStatuses ( [Name] ) VALUES ( 'Follow Up' )
INSERT INTO CustomerStatuses ( [Name] ) VALUES ( 'Prospect' )
INSERT INTO CustomerStatuses ( [Name] ) VALUES ( 'Blocked' )
INSERT INTO CustomerStatuses ( [Name] ) VALUES ( 'Flagged' )

INSERT INTO OrderStatuses ( [Name] ) VALUES ( 'New' )
INSERT INTO OrderStatuses ( [Name] ) VALUES ( 'Pending Payment' )
INSERT INTO OrderStatuses ( [Name] ) VALUES ( 'Processing' )
INSERT INTO OrderStatuses ( [Name] ) VALUES ( 'Completed' )
INSERT INTO OrderStatuses ( [Name] ) VALUES ( 'On Hold' )

INSERT INTO ProductCategories ( [Name] ) VALUES ( 'Cloths' )
INSERT INTO ProductCategories ( [Name] ) VALUES ( 'Work Cloths' )
INSERT INTO ProductCategories ( [Name] ) VALUES ( 'Mens Cloths' )
INSERT INTO ProductCategories ( [Name] ) VALUES ( 'Womens Cloths' )
