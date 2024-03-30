/* Author : BENHAKKI Othmane */
/* TP5 */

--Question 1--

create procedure getFiveMostExpensiveProducts AS
SET ROWCOUNT 5
SELECT Products.ProductName AS getFiveMostExpensiveProducts, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC

--Question 2--

exec getFiveMostExpensiveProducts


--Question 3--

create procedure getTenProductsExpensive AS
SET ROWCOUNT 10
SELECT Products.ProductName AS getTenProductsExpensive, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC


exec getTenProductsExpensive

--Question 4 et 5--
create procedure getExpensiveProducts @numberOfProducts int AS
SET ROWCOUNT @numberOfProducts

if (@numberOfProducts > 0 )	
	begin
	SELECT Products.ProductName AS getExpensiveProducts, Products.UnitPrice
	FROM Products
	ORDER BY Products.UnitPrice DESC
	end

else
	begin
	exec getFiveMostExpensiveProducts
	end


exec getExpensiveProducts 44

--Question 6--
--Fait il faut seulement ouvrir la propriété depuis object explorer puis votre proc et puis click droit propriete

--Question 7--

select * from dbo.Orders


create proc getVenteEffectuerParDate @date1 datetime, @date2 datetime
as
--if(DATEDIFF(day,@date1,@date2)>0)    --Example : 1996-07-11 00:00:00.000 
if(@date1>0 and @date2>0)
	begin
		select OrderId, CustomerID, ShippedDate from dbo.Orders where ShippedDate between @date1 and @date2
	end

else 
	begin 
	return null
	end

exec getVenteEffectuerParDate '1996-07-11 00:00:00.000 ', '1996-07-28 00:00:00.000'


--Question 8--

select * from dbo.Products

create procedure getProductNameByIDOutputVariable (@idProductInput int)
AS
DECLARE @ProductNameOutput nvarchar(40)
SELECT Products.ProductName FROM Products WHERE ProductID=@idProductInput
RETURN @ProductNameOutput

exec getProductNameByIDOutputVariable 3
exec getProductNameByIDOutputVariable 5


--Question 9--
--Recompile Option is defined
--Dropped all proc's with : DROP PROCEDURE dbo.getProductNameByIDOutputVariable;
--Created by adding WITH RECOMPILE  under create procedure and before as

DROP PROCEDURE dbo.getProductNameByIDOutputVariable;

create procedure getProductNameByIDOutputVariable (@idProductInput int)
WITH RECOMPILE
AS
DECLARE @ProductNameOutput nvarchar(40)
SELECT Products.ProductName FROM Products WHERE ProductID=@idProductInput
RETURN @ProductNameOutput

exec getProductNameByIDOutputVariable 5 WITH RECOMPILE

--Question 10--
--RECOMPILE – specifies that after the query is executed, its query execution plan stored in cache is removed from cache. 
--When the same query is executed again, there will be no existing plan in cache, so the query will have to be recompiled.

--MSDN documentation says SP_Recompile “Causes stored procedures and triggers to be recompiled the next time that they are run.
--It does this by dropping the existing plan from the procedure cache forcing a new plan to be created the next time that the 


--Question 11 et 12--
--Proc créer par l'assistants 
select * from dbo.Employees

--Exercice 2--
--Question 1--
SELECT * FROM Customers

create procedure spAddCustomer (@CustomerID int, @CompanyName nvarchar(40), @ContactName nvarchar(30), @ContactTitle nvarchar(30), @Adress nvarchar(60)
								, @City nvarchar(15), @Region nvarchar(15), @PostalCode nvarchar(10), @Country nvarchar(15), @Phone nvarchar(24), @Fax nvarchar(24))
WITH RECOMPILE
AS
Insert Into dbo.Customers 
								VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Adress 
								, @City, @Region, @PostalCode, @Country, @Phone, @Fax)
select * from dbo.Customers

exec dbo.spAddCustomer 9898,'Pegasus','PegaAdmin', 'PegaInfo', 'California Long Beach 78 Av', 'San Diego', 'Long Beach', '92128', 'United States Of America', '(1)594-619461','Pegasus-Fax-Int' WITH RECOMPILE


create procedure orderCount (@CustomerID int)
WITH RECOMPILE
AS
DECLARE @ordersTable table(OrderIDT int, OrderDateT datetime, RequiredDateT datetime, ShippedDateT datetime)  
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID


--L'interet de @@error  est d'afficher le dernier erreur rencontrée --
