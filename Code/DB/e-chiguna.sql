CREATE TABLE "User" (
  "username" varchar PRIMARY KEY,
  "password" varchar,
  "email" varchar,
  "is_manager" bit DEFAULT 0,
  "score" integer DEFAULT 0,
  "balance" integer DEFAULT 0
);

CREATE TABLE "Store" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "address" varchar,
  "longtitude" float,
  "latitude" float
);

CREATE TABLE "Discount" (
  "id" integer PRIMARY KEY,
  "username" varchar,
  "product" integer,
  "price" float,
  "date" date
);

CREATE TABLE "Reaction" (
  "username" varchar PRIMARY KEY,
  "discount" integer,
  "liked" bit DEFAULT 0,
  "disliked" bit DEFAULT 0,
  "date" date
);

CREATE TABLE "Product" (
  "id" integer PRIMARY KEY,
  "name" varchar,
  "category" varchar,
  "subcategory" varchar
);

CREATE TABLE "Products_in_Store" (
  "store_id" integer,
  "product_id" integer,
  "availability" integer
);

CREATE TABLE "Price" (
  "product_id" integer,
  "store_id" integer,
  "date" date,
  "price" integer
);

CREATE TABLE "Score_History" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar,
  "current_score" integer,
  "total_score" integer,
  "date" date
);

CREATE TABLE "Token_History" (
  "id" SERIAL PRIMARY KEY,
  "username" varchar,
  "tokens_given" integer,
  "total_tokens" integer,
  "date" date
);

ALTER TABLE "Discount" ADD FOREIGN KEY ("username") REFERENCES "User" ("username");

ALTER TABLE "Discount" ADD FOREIGN KEY ("product") REFERENCES "Product" ("id");

ALTER TABLE "Reaction" ADD FOREIGN KEY ("username") REFERENCES "User" ("username");

ALTER TABLE "Reaction" ADD FOREIGN KEY ("discount") REFERENCES "Discount" ("id");

ALTER TABLE "Products_in_Store" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Products_in_Store" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("id");

ALTER TABLE "Price" ADD FOREIGN KEY ("product_id") REFERENCES "Product" ("id");

ALTER TABLE "Price" ADD FOREIGN KEY ("store_id") REFERENCES "Store" ("id");

ALTER TABLE "Score_History" ADD FOREIGN KEY ("username") REFERENCES "User" ("username");

ALTER TABLE "Token_History" ADD FOREIGN KEY ("username") REFERENCES "User" ("username");

COMMENT ON TABLE "User" IS 'The table where user information and their role is stored.';

COMMENT ON TABLE "Store" IS 'every entry in this table represents a Store.';

COMMENT ON TABLE "Discount" IS 'Here we store the discounts that the users submit to e-chiguna.';

COMMENT ON TABLE "Reaction" IS 'Here we store the reaction of the users to a specific discount.';

COMMENT ON TABLE "Product" IS 'Here we store all the products that we know. For products of a single store, check the table "Products_in_Store".';

COMMENT ON TABLE "Products_in_Store" IS 'This table contains the products available in each store.';

COMMENT ON TABLE "Price" IS 'This table contains the prices that are submitted from the administrator.';

COMMENT ON TABLE "Score_History" IS 'This table keeps a record of the score of each user.';

COMMENT ON COLUMN "Score_History"."current_score" IS 'This is the score of the month stated in the field "date".';

COMMENT ON COLUMN "Score_History"."total_score" IS 'This is the sum of the score of all of the previous months, before the month stated at the field "date".';

COMMENT ON TABLE "Token_History" IS 'This table keeps a record of the tokens of each user.';

COMMENT ON COLUMN "Token_History"."tokens_given" IS 'These are the tokens given to the user (stated in "username") for the month stated in the field "date".';

COMMENT ON COLUMN "Token_History"."total_tokens" IS 'This is the token total of the user (stated in "username") up to the previous month of the one stated in the field "date".';
