
DROP TABLE IF EXISTS "baskets";
DROP SEQUENCE IF EXISTS baskets_id_seq;
CREATE SEQUENCE baskets_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."baskets" (
    "id" integer DEFAULT nextval('baskets_id_seq') NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "userId" integer,
    CONSTRAINT "baskets_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "baskets" ("id", "createdAt", "updatedAt", "userId") VALUES
(1,	'2021-10-21 12:52:18.477+00',	'2021-10-21 12:52:18.477+00',	1);

DROP TABLE IF EXISTS "baskets_has_orders";
DROP SEQUENCE IF EXISTS baskets_has_orders_id_seq;
CREATE SEQUENCE baskets_has_orders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."baskets_has_orders" (
    "id" integer DEFAULT nextval('baskets_has_orders_id_seq') NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "basketId" integer,
    "orderId" integer,
    CONSTRAINT "baskets_has_orders_basketId_orderId_key" UNIQUE ("basketId", "orderId"),
    CONSTRAINT "baskets_has_orders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "brands";
DROP SEQUENCE IF EXISTS brands_id_seq;
CREATE SEQUENCE brands_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."brands" (
    "id" integer DEFAULT nextval('brands_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "description_short" character varying(255),
    "description" character varying(255),
    "picture" character varying(255) DEFAULT 'no-image.png' NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "brands_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "brands_title_key" UNIQUE ("title")
) WITH (oids = false);


DROP TABLE IF EXISTS "characteristics";
DROP SEQUENCE IF EXISTS characteristics_id_seq;
CREATE SEQUENCE characteristics_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."characteristics" (
    "id" integer DEFAULT nextval('characteristics_id_seq') NOT NULL,
    "name" character varying(255),
    "value" character varying(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "characteristicsGroupId" integer,
    CONSTRAINT "characteristics_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "characteristics_groups";
DROP SEQUENCE IF EXISTS characteristics_groups_id_seq;
CREATE SEQUENCE characteristics_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."characteristics_groups" (
    "id" integer DEFAULT nextval('characteristics_groups_id_seq') NOT NULL,
    "title" character varying(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "characteristics_groups_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "currencies";
DROP SEQUENCE IF EXISTS currencies_id_seq;
CREATE SEQUENCE currencies_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."currencies" (
    "id" integer DEFAULT nextval('currencies_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "code" character varying(255) NOT NULL,
    "is_main" integer DEFAULT '0' NOT NULL,
    "rate" double precision DEFAULT '0' NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "currencies_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "deliveries";
DROP SEQUENCE IF EXISTS deliveries_id_seq;
CREATE SEQUENCE deliveries_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."deliveries" (
    "id" integer DEFAULT nextval('deliveries_id_seq') NOT NULL,
    "title" character varying(255),
    "info" text,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "deliveries_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "legal_forms";
DROP SEQUENCE IF EXISTS legal_forms_id_seq;
CREATE SEQUENCE legal_forms_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 2 CACHE 1;

CREATE TABLE "public"."legal_forms" (
    "id" integer DEFAULT nextval('legal_forms_id_seq') NOT NULL,
    "title" character varying(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "legal_forms_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "legal_forms" ("id", "title", "createdAt", "updatedAt") VALUES
(1,	'Юридическое лицо',	'2021-10-21 12:50:23.311+00',	'2021-10-21 12:50:23.311+00'),
(2,	'Физическое лицо',	'2021-10-21 12:50:40.969+00',	'2021-10-21 12:50:40.969+00');

DROP TABLE IF EXISTS "orders";
DROP SEQUENCE IF EXISTS orders_id_seq;
CREATE SEQUENCE orders_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."orders" (
    "id" integer DEFAULT nextval('orders_id_seq') NOT NULL,
    "count" integer DEFAULT '1' NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "deliveryId" integer,
    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_commentaries";
DROP SEQUENCE IF EXISTS product_commentaries_id_seq;
CREATE SEQUENCE product_commentaries_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."product_commentaries" (
    "id" integer DEFAULT nextval('product_commentaries_id_seq') NOT NULL,
    "review" text,
    "rating" integer DEFAULT '0' NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "productId" integer,
    "userId" integer,
    CONSTRAINT "product_commentaries_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_discounts";
DROP SEQUENCE IF EXISTS product_discounts_id_seq;
CREATE SEQUENCE product_discounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."product_discounts" (
    "id" integer DEFAULT nextval('product_discounts_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "value" double precision NOT NULL,
    "units" character varying(255) DEFAULT '%' NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "product_discounts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_nds";
DROP SEQUENCE IF EXISTS product_nds_id_seq;
CREATE SEQUENCE product_nds_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."product_nds" (
    "id" integer DEFAULT nextval('product_nds_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "stake" double precision NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "product_nds_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "product_pictures";
DROP SEQUENCE IF EXISTS product_pictures_id_seq;
CREATE SEQUENCE product_pictures_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."product_pictures" (
    "id" integer DEFAULT nextval('product_pictures_id_seq') NOT NULL,
    "filename" character varying(255) NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "productId" integer,
    CONSTRAINT "product_pictures_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "products";
DROP SEQUENCE IF EXISTS products_id_seq;
CREATE SEQUENCE products_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."products" (
    "id" integer DEFAULT nextval('products_id_seq') NOT NULL,
    "uuid" uuid NOT NULL,
    "title" character varying(255),
    "code" character varying(255),
    "picture" character varying(255),
    "short_description" text,
    "description" text,
    "price" double precision NOT NULL,
    "views" integer DEFAULT '0' NOT NULL,
    "novelty" integer DEFAULT '1' NOT NULL,
    "top_seller" integer DEFAULT '0' NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "productsCategoryId" integer,
    "brandId" integer,
    "productNdId" integer,
    "productDiscountId" integer,
    CONSTRAINT "products_code_key" UNIQUE ("code"),
    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "products_categories";
DROP SEQUENCE IF EXISTS products_categories_id_seq;
CREATE SEQUENCE products_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."products_categories" (
    "id" integer DEFAULT nextval('products_categories_id_seq') NOT NULL,
    "category_id" uuid NOT NULL,
    "title" character varying(255) NOT NULL,
    "picture" character varying(255) DEFAULT 'no-image.png' NOT NULL,
    "description_short" character varying(255),
    "description" character varying(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "brandId" integer,
    CONSTRAINT "products_categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "products_has_characteristics_groups";
DROP SEQUENCE IF EXISTS products_has_characteristics_groups_id_seq;
CREATE SEQUENCE products_has_characteristics_groups_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."products_has_characteristics_groups" (
    "id" integer DEFAULT nextval('products_has_characteristics_groups_id_seq') NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "productId" integer,
    "characteristicsGroupId" integer,
    CONSTRAINT "products_has_characteristics__productId_characteristicsGrou_key" UNIQUE ("productId", "characteristicsGroupId"),
    CONSTRAINT "products_has_characteristics_groups_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "roles";
DROP SEQUENCE IF EXISTS roles_id_seq;
CREATE SEQUENCE roles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."roles" (
    "id" integer DEFAULT nextval('roles_id_seq') NOT NULL,
    "code" character varying(255) NOT NULL,
    "description" character varying(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "roles_code_key" UNIQUE ("code"),
    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tokens";
DROP SEQUENCE IF EXISTS tokens_id_seq;
CREATE SEQUENCE tokens_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tokens" (
    "id" integer DEFAULT nextval('tokens_id_seq') NOT NULL,
    "refreshToken" text NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "userId" integer,
    CONSTRAINT "tokens_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "tokens_refreshToken_key" UNIQUE ("refreshToken")
) WITH (oids = false);

INSERT INTO "tokens" ("id", "refreshToken", "createdAt", "updatedAt", "userId") VALUES
(1,	'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXVpZCI6ImJkNDIzMWEzLWM4YTQtNDQ1NC1hNTMxLTkyZjQ2MTEyYjhjNCIsImVtYWxpIjoidGFyQGdtYWlsLmNvbSIsInVzZXJuYW1lIjoieWFyIiwiYXZhdGFyIjoiOGMzMjFjNTAtOTYyNi00NWRkLWI2YTAtMDFiYTQyYTIzMmMxLmpwZWciLCJsZWdhbEZvcm1JZCI6MSwiaWF0IjoxNjM0ODIwNzM4LCJleHAiOjE2MzY5ODA3Mzh9.zhKqZWGuy61-xPYNHaTjwmupnfIG2GvMlTgPhMxc4ws',	'2021-10-21 12:52:18.483+00',	'2021-10-21 12:52:18.483+00',	1);

DROP TABLE IF EXISTS "user_discounts";
DROP SEQUENCE IF EXISTS user_discounts_id_seq;
CREATE SEQUENCE user_discounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 3 CACHE 1;

CREATE TABLE "public"."user_discounts" (
    "id" integer DEFAULT nextval('user_discounts_id_seq') NOT NULL,
    "title" character varying(255) NOT NULL,
    "value" double precision NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    CONSTRAINT "user_discounts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "user_discounts" ("id", "title", "value", "createdAt", "updatedAt") VALUES
(1,	'Beginner',	0,	'2021-10-21 12:51:08.114+00',	'2021-10-21 12:51:08.114+00'),
(2,	'Medium',	10,	'2021-10-21 12:51:27.423+00',	'2021-10-21 12:51:27.423+00'),
(3,	'Advanced',	25,	'2021-10-21 12:51:42.136+00',	'2021-10-21 12:51:42.136+00');

DROP TABLE IF EXISTS "users";
DROP SEQUENCE IF EXISTS users_id_seq;
CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."users" (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "uuid" uuid NOT NULL,
    "email" character varying(255),
    "avatar" character varying(255),
    "username" character varying(255),
    "first_name" character varying(255),
    "last_name" character varying(255),
    "company_name" character varying(255),
    "status" integer,
    "phone_number" character varying(255),
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "userDiscountId" integer,
    "legalFormId" integer,
    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "users" ("id", "uuid", "email", "avatar", "username", "first_name", "last_name", "company_name", "status", "phone_number", "createdAt", "updatedAt", "userDiscountId", "legalFormId") VALUES
(1,	'bd4231a3-c8a4-4454-a531-92f46112b8c4',	'tar@gmail.com',	'8c321c50-9626-45dd-b6a0-01ba42a232c1.jpeg',	'yar',	'Yaroslav',	'Taranenko',	'nmotors.kz',	NULL,	'+77768281034',	'2021-10-21 12:52:18.473+00',	'2021-10-21 12:52:18.473+00',	1,	1);

DROP TABLE IF EXISTS "users_has_roles";
DROP SEQUENCE IF EXISTS users_has_roles_id_seq;
CREATE SEQUENCE users_has_roles_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."users_has_roles" (
    "id" integer DEFAULT nextval('users_has_roles_id_seq') NOT NULL,
    "createdAt" timestamptz NOT NULL,
    "updatedAt" timestamptz NOT NULL,
    "userId" integer,
    "roleId" integer,
    CONSTRAINT "users_has_roles_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "users_has_roles_userId_roleId_key" UNIQUE ("userId", "roleId")
) WITH (oids = false);


ALTER TABLE ONLY "public"."baskets" ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."baskets_has_orders" ADD CONSTRAINT "baskets_has_orders_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES baskets(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."baskets_has_orders" ADD CONSTRAINT "baskets_has_orders_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES orders(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."characteristics" ADD CONSTRAINT "characteristics_characteristicsGroupId_fkey" FOREIGN KEY ("characteristicsGroupId") REFERENCES characteristics_groups(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."orders" ADD CONSTRAINT "orders_deliveryId_fkey" FOREIGN KEY ("deliveryId") REFERENCES deliveries(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_commentaries" ADD CONSTRAINT "product_commentaries_productId_fkey" FOREIGN KEY ("productId") REFERENCES products(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."product_commentaries" ADD CONSTRAINT "product_commentaries_userId_fkey" FOREIGN KEY ("userId") REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."product_pictures" ADD CONSTRAINT "product_pictures_productId_fkey" FOREIGN KEY ("productId") REFERENCES products(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."products" ADD CONSTRAINT "products_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES brands(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."products" ADD CONSTRAINT "products_productDiscountId_fkey" FOREIGN KEY ("productDiscountId") REFERENCES product_discounts(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."products" ADD CONSTRAINT "products_productNdId_fkey" FOREIGN KEY ("productNdId") REFERENCES product_nds(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."products" ADD CONSTRAINT "products_productsCategoryId_fkey" FOREIGN KEY ("productsCategoryId") REFERENCES products_categories(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."products_categories" ADD CONSTRAINT "products_categories_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES brands(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."products_has_characteristics_groups" ADD CONSTRAINT "products_has_characteristics_groups_characteristicsGroupId_fkey" FOREIGN KEY ("characteristicsGroupId") REFERENCES characteristics_groups(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."products_has_characteristics_groups" ADD CONSTRAINT "products_has_characteristics_groups_productId_fkey" FOREIGN KEY ("productId") REFERENCES products(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tokens" ADD CONSTRAINT "tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."users" ADD CONSTRAINT "users_legalFormId_fkey" FOREIGN KEY ("legalFormId") REFERENCES legal_forms(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;
ALTER TABLE ONLY "public"."users" ADD CONSTRAINT "users_userDiscountId_fkey" FOREIGN KEY ("userDiscountId") REFERENCES user_discounts(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE;

ALTER TABLE ONLY "public"."users_has_roles" ADD CONSTRAINT "users_has_roles_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES roles(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;
ALTER TABLE ONLY "public"."users_has_roles" ADD CONSTRAINT "users_has_roles_userId_fkey" FOREIGN KEY ("userId") REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT DEFERRABLE;

-- 2021-10-31 06:53:38.417642+00