use Northwind
--select * from dbo.Customers
exec sp_help customers
go 
create function getCustomerByCity(@ville nvarchar(30))
returns @CustomersCity table (cid nchar(10), cn nvarchar(30)) 

as
begin
insert into @CustomersCity select CustomerID, CompanyName from dbo.Customers where City=@ville 

	return 
end

select * from dbo.getCustomerByCity('London')
drop function dbo.getCustomerByCity



/* *************************************************** */

use Northwind
--select * from dbo.Customers
exec sp_help customers
go 
create function getProductMarge(@min money, @max money)
returns @ProductMarge table(pid int, pn nvarchar(80))
as
begin
insert into @ProductMarge select ProductID, ProductName from dbo.Products where @min < UnitPrice and UnitPrice > @max 
return
end

select * from dbo.getProductMarge(10,100)


/********************************************/
/* Procedure Stocke */

use Northwind
exec sp_help customers
go
create proc spAddClient @id nchar(10), @name nvarchar(80), @nameContact nvarchar(60), @title nvarchar(60), @adress nvarchar(120), @ville nvarchar(30),
@regionName nvarchar(30),  @codePostal nvarchar(20), @pays nvarchar(30), @tel nvarchar(48), @numFax nvarchar(48)
as
insert into Customers values (@id , @name, @nameContact, @title , @adress, @ville,
@regionName,  @codePostal, @pays, @tel, @numFax)


exec spAddClient '99999', 'aaa', 'ffff', 'fffff','rrrrrr','oooo','fpoeep','fpoif','fojfpo','foifo','foufep'

select * from Customers



--create proc getClientName @id int, @name char(30) OUTPUT
--as
--select @name=nomClient from Client where numClient=@id
--declare @x 