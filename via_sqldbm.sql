CREATE TABLE "public"."space_cost"
(
 "space_cost_id"         int NOT NULL,
 "price_for_unit"        decimal(6,2) NOT NULL,
 "price_for_total_space" decimal(18,2) NOT NULL,
 CONSTRAINT "PK_space_cost" PRIMARY KEY ( "space_cost_id" )
);

CREATE TABLE "public"."space"
(
 "space_id"      int NOT NULL,
 "space"         int NOT NULL,
 "space_cost_id" int NOT NULL,
 CONSTRAINT "PK_space" PRIMARY KEY ( "space_id" ),
 CONSTRAINT "FK_193" FOREIGN KEY ( "space_cost_id" ) REFERENCES "public"."space_cost" ( "space_cost_id" )
);

CREATE INDEX "fkIdx_193" ON "public"."space"
(
 "space_cost_id"
);

CREATE TABLE "public"."occupiers"
(
 "occupier_id"   int NOT NULL,
 "occupier_name" varchar(100) NOT NULL,
 "space_id"      int NOT NULL,
 "space_cost_id" int NOT NULL,
 CONSTRAINT "PK_occupiers" PRIMARY KEY ( "occupier_id" ),
 CONSTRAINT "FK_196" FOREIGN KEY ( "space_id" ) REFERENCES "public"."space" ( "space_id" ),
 CONSTRAINT "FK_205" FOREIGN KEY ( "space_cost_id" ) REFERENCES "public"."space_cost" ( "space_cost_id" )
);

CREATE INDEX "fkIdx_196" ON "public"."occupiers"
(
 "space_id"
);

CREATE INDEX "fkIdx_205" ON "public"."occupiers"
(
 "space_cost_id"
);


CREATE TABLE "public"."advertising_activities"
(
 "adv_campaign_id"  int NOT NULL,
 "predict_coverage" int NULL,
 "result_coverage"  int NOT NULL,
 CONSTRAINT "PK_advertising_activities" PRIMARY KEY ( "adv_campaign_id" )
);

CREATE TABLE "public"."adv_date"
(
 "adv_date_id"     int NOT NULL,
 "date_start"      date NOT NULL,
 "date_finish"     date NOT NULL,
 "durations"       interval day NULL,
 "adv_campaign_id" int NOT NULL,
 CONSTRAINT "PK_adv_date" PRIMARY KEY ( "adv_date_id" ),
 CONSTRAINT "FK_174" FOREIGN KEY ( "adv_campaign_id" ) REFERENCES "public"."advertising_activities" ( "adv_campaign_id" )
);

CREATE INDEX "fkIdx_174" ON "public"."adv_date"
(
 "adv_campaign_id"
);

CREATE TABLE "public"."app_clients"
(
 "app_client_id" int NOT NULL,
 "name"          varchar(100) NOT NULL,
 "gender"        varchar(1) NULL,
 "phone_number"  varchar(11) NULL,
 "e_mail"        varchar(50) NOT NULL,
 CONSTRAINT "PK_app_clients" PRIMARY KEY ( "app_client_id" )
);

CREATE TABLE "public"."branch_mobile_app"
(
 "app_id"        int NOT NULL,
 "app_name"      varchar(50) NOT NULL,
 "client_number" int NOT NULL,
 "app_client_id" int NOT NULL,
 CONSTRAINT "PK_branch_mobile_app" PRIMARY KEY ( "app_id" ),
 CONSTRAINT "FK_180" FOREIGN KEY ( "app_client_id" ) REFERENCES "public"."app_clients" ( "app_client_id" )
);

CREATE INDEX "fkIdx_180" ON "public"."branch_mobile_app"
(
 "app_client_id"
);

CREATE TABLE "public"."branch_office"
(
 "start_table_id"  int NOT NULL,
 "branch_name"     varchar(50) NOT NULL,
 "ceo_name"        varchar(50) NOT NULL,
 "INN"             int NOT NULL,
 "occupier_number" int NOT NULL,
 "profit"          int NULL,
 "adv_date_id"     int NOT NULL,
 "app_id"          int NOT NULL,
 "occupier_id"     int NOT NULL,
 "space_id"        int NOT NULL,
 CONSTRAINT "PK_branch_office" PRIMARY KEY ( "start_table_id" ),
 CONSTRAINT "FK_177" FOREIGN KEY ( "adv_date_id" ) REFERENCES "public"."adv_date" ( "adv_date_id" ),
 CONSTRAINT "FK_190" FOREIGN KEY ( "app_id" ) REFERENCES "public"."branch_mobile_app" ( "app_id" ),
 CONSTRAINT "FK_199" FOREIGN KEY ( "occupier_id" ) REFERENCES "public"."occupiers" ( "occupier_id" ),
 CONSTRAINT "FK_202" FOREIGN KEY ( "space_id" ) REFERENCES "public"."space" ( "space_id" )
);

CREATE INDEX "fkIdx_177" ON "public"."branch_office"
(
 "adv_date_id"
);

CREATE INDEX "fkIdx_190" ON "public"."branch_office"
(
 "app_id"
);

CREATE INDEX "fkIdx_199" ON "public"."branch_office"
(
 "occupier_id"
);

CREATE INDEX "fkIdx_202" ON "public"."branch_office"
(
 "space_id"
);

select * from public.branch_office