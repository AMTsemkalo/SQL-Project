# SQL-Project
# Итоговый проект: Интернет магазин (Ozon) 
<br/> ddl.sql - файл со структурой бд
<br/> data.sql - файл с заполнением бд
# База данных
![drawSQL-export-2022-12-20_09_15](https://user-images.githubusercontent.com/114655283/208596862-4f8ee5aa-c53d-44a7-996a-8eb9ca2ba3d4.png)

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


**2. Вывести количество товаров на конкретном складе.**
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

**3. Топ самых популярных товаров среди покупателей.**
```sql
SELECT product_id, count(product_id) 
FROM purchases oc 
GROUP BY product_id 
ORDER BY count(product_id) DESC LIMIT 10;
```
|product_id | count 
|----------------|:---------:|
|        111 |     9 |
|        125 |     4 |
|        115 |     4 |
|        114 |     4 |
|        113 |     4 |
|        117 |     3 |
|        146 |     3 |
|        124 |     3 |
|        152 |     2 |
|        188 |     2 |
...

**4. Топ 5 складов по количеству товаров .**
```sql
SELECT warehouse_name, sum(num_available) 
FROM products 
LEFT JOIN warehouses on warehouses.id = products.warehouse_id  
GROUP BY warehouse_name 
ORDER BY sum DESC LIMIT 5;       
``` 
| warehouse_name | sum 
|----------------|:---------:|
|       Petrograd  | 975 |
|       Depo  | 702 |
|       Klad  | 466 |
|       Zapas | 406 |
|       Lavka | 373 |

**5. Запрос id первых 15 зарегистрировавшихся, которые ничего не купили.** 
```sql
SELECT clients.id 
FROM clients AS clients 
LEFT JOIN customers ON customers.client_id = clients.id 
WHERE customers.client_id IS NULL 
GROUP BY clients.id LIMIT 15; 
```
|     id |
|----------------|
|9189815114 |
| 5214359438 |
|  540622141 |
| 5340604284 |
|  274466945 |
| 3968056159 |
| 6584388425 |
| 7679617074 |
| 4839181594 |
| 6272710070 |
| 1681615436 |
| 9552719135 |
| 4622116979 |
| 2662122838 |
| 6182643242|

**6. товары, которые не заказывали (первые 15 в алфавитном порядке).**
```sql
SELECT products.product_name 
FROM products AS products 
LEFT JOIN purchases ON purchases.product_id = products.id 
WHERE purchases.product_id IS NULL 
GROUP BY products.id 
ORDER BY product_name ASC LIMIT 15; 
```

| product_name |
|----------------|
| Backpack |
| Broom |
| Cettlebell |
| Chair |
| Coffe |
| Compas |
| Computer |
| Consiler |
| Deodorizer| 
| Desk |
| Diadema| 
| Doll |
| Eyeliner |
| Eyeshadows| 
| Faceclean|
