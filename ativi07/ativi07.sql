-- 63
CREATE VIEW EmployeesOrderDetailsProducts AS Select

o.orderId, o.orderDate, e.firstName -- , d.productId, d.quantity, p.price

, SUM(d.quantity * p.price) as Total

FROM

Orders o

Inner Join Employees e ON (e.employeeId = o.employeeId)

Inner Join OrderDetails d ON (d.orderId = o.orderId)

Inner Join Products p ON (p.productId = d.productId)

GROUP BY o.orderId, o.orderDate, e.firstName

ORDER BY Total DESC;


SELECT * FROM EmployeesOrderDetailsProducts;


-- 64
CREATE VIEW EmployeesOrderDetailsProductsTotalProduto AS 
SELECT

o.OrderID, o.OrderDate, e.FirstName

,p.ProductName, c.CategoryName, d.Quantity , p.Price

,d.Quantity * p.Price As 'Total Produto'

FROM

Orders o

Inner JOIN Employees e On (e.EmployeeID = o.EmployeeID)

Inner JOIN OrderDetails d On (d.orderid = o.orderid)

Inner JOIN Products p ON (p.ProductID = d.ProductID )

Inner JOIN Categories c ON (c.CategoryID = p.CategoryID);

SELECT * FROM EmployeesOrderDetailsProductsTotalProduto;


-- 65
CREATE VIEW TotalVendasMediaVendas AS 
SELECT

c.customername,

SUM(d.Quantity * p.Price) as 'Total de Vendas',

AVG(d.Quantity * p.Price) as 'Média de Vendas'

FROM

Orders o

INNER JOIN OrderDetails d ON (d.OrderID= o.OrderID)

INNER JOIN Customers c ON (c.CustomerID = o.CustomerID )

INNER JOIN Products p ON (p.ProductID = d.ProductID)

GROUP BY c.customername

ORDER BY 3 DESC;

SELECT * FROM TotalVendasMediaVendas;


-- 66
CREATE VIEW TotalVendasMediaVendascategoryname AS 
SELECT

c.categoryname,

SUM(d.Quantity * p.Price) as 'Total de Vendas',

AVG(d.Quantity * p.Price) as 'Média de Vendas'

FROM

OrderDetails d 

INNER JOIN Products p ON (p.ProductID = d.ProductID)

INNER JOIN Categories c ON (c.categoryid = p.categoryid )

GROUP BY c.categoryname

ORDER BY 3 DESC;
SELECT * FROM TotalVendasMediaVendascategoryname;


-- 67
CREATE VIEW EmpregadoTotalVendasMediaVendas AS 
SELECT

  e.LastName+', '+e.FirstName as 'Empregado',

SUM(d.Quantity * p.Price) as 'Total de Vendas',

AVG(d.Quantity * p.Price) as 'Média de Vendas'

FROM

Orders o

INNER JOIN OrderDetails d ON (d.OrderID= o.OrderID)

INNER JOIN Employees e ON (e.employeeid = o.employeeid )

INNER JOIN Products p ON (p.ProductID = d.ProductID)

GROUP BY e.LastName+', '+e.FirstName

ORDER BY 3 DESC;
SELECT * FROM EmpregadoTotalVendasMediaVendas;


-- 68
CREATE VIEW ShipperNameTotalVendasMediaVendas AS 
SELECT

  s.ShipperName,

SUM(d.Quantity * p.Price) as 'Total de Vendas',

AVG(d.Quantity * p.Price) as 'Média de Vendas'

FROM

Orders o

INNER JOIN OrderDetails d ON (d.OrderID= o.OrderID)

INNER JOIN Shippers s ON (s.ShipperID= o.ShipperID)

INNER JOIN Products p ON (p.ProductID = d.ProductID)

GROUP BY s.ShipperName

ORDER BY 3 DESC;
SELECT * FROM ShipperNameTotalVendasMediaVendas;


-- 69
CREATE VIEW ProductNameTotalVendasMediaVendas AS 
SELECT

p.productname,

SUM(d.Quantity * p.Price) as 'Total de Vendas',

AVG(d.Quantity * p.Price) as 'Média de Vendas'

FROM

OrderDetails d 

INNER JOIN Products p ON (p.ProductID = d.ProductID)

GROUP BY p.productname

ORDER BY 3 DESC;
SELECT * FROM ProductNameTotalVendasMediaVendas;



-- 70
CREATE VIEW ShipperNameProductNameTotalVendas AS 
SELECT

  s.ShipperName,

  p.ProductName,

  SUM(d.Quantity * p.Price) as 'Total de Vendas'

FROM

Orders o

INNER JOIN OrderDetails d ON (d.OrderID= o.OrderID)

INNER JOIN Shippers s ON (s.ShipperID= o.ShipperID)

INNER JOIN Products p ON (p.ProductID = d.ProductID)

GROUP BY s.ShipperName, p.ProductName

ORDER BY 'Total de Vendas' DESC;
SELECT * FROM ShipperNameProductNameTotalVendas;


-- 71
CREATE VIEW AnoMesMediaVendas AS 
SELECT

   YEAR(o.OrderDate) AS 'Ano',

   MONTH(o.OrderDate) AS 'Mês',

   AVG(d.Quantity * p.Price) as 'Média de Vendas'

FROM

Orders o

INNER JOIN OrderDetails d ON (d.OrderID= o.OrderID)

INNER JOIN Products p ON (p.ProductID = d.ProductID)

GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate)

ORDER BY 'Ano' DESC,'Mês' DESC;
SELECT * FROM AnoMesMediaVendas;



-- 72
CREATE VIEW DiaAnoDiaAnoAtualDiaSemanaDia AS 
select 

  DATEPART(mm,OrderDate),Month(Orderdate) as mes 

,DATEPART(dy,OrderDate) as 'dia do ano'

,DATEPART(dy,GetDate()) as 'dia do ano atual'

,DATEPART(dw,GetDate()) as 'dia da semana'

,DATEPART(day,GetDate()) as 'dia'

from Orders;
SELECT * FROM DiaAnoDiaAnoAtualDiaSemanaDia;