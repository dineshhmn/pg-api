CREATE SCHEMA IF NOT EXISTS public;
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "chkpass";

DROP TYPE IF EXISTS type_gender cascade;
CREATE TYPE type_gender AS ENUM ('male','female');

DROP TYPE IF EXISTS type_struct cascade;
CREATE TYPE type_struct AS (
  name           VARCHAR(200),
  supplier_id     INT[],
  price           numeric
);

DROP TABLE IF EXISTS public.user cascade;
CREATE TABLE public.user(
  account_id  SERIAL PRIMARY KEY,
  account VARCHAR(200) NOT NULL,
  display_name VARCHAR(200) NOT NULL,
  age INT,
  price DECIMAL,
  is_active BIT,
  roles BIGINT[],
  gender type_gender NOT NULL DEFAULT 'male',
  password chkpass,
  meta JSONB,
  struct type_struct,
  date_registered TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMP WITH TIME ZONE
) WITH (
    OIDS = FALSE
);

CREATE VIEW v_test AS SELECT account_id,account, display_name, age FROM public.user;

INSERT INTO public.user
(account, display_name, age, price, password, meta,gender,roles,struct,is_active)
    VALUES
      ('account_1','UNIT TEST', 10,400,'password','{"b":4,"c":"c1","d":{"d1":20,"d2":40,"d3":[1,2,3]}}','male','{1,2}',ROW('fuzzy1', '{1,2}', 100),1::BIT)
      ,('account_2','account 2 display name', 20,200,'password','{"b":2,"c":"c2","d":{"d1":30,"d3":[2]}}','male','{1}',ROW('fuzzy2', '{20,50}', 1.99),1::BIT)
      ,('account_3','account 3 display name', 30,300,'password','{"b":3,"c":"c3","d":{"d1":30,"d2":40,"d3":[2,5]}}','female','{1,3}',ROW('fuzz"y3', '{10,50}', 1.99),1::BIT)
      ,('account_4','account 4 display name', 40,400,'password','{"b":4,"c":"c4","d":{"d1":20,"d2":50,"d3":[3,5]}}','female','{1,2}',ROW('fuzzy4', '{40,50}', 1.99),0::BIT)
;