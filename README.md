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

```sql
SELECT code, model, color, type, price
FROM Printer
WHERE Color = 'y'
```
