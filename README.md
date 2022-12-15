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
**1. Вывести количество заказов по городу Москва.**
```sql
SELECT client_id,email, num_of_orders 
FROM customers WHERE city = 'Moscow' 
ORDER BY num_of_orders DESC;
```


| lient_id | email | num_of_orders |
|----------------|:---------:|----------------:|
|  226986160 | mimimi@example.com         |            17 |
| 5980078452 | inga.kalinina@example.org  |            12 |
| 8709509488 | bonita@example.com         |            12 |
| 3654111661 | vorobev.taisia@example.com |            10 |
| 5076174497 | trofim92@example.org       |             9 |
| 8584009841 | nonna29@example.org        |             1 |


**1. Вывести количество товаров на конкретном складе.**
```sql
SELECT product_name, num_available, warehouse_id 
FROM products WHERE warehouse_id = 7654 
ORDER BY num_available DESC;
```
|product_name  | num_available | warehouse_id |
|----------------|:---------:|----------------:|
| Lego          |           115 |         7654 |
| Monopoly      |           112 |         7654 |
| Alias         |            65 |         7654 |
| Wallpaper     |            62 |         7654 |
| Bear_toy      |            59 |         7654 |
| Gummy_worms   |            57 |         7654 |
| Earings       |            54 |         7654 |
| Eyeshadows    |            54 |         7654 |
| Train         |            45 |         7654 |
| Doll          |            45 |         7654 |
| Red_skirt     |            37 |         7654 |
| Chocolate_bar |            34 |         7654 |
| Sport_ball    |            34 |         7654 |
| Chess         |            32 |         7654 |
| Desk          |            27 |         7654 |
| Coffe         |            19 |         7654 |
| Hairdryer     |            15 |         7654 |
| Faceclean     |            15 |         7654 |
| Motor_oil     |            15 |         7654 |
| Computer      |            15 |         7654 |
| Coffetable    |            12 |         7654 |
| Purple_shoes  |            10 |         7654 |
| Sofa          |             9 |         7654 |
| Red_pants     |             8 |         7654 |
| Toaster       |             7 |         7654 |
| Angel         |             5 |         7654 |
| Silver_ring   |             5 |         7654 |
| Deck_chair    |             4 |         7654 |
| Rope          |             4 |         7654 |
