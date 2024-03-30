use Northwind
select * from dbo.Customers

--Question 1
Create Function DayConverter(@DayToInt int)
returns varchar(20)
As
Begin
	declare @day varchar(20)
	Declare @conversion table(i Int, jour Varchar(30))   
	Insert @conversion values(1, 'Monday')  
	Insert @conversion values(2, 'Tuesday')  
	Insert @conversion values(3, 'Wednesday')  
	Insert @conversion values(4, 'Thursday') 
	Insert @conversion values(5, 'Friday')  
	Insert @conversion values(6, 'Saturday')  
	Insert @conversion values(7, 'Sunday')   
	
	Select @day = jour  From @conversion Where i = @DayToInt  
	return @day 
End

select dbo.DayConverter(5)

--Question 2
Drop Function dateDifference;
create function dateDifference(@date1 datetime, @date2 datetime)
returns int
as 
begin
 declare @numberOFDays int
  select @numberOFDays = DATEDIFF(day,@date1,@date2)+ (30 *  DATEDIFF(month,@date1,@date2)) + (365 * DATEDIFF(year,@date1,@date2))
 return (@numberOFDays)
end

select dbo.dateDifference('20200101','20220101') as differenceDate
/*select dbo.dateDifference(01-02-2022,28-02-2022)
SELECT DATEDIFF(day,'20220102','20220202') As diff
datediff(month,01022022,28022022) 
datediff(year,01-02-2022,28-02-2022)*/

--Question 3

use Northwind
--select * from dbo.Customers
exec sp_help Products
go 
create function getProductName(@idProduct int)
returns @productNameResult table(pid int, pn nvarchar(80))
as
begin
insert into @productNameResult  select ProductID, ProductName from dbo.Products where @idProduct=ProductID
return 
end

select * from dbo.getProductName(10)

--Question 4

--Question 5

create function getTTC()
returns @resultat table(pid int, pttc money)
as
begin
insert into @resultat select ProductId, UnitPrice*(1.2) from dbo.Products 
return
end

select * from dbo.getTTC()