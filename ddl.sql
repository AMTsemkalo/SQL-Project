CREATE TABLE "clients"(
    "id" BIGSERIAL PRIMARY KEY,
    "login" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "discount_points" INTEGER NOT NULL,
    "telephone" BIGINT NOT NULL,
    "reg_date" DATE NOT NULL
);

CREATE TABLE "customers"(
    "id" BIGSERIAL PRIMARY KEY,
    "client_id" BIGINT REFERENCES clients (id),
    "city" VARCHAR(255) NOT NULL,
    "num_of_orders" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL
);

CREATE TABLE "product_categories"(
    "id" BIGSERIAL PRIMARY KEY,
    "category_description" TEXT NOT NULL,
    "num_of_positions" INTEGER NOT NULL
);

CREATE TABLE "producers"(
    "id" BIGSERIAL PRIMARY KEY,
    "producer_name" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL
);

CREATE TABLE "warehouses"(
    "id" BIGSERIAL PRIMARY KEY,
    "warehouse_name" VARCHAR(255) NOT NULL,
    "warehouse_place" VARCHAR(255) NOT NULL
);

CREATE TABLE "products"(
    "id" BIGSERIAL PRIMARY KEY,
    "product_name" VARCHAR(255) NOT NULL,
    "product_category_id" BIGINT REFERENCES product_categories (id),
    "product_cost" INTEGER NOT NULL,
    "num_available" INTEGER NOT NULL,
    "producer_id" BIGINT REFERENCES producers (id),
    "warehouse_id" BIGINT REFERENCES warehouses (id)
);

CREATE TABLE "reviews"(
    "id" BIGSERIAL PRIMARY KEY,
    "customer_id" BIGINT REFERENCES customers (id),
    "review_text" TEXT NOT NULL,
    "product_grade" INTEGER NOT NULL,
    "product_id" BIGINT REFERENCES products (id)
);

CREATE TABLE "orders"(
    "id" BIGSERIAL PRIMARY KEY,
    "customer_id" BIGINT REFERENCES customers (id),
    "num_of_products" INTEGER NOT NULL
);

CREATE TABLE "purchases"(
    "id" BIGSERIAL PRIMARY KEY,
    "customer_id" BIGINT REFERENCES customers (id),
    "product_id" BIGINT REFERENCES products (id),
    "date_of_purchase" DATE NOT NULL,
    "cost" INTEGER NOT NULL,
    "order_id" BIGINT REFERENCES orders (id)
);

CREATE TABLE "delivery"(
    "id" BIGSERIAL PRIMARY KEY,
    "order_id" BIGINT REFERENCES orders (id),
    "delivery_term" DATE NOT NULL,
    "delivery_way" VARCHAR(255) NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "street" VARCHAR(255) NOT NULL,
    "house" INTEGER NOT NULL,
    "flat" INTEGER NOT NULL
);



