# SQL-Project
# Итоговый проект: Интернет магазин (Ozon) 
<br/> ddl.sql - файл со структурой бд
<br/> data.sql - файл с заполнением бд
# База данных
![drawSQL-export-2022-12-15_07_58](https://user-images.githubusercontent.com/114655283/207776379-3e7095ab-69a3-4261-97c2-4349dd190838.png)

# Разъяснения названий
clients - клиенты, зарегисрированные в интернет магазине пользователи.
<br/> customers - покупатели, часть зарегистрированных в интернет магазине пользователей, которые дошли до стадии покупки товара. 
<br/> product_categories - категории товаров. 
<br/> producers - производители товаров.
<br/> warehouses - склады хранения товаров. 
<br/> products - товары. 
<br/> reviews - отзывы покупателей на товары.
<br/> orders - заказы.
<br/> purchases - покупки. 
<br/> delivery - доставка. 

# Запросы
1. Вывести количество заказов по городу Москва.
```sql
SELECT client_id,email, num_of_orders 
FROM customers WHERE city = 'Moscow' 
ORDER BY num_of_orders DESC;
```

|lient_id  |           email            | num_of_orders |
|------------+----------------------------+---------------|
|  226986160 | mimimi@example.com         |            17 |
| 5980078452 | inga.kalinina@example.org  |            12 |
| 8709509488 | bonita@example.com         |            12 |
| 3654111661 | vorobev.taisia@example.com |            10 |
| 5076174497 | trofim92@example.org       |             9 |
| 8584009841 | nonna29@example.org        |             1 |
(6 строк)

