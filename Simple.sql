## Tampilkan distinct customerName dari table customers
select distinct customerName 
	from customers;

## Gunakan fungsi concat untuk menggabungkan addressLine1 & addressLine2 dari table customers (saya tambahin ifnull soalnya jika tidak maka yang salah satunya null hasilnya null)
select concat(ifnull(addressLine1, ''),' ',ifnull(addressLine2, '')) as addressLine 
	from customers;

## Tampilkan avg, max, min creditLimit untuk masing-masing city dari table customers. Urutkan berdasarkan nilai avg dari besar ke kecil
select avg(creditLimit) as average, max(creditLimit) as maksimal, min(creditLimit) as minimal, city 
	from customers 
	group by city 
	order by average desc;

## Tampilkan jumlah orderNumber tiap customer. Urutkan berdasarkan jumlah orderNumber dari besar ke kecil
select customers.customerName, count(orders.orderNumber) as totalorder 
	from customers 
	inner join orders on customers.customerNumber = orders.customerNumber 
	group by customers.customerName 
	order by totalorder desc;

## Tampilkan total nominal pesanan (quantityOrdered x priceEach) per customer. Urutkan dari besar ke kecil
select customers.customerName, sum(orderdetails.quantityOrdered * orderdetails.priceEach) as totalnominal 
	from customers 
	inner join orders on customers.customerNumber = orders.customerNumber
	inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
	group by customers.customerName 
	order by totalnominal desc;
	