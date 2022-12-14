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
Сразу отметим, что в запросах по которым выдается слишком большая таблица данных мы ставили лимит 15, для того чтобы не занимать слишком много места. Ведь суть состоит в том, чтобы показать что запрос работает и 15 первых значений вполне достаточно. 
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

**6. Товары, которые не заказывали (первые 15 в алфавитном порядке).**
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

**7. Сумма доставок курьером и самовывозом.**
```sql
SELECT delivery_way, count(*) AS delivery_way_count  
FROM delivery  
GROUP BY delivery_way  
ORDER BY delivery_way_count DESC; 
``` 
 
| delivery_way | delivery_way_count |
|----------------|:---------:|
| courier      |                 34 |
| pickup       |                 33|


**8. Количество покупателей из разных городов.**
```sql
SELECT city, count(*) AS city_count  
FROM customers  
GROUP BY city  
ORDER BY city_count DESC; 
``` 
 
|       city       | city_count |
|----------------|:---------:|
| Anapa            |          8 |
| Vladimir         |          7 |
| Saratov          |          7 |
| Moscow           |          6 |
| Perm             |          6 |
| Yekaterinburg    |          6 |
| Penza            |          6 |
| Nizhny Novgorod  |          6 |
| Barnaul          |          5 |
| Saint-Petersburg |          5 |
| Krasnodar        |          3 |
| Kaliningrad      |          2 |

**9.Товары в алфавитном порядке и склады, где они находятся.**
```sql
SELECT products.product_name, warehouses.warehouse_name 
FROM products, warehouses 
WHERE products.warehouse_id = warehouses.id  
ORDER BY product_name ASC LIMIT 15; 
``` 
| product_name  | warehouse_name |
|----------------|:---------:|
| Alias         | Petrograd |
| Angel         | Petrograd |
| Backpack      | Ambar |
| Barbell       | Lavka |
| Bear_toy      | Petrograd |
| Bleach        | Klad |
| Blue_skirt    | Depo |
| Braclet       | Lavka |
| Brick         | Depo |
| Broom         | Depo |
| Brown_trouses | Ambar |
| Candles       | Zapas |
| Cettlebell    | Zapas |
| Chair         | Klad |
| Chess         | Petrograd|



**10. Производитель, страна и продукт в алфавитном порядке (по производителю).** 
```sql
SELECT producers.producer_name, producers.country, products.product_name 
FROM producers, products 
WHERE producers.id = products.producer_id  
ORDER BY producer_name ASC LIMIT 15; 
``` 
 
| producer_name   |  country  | product_name |
|----------------|:---------:|----------------:|
| Adidas           | Germany   | Backpack |
| Adidas           | Germany   | Blue_skirt |
| Adidas           | Germany   | Brown_trouses |
| AMAY             | Russia    | Coffe |
| Atlanta_jewelery | Russia    | Losion |
| Atlanta_jewelery | Russia    | Silver_ring |
| Atlanta_jewelery | Russia    | Mask |
| Atlanta_jewelery | Russia    | Consiler |
| Atlanta_jewelery | Russia    | Eyeshadows |
| Atlanta_jewelery | Russia    | Braclet |
| Atlanta_jewelery | Russia    | Diadema |
| BeFit            | Kazahstan | Skipping_rope |
| BeFit            | Kazahstan | Sport_ball |
| BeFit            | Kazahstan | Rope |
| BORK             | Russia    | Hairdryer |

**11. Товары в алфавитном порядке с лучшими оценками.** 
```sql
SELECT products.product_name, reviews.product_grade 
FROM products, reviews 
WHERE products.id = reviews.product_id AND reviews.product_grade = 5 
ORDER BY product_name ASC; 
```

|product_name  | product_grade |
|----------------|:---------:|
 |Braclet       |             5 |
 |Chocolate_bar |             5 |
 |Gummy_bear    |             5 |
 |Lego          |             5 |
 |Lego          |             5 |
 |Mask          |             5 |
 |PlayStation   |             5 |
 |Red_skirt     |             5 |
 |TV            |             5|
 
 
**12. Товары в алфавитном порядке с оценками.** 
```sql
SELECT products.product_name, reviews.product_grade 
FROM products, reviews 
WHERE products.id = reviews.product_id  
ORDER BY product_name ASC LIMIT 15; 
```
 
|  product_name  | product_grade |
|----------------|:---------:|
 |Braclet        |             5 |
 |Chess          |             4 |
 |Chocolate_bar  |             5 |
 |Christmas_tree |             4 |
 |Earings        |             4 |
 |Fondation      |             2 |
 |Gum            |             3 |
 |Gummy_bear     |             1 |
 |Gummy_bear     |             5 |
 |Lego           |             5 |
 |Lego           |             5 |
 |Mask           |             5 |
 |Monopoly       |             3 |
 |PlayStation    |             5 |
 |Purple_shoes   |             4 |

**13. Товар и дата его заказа, сортировка по дате.** 
```sql
SELECT products.product_name, purchases.date_of_purchase 
FROM products, purchases 
WHERE products.id = purchases.product_id  
ORDER BY date_of_purchase ASC LIMIT 25; 
``` 
 | product_name  | date_of_purchase |
|----------------|:---------:|
| Toaster        | 2022-12-01 |
 |Choco_pie      | 2022-12-01 |
| Marmalade      | 2022-12-01 |
| Gummy_bear     | 2022-12-01 |
| Angel          | 2022-12-01 |
| Chocolate_bar  | 2022-12-01 |
| Gum            | 2022-12-01 |
| Red_skirt      | 2022-12-02 |
| Red_skirt      | 2022-12-02 |
| Toaster        | 2022-12-02 |
| Alias          | 2022-12-02 |
| Brick          | 2022-12-02 |
| Chocolate_bar  | 2022-12-02 |
| Purple_shoes   | 2022-12-02 |
| Chess          | 2022-12-03 |
| Pedestal       | 2022-12-03 |
| Fondation      | 2022-12-03 |
| Gummy_bear     | 2022-12-03 |
| Lego           | 2022-12-03 |
| Teapot         | 2022-12-04 |
| Chocolate_bar  | 2022-12-04 |
| Teapot         | 2022-12-04 |
| Gummy_worms    | 2022-12-04 |
| Christmas_tree | 2022-12-04 |
| Chocolate_bar  | 2022-12-04|

**14. Данные по доставке на определенное число.** 
```sql
SELECT * FROM delivery  
WHERE delivery_term = '15/12/2022'; 
```
 
| id | order_id | delivery_term | delivery_way |      city       |  street   | house | flat |
|----------------|:---------:|----------------:|----------------|:---------:|----------------:|:---------:|----------------:|
| 49 |       49 | 2022-12-15    | courier      | Nizhny Novgorod | York Road |     2 |  167 |
| 50 |       50 | 2022-12-15    | courier      | Anapa           | The Green |    45 |   90 |
| 51 |       51 | 2022-12-15    | pickup       | Saratov         | The Grove |   175 |   47 |
| 52 |       52 | 2022-12-15    | courier      | Vladimir        | Main Road |     2 |   43|


**15. id клиента, его имя (логин), дату регистрации и дату покупки, отсортировано по имени (логину) клиента .**  
```sql
SELECT customers.client_id, clients.login, clients.reg_date, purchases.date_of_purchase 
FROM customers, clients,purchases 
WHERE customers.client_id = clients.id AND customers.id = purchases.customer_id 
ORDER BY clients.login ASC LIMIT 15;
```
|client_id  |  login   |  reg_date  | date_of_purchase |
|----------------|:---------:|----------------:|:---------:|
| 3473728578 | Alice    | 2022-11-09 | 2022-12-09 |
| 4316344455 | Ange     | 2022-06-05 | 2022-12-02 |
| 9298755783 | Arlena   | 2022-01-07 | 2022-12-01 |
| 9297237339 | Aubert   | 2022-03-04 | 2022-12-02 |
| 6689856828 | Binky    | 2022-08-08 | 2022-12-01 |
| 1602519722 | Blondell | 2022-04-03 | 2022-12-09 |
| 3636514407 | Brant    | 2021-01-12 | 2022-12-01 |
| 7291197937 | Chris    | 2021-01-12 | 2022-12-08 |
| 3726462430 | Chrissy  | 2022-04-02 | 2022-12-08 |
| 9118785476 | Clemens  | 2022-12-04 | 2022-12-06 |
| 6414008273 | Costanza | 2022-01-04 | 2022-12-04 |
| 6414008273 | Costanza | 2022-01-04 | 2022-12-04 |
|  797038086 | Cymbre   | 2022-04-07 | 2022-12-11 |
| 6546737698 | Dag      | 2022-01-04 | 2022-12-08 |
| 8709509488 | Dot      | 2022-02-03 | 2022-12-11|

**16. Выборка покупок в определенном отрезке времени и определеннои диапозоне цены.**  
```sql
SELECT customer_id, date_of_purchase, cost, order_id  
FROM purchases  
WHERE (date_of_purchase BETWEEN '5/12/2022' AND '10/12/2022') AND (cost BETWEEN 500 AND 1000); 
```

| customer_id | date_of_purchase | cost | order_id |
|----------------|:---------:|----------------:|:---------:|
|        2149 | 2022-12-05       |  780 |       24 |
|        1696 | 2022-12-05       |  549 |       27 |
|        2037 | 2022-12-06       |  856 |       36 |
|        2318 | 2022-12-06       |  716 |       37 |
|        2318 | 2022-12-07       |  515 |       37 |
|        3322 | 2022-12-07       |  980 |       39 |
|        3378 | 2022-12-07       |  980 |       40 |
|        2344 | 2022-12-07       |  549 |       42 |
|        3767 | 2022-12-10       |  716 |       52 |
|        2001 | 2022-12-10       |  600 |       53 |
|        2034 | 2022-12-10       |  600 |       54 |
|        2042 | 2022-12-10       |  500 |       55|
