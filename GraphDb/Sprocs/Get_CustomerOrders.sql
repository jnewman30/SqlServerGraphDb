
CREATE PROCEDURE Get_CustomerOrders
	@CustomerId INT
AS
BEGIN

	SELECT	customer.Id as 'CustomerId'
			, customer.[Name] as 'CustomerName'
			, orders.Id as 'OrderId'
			, orders.Number as 'OrderNumber'
			, orders.OrderDate
			, hasItem.Quantity as 'ItemQuantity'
			, hasItem.DateCreated as 'ItemDate'
			, product.Id as 'ProductId'
			, product.Code as 'ProductCode'
			, product.[Name] as 'Product'

		FROM	Customers customer
				, HasOrder hasOrder
				, Orders orders
				, HasOrderItem hasItem
				, Products product

		WHERE customer.Id = @CustomerId
			AND MATCH(customer-(hasOrder)->orders-(hasItem)->product)
		
END

