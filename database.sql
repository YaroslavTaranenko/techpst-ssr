DROP DATABASE IF EXISTS techpst_ssr;
CREATE DATABASE techpst_ssr;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
USE techpst_ssr;


CREATE TABLE legal_forms(
  id serial,
  title VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE user_discounts(
  id serial,
  title VARCHAR,
  val VARCHAR,
  PRIMARY KEY(id)
);

CREATE TABLE roles(
  id serial,
  code varchar UNIQUE,
  role_info varchar,
  PRIMARY KEY(id)
);

CREATE TABLE users (
    id serial,
    uuid uuid UNIQUE DEFAULT uuid_generate_v4 (),
    email VARCHAR NOT NULL,
    passwd VARCHAR,
    salt VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE user_info (
  id serial,
  user_id uuid NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  username VARCHAR(255),
  phone VARCHAR(255),
  PRIMARY KEY(id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(uuid)
);

CREATE TABLE users_has_roles(
  user_id uuid NOT NULL,
  role_code VARCHAR NOT NULL,
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(uuid),
  CONSTRAINT fk_role FOREIGN KEY (role_code) REFERENCES roles(code)
);

CREATE TABLE baskets(
  id uuid UNIQUE DEFAULT uuid_generate_v4 (),
  user_id uuid,
  PRIMARY KEY (id),
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(uuid)
);

/*=============================================== users ==============================================*/

CREATE TABLE characteristic_groups(
  id serial,
  title VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE characteristics(
  id serial,
  group_id INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_groups FOREIGN KEY (group_id) REFERENCES characteristic_groups(id)
);

CREATE TABLE brands(
  id serial,
  title VARCHAR NOT NULL,
  info TEXT,
  picture VARCHAR,
  PRIMARY KEY (id)
);

CREATE TABLE categories(
  id serial,
  brand_id INT NOT NULL,
  title VARCHAR,
  picture VARCHAR,
  info VARCHAR,
  PRIMARY KEY (id),
  CONSTRAINT fk_brands FOREIGN KEY (brand_id) REFERENCES brands(id)
)