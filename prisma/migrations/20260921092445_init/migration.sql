-- CreateTable
CREATE TABLE "actions" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "actions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "activity_log" (
    "id" BIGSERIAL NOT NULL,
    "log_name" VARCHAR(191),
    "description" TEXT NOT NULL,
    "subject_id" DECIMAL,
    "subject_type" VARCHAR(191),
    "causer_id" DECIMAL,
    "causer_type" VARCHAR(191),
    "properties" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "activity_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bank_data_categories" (
    "id" BIGSERIAL NOT NULL,
    "parent_id" BIGINT,
    "name" VARCHAR(100) NOT NULL,
    "type" VARCHAR(100),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "image" VARCHAR(225),

    CONSTRAINT "bank_data_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bank_data_contacts" (
    "id" BIGSERIAL NOT NULL,
    "bank_data_category_id" BIGINT NOT NULL,
    "name" VARCHAR(100),
    "phone_number" VARCHAR(20),
    "instance" VARCHAR(255),
    "description" TEXT,
    "image" VARCHAR(200),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "bank_data_contacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bank_data_documents" (
    "id" BIGSERIAL NOT NULL,
    "bank_data_category_id" BIGINT NOT NULL,
    "name" VARCHAR(100),
    "letter_number" VARCHAR(100),
    "date" DATE,
    "file" VARCHAR(200),
    "description" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "bank_data_documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bank_data_foods" (
    "id" BIGSERIAL NOT NULL,
    "bank_data_category_id" BIGINT NOT NULL,
    "name" VARCHAR(100),
    "phone_number" VARCHAR(20),
    "pic_name" VARCHAR(100),
    "pic_phone_number" VARCHAR(20),
    "description" TEXT,
    "location" VARCHAR(255),
    "latitude" VARCHAR(255),
    "longitude" VARCHAR(255),
    "image" VARCHAR(200),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "bank_data_foods_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bank_data_instances" (
    "id" BIGSERIAL NOT NULL,
    "bank_data_category_id" BIGINT NOT NULL,
    "name" VARCHAR(100),
    "pic_name" VARCHAR(100),
    "pic_phone_number" VARCHAR(255),
    "description" TEXT,
    "location" VARCHAR(255),
    "latitude" VARCHAR(255),
    "longitude" VARCHAR(255),
    "image" VARCHAR(200),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "bank_data_instances_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "banners" (
    "id" BIGSERIAL NOT NULL,
    "image" VARCHAR(225) NOT NULL,
    "status" SMALLINT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "banners_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comments" (
    "id" BIGSERIAL NOT NULL,
    "text" TEXT,
    "image" VARCHAR(200),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "user_id" BIGINT,
    "event_id" BIGINT,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contact_people" (
    "id" BIGSERIAL NOT NULL,
    "bank_data_category_id" BIGINT,
    "name" VARCHAR(100) NOT NULL,
    "phonenumber" VARCHAR(20) NOT NULL,
    "job" VARCHAR(45) NOT NULL,
    "instance" VARCHAR(255),
    "image" VARCHAR(200),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "contact_people_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disposition_actions" (
    "id" BIGSERIAL NOT NULL,
    "disposition_id" BIGINT NOT NULL,
    "action_id" BIGINT NOT NULL,
    "note" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "disposition_actions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disposition_positions" (
    "id" BIGSERIAL NOT NULL,
    "disposition_id" BIGINT NOT NULL,
    "position_id" BIGINT NOT NULL,
    "note" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "disposition_positions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "disposition_sends" (
    "id" BIGSERIAL NOT NULL,
    "disposition_id" BIGINT NOT NULL,
    "name" VARCHAR(191) NOT NULL DEFAULT '',
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "disposition_sends_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dispositions" (
    "id" BIGSERIAL NOT NULL,
    "letter_id" BIGINT NOT NULL,
    "date" DATE,
    "note" TEXT,
    "file" VARCHAR(225),
    "send_by" VARCHAR(225),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "dispositions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_letters" (
    "id" BIGSERIAL NOT NULL,
    "event_id" DECIMAL NOT NULL,
    "letter_id" DECIMAL NOT NULL,
    "disposition_id" BIGINT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "event_letters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_members" (
    "id" BIGSERIAL NOT NULL,
    "event_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "event_members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "event_reschedules" (
    "id" BIGSERIAL NOT NULL,
    "event_id" BIGINT NOT NULL,
    "old_time_start" TIMESTAMP(0),
    "old_time_finish" TIMESTAMP(0),
    "new_time_start" TIMESTAMP(0),
    "new_time_finish" TIMESTAMP(0),
    "until_finish" INTEGER NOT NULL DEFAULT 0,
    "reason" TEXT,
    "created_at" TIMESTAMP(0) DEFAULT CURRENT_TIMESTAMP,
    "created_by" VARCHAR(191),

    CONSTRAINT "event_reschedules_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "events" (
    "id" BIGSERIAL NOT NULL,
    "disposition_id" BIGINT,
    "letter_id" BIGINT,
    "title" TEXT NOT NULL,
    "event_time_start" TIMESTAMP(0),
    "event_time_finish" TIMESTAMP(0),
    "until_finish" INTEGER NOT NULL DEFAULT 0,
    "is_internal" VARCHAR(1),
    "is_hide_location" VARCHAR(1),
    "time_zone" VARCHAR(10),
    "status" BIGINT,
    "location" TEXT,
    "longitude" DOUBLE PRECISION,
    "latitude" DOUBLE PRECISION,
    "pic_json" TEXT,
    "pic_name" VARCHAR(225),
    "pic_phonenumber" VARCHAR(100),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "notes" TEXT,

    CONSTRAINT "events_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "forwards" (
    "id" BIGSERIAL NOT NULL,
    "letter_id" BIGINT NOT NULL,
    "position_id" BIGINT NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "forwards_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "guest_books" (
    "id" BIGINT NOT NULL,
    "agency_name" VARCHAR(250) NOT NULL,
    "pic" BIGINT NOT NULL,
    "phone_number" VARCHAR(45) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "guest_books_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ingredient_categories" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "color" VARCHAR(100),
    "image" VARCHAR(225),

    CONSTRAINT "ingredient_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ingredients" (
    "id" BIGSERIAL NOT NULL,
    "event_id" BIGINT NOT NULL,
    "ingredient_category_id" BIGINT NOT NULL,
    "name" VARCHAR(225) NOT NULL,
    "file" VARCHAR(225) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "ingredients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itineraries" (
    "id" BIGSERIAL NOT NULL,
    "event_id" BIGINT,
    "title" TEXT NOT NULL,
    "date_from" DATE,
    "date_to" DATE,
    "group" TEXT,
    "advance_team" TEXT,
    "destination" VARCHAR(225),
    "area" BIGINT,
    "description" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "time_zone" VARCHAR(45),

    CONSTRAINT "itineraries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itinerary_details" (
    "id" BIGSERIAL NOT NULL,
    "time_from" TIMESTAMP(0),
    "time_to" TIMESTAMP(0),
    "activity" TEXT,
    "information" TEXT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "itinerary_id" BIGINT,

    CONSTRAINT "itinerary_details_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "letter_categories" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "image" VARCHAR(225),
    "color" VARCHAR(100),

    CONSTRAINT "letter_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "letter_types" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(45) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "letter_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "letters" (
    "id" BIGSERIAL NOT NULL,
    "letter_category_id" BIGINT NOT NULL,
    "agenda_number" VARCHAR(100) NOT NULL,
    "date_letter" DATE,
    "from" VARCHAR(225) NOT NULL,
    "subject" VARCHAR(225),
    "date_event" DATE,
    "time_event" TIME(6),
    "time_event_finish" TIME(6),
    "place_event" VARCHAR(225),
    "type_letter" BIGINT,
    "note" TEXT,
    "file" VARCHAR(225),
    "number_or_date" VARCHAR(100),
    "time_zone" VARCHAR(100),
    "pic_name" VARCHAR(100),
    "pic_phone_number" VARCHAR(50),
    "delivery_via" VARCHAR(100),
    "status" SMALLINT,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),
    "disposition_printed_at" TIMESTAMP(0),
    "institution_origin" TEXT NOT NULL DEFAULT 'Lainnya',
    "date_event_end" DATE,
    "pic_json" TEXT,

    CONSTRAINT "letters_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "migrations" (
    "id" BIGSERIAL NOT NULL,
    "migration" VARCHAR(191) NOT NULL,
    "batch" BIGINT NOT NULL,

    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "model_has_permissions" (
    "permission_id" BIGINT NOT NULL,
    "model_type" VARCHAR(191) NOT NULL,
    "model_id" DECIMAL NOT NULL,

    CONSTRAINT "model_has_permissions_pkey" PRIMARY KEY ("permission_id","model_id","model_type")
);

-- CreateTable
CREATE TABLE "model_has_roles" (
    "role_id" BIGINT NOT NULL,
    "model_type" VARCHAR(191) NOT NULL,
    "model_id" DECIMAL NOT NULL,

    CONSTRAINT "model_has_roles_pkey" PRIMARY KEY ("role_id","model_id","model_type")
);

-- CreateTable
CREATE TABLE "monitoring_members" (
    "id" BIGSERIAL NOT NULL,
    "letter_id" BIGINT,
    "name" VARCHAR(100),
    "position" VARCHAR(100),
    "phone_number" VARCHAR(45),
    "email" VARCHAR(255),
    "police_number" VARCHAR(45),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "monitoring_members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notifications" (
    "id" BIGSERIAL NOT NULL,
    "created_user_id" BIGINT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "event_id" BIGINT,
    "itinerary_id" BIGINT,
    "type" VARCHAR(100) NOT NULL,
    "message" TEXT NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT 0,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(100),
    "updated_by" VARCHAR(100),
    "deleted_by" VARCHAR(100),

    CONSTRAINT "notifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_access_tokens" (
    "id" VARCHAR(100) NOT NULL,
    "user_id" BIGINT,
    "client_id" BIGINT NOT NULL,
    "name" VARCHAR(255),
    "scopes" TEXT,
    "revoked" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "expires_at" TIMESTAMP(0),

    CONSTRAINT "oauth_access_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_auth_codes" (
    "id" VARCHAR(100) NOT NULL,
    "user_id" BIGINT NOT NULL,
    "client_id" BIGINT NOT NULL,
    "scopes" TEXT,
    "revoked" SMALLINT NOT NULL,
    "expires_at" TIMESTAMP(0),

    CONSTRAINT "oauth_auth_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_clients" (
    "id" BIGSERIAL NOT NULL,
    "user_id" BIGINT,
    "name" VARCHAR(255) NOT NULL,
    "secret" VARCHAR(100) NOT NULL,
    "redirect" TEXT NOT NULL,
    "personal_access_client" SMALLINT NOT NULL,
    "password_client" SMALLINT NOT NULL,
    "revoked" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "oauth_clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_personal_access_clients" (
    "id" BIGSERIAL NOT NULL,
    "client_id" BIGINT NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "oauth_personal_access_clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "oauth_refresh_tokens" (
    "id" VARCHAR(100) NOT NULL,
    "access_token_id" VARCHAR(100) NOT NULL,
    "revoked" SMALLINT NOT NULL,
    "expires_at" TIMESTAMP(0),

    CONSTRAINT "oauth_refresh_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "permissions" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(191) NOT NULL,
    "guard_name" VARCHAR(191) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "permissions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "position_itineraries" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "position_itineraries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "positions" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "alias" VARCHAR(255),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "created_by" VARCHAR(191),
    "updated_by" VARCHAR(191),
    "deleted_by" VARCHAR(191),

    CONSTRAINT "positions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_has_permissions" (
    "permission_id" BIGINT NOT NULL,
    "role_id" BIGINT NOT NULL,

    CONSTRAINT "role_has_permissions_pkey" PRIMARY KEY ("permission_id","role_id")
);

-- CreateTable
CREATE TABLE "roles" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(191) NOT NULL,
    "guard_name" VARCHAR(191) NOT NULL,
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),

    CONSTRAINT "roles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schema_change_log" (
    "id" BIGSERIAL NOT NULL,
    "script_name" VARCHAR(255) NOT NULL,
    "applied_at" TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "applied_by" VARCHAR(100),
    "notes" TEXT,

    CONSTRAINT "schema_change_log_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" BIGSERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "image" VARCHAR(50),
    "password" VARCHAR(191) NOT NULL,
    "remember_token" VARCHAR(100),
    "created_at" TIMESTAMP(0),
    "updated_at" TIMESTAMP(0),
    "deleted_at" TIMESTAMP(0),
    "role" VARCHAR(100),
    "phone_number" VARCHAR(100) NOT NULL,
    "device_id" TEXT,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "idx_139996_primary" ON "actions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140006_primary" ON "activity_log"("id");

-- CreateIndex
CREATE INDEX "idx_140006_activity_log_log_name_index" ON "activity_log"("log_name");

-- CreateIndex
CREATE INDEX "idx_140006_causer" ON "activity_log"("causer_id", "causer_type");

-- CreateIndex
CREATE INDEX "idx_140006_subject" ON "activity_log"("subject_id", "subject_type");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140016_primary" ON "bank_data_categories"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140028_primary" ON "bank_data_contacts"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140042_primary" ON "bank_data_documents"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140055_primary" ON "bank_data_foods"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140073_primary" ON "bank_data_instances"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140090_primary" ON "banners"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140100_primary" ON "comments"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140111_primary" ON "contact_people"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140135_primary" ON "disposition_actions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140145_primary" ON "disposition_positions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140155_primary" ON "disposition_sends"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140123_primary" ON "dispositions"("id");

-- CreateIndex
CREATE INDEX "idx_140123_idx_dispositions" ON "dispositions"("id", "letter_id", "date", "created_at");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140182_primary" ON "event_letters"("id");

-- CreateIndex
CREATE INDEX "idx_140182_idx_event_letters_disposition_id" ON "event_letters"("disposition_id");

-- CreateIndex
CREATE INDEX "idx_140182_idx_event_letters_event_id" ON "event_letters"("event_id");

-- CreateIndex
CREATE INDEX "idx_140182_idx_event_letters_letter_id" ON "event_letters"("letter_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140182_uk_event_letter" ON "event_letters"("event_id", "letter_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140192_primary" ON "event_members"("id");

-- CreateIndex
CREATE INDEX "idx_140192_idx_event_members" ON "event_members"("id", "event_id", "user_id", "created_at");

-- CreateIndex
CREATE INDEX "event_reschedules_event_id_idx" ON "event_reschedules"("event_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140166_primary" ON "events"("id");

-- CreateIndex
CREATE INDEX "idx_140166_idx_events" ON "events"("id", "disposition_id", "letter_id", "created_at");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140202_primary" ON "forwards"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140211_primary" ON "guest_books"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140230_primary" ON "ingredient_categories"("id");

-- CreateIndex
CREATE INDEX "idx_140230_idx_ingredient_categories" ON "ingredient_categories"("id", "name", "created_at");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140220_primary" ON "ingredients"("id");

-- CreateIndex
CREATE INDEX "idx_140220_idx_ingredients" ON "ingredients"("id", "event_id", "ingredient_category_id", "created_at");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140242_primary" ON "itineraries"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140254_primary" ON "itinerary_details"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140282_primary" ON "letter_categories"("id");

-- CreateIndex
CREATE INDEX "idx_140282_idx_letter_categories" ON "letter_categories"("id", "name", "created_at");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140294_primary" ON "letter_types"("id");

-- CreateIndex
CREATE INDEX "idx_140294_idx_letter_types" ON "letter_types"("id", "name", "created_at");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140264_primary" ON "letters"("id");

-- CreateIndex
CREATE INDEX "idx_140264_idx_letter" ON "letters"("id", "letter_category_id", "created_at");

-- CreateIndex
CREATE INDEX "idx_140264_idx_letters_status" ON "letters"("status");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140304_primary" ON "migrations"("id");

-- CreateIndex
CREATE INDEX "idx_140308_model_has_permissions_model_id_model_type_index" ON "model_has_permissions"("model_id", "model_type");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140308_primary" ON "model_has_permissions"("permission_id", "model_id", "model_type");

-- CreateIndex
CREATE INDEX "idx_140313_model_has_roles_model_id_model_type_index" ON "model_has_roles"("model_id", "model_type");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140313_primary" ON "model_has_roles"("role_id", "model_id", "model_type");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140319_primary" ON "monitoring_members"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140334_primary" ON "notifications"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140344_primary" ON "oauth_access_tokens"("id");

-- CreateIndex
CREATE INDEX "idx_140344_oauth_access_tokens_user_id_index" ON "oauth_access_tokens"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140350_primary" ON "oauth_auth_codes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140356_primary" ON "oauth_clients"("id");

-- CreateIndex
CREATE INDEX "idx_140356_oauth_clients_user_id_index" ON "oauth_clients"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140363_primary" ON "oauth_personal_access_clients"("id");

-- CreateIndex
CREATE INDEX "idx_140363_oauth_personal_access_clients_client_id_index" ON "oauth_personal_access_clients"("client_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140367_primary" ON "oauth_refresh_tokens"("id");

-- CreateIndex
CREATE INDEX "idx_140367_oauth_refresh_tokens_access_token_id_index" ON "oauth_refresh_tokens"("access_token_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140371_primary" ON "permissions"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140387_primary" ON "position_itineraries"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140376_primary" ON "positions"("id");

-- CreateIndex
CREATE INDEX "idx_140401_role_has_permissions_role_id_foreign" ON "role_has_permissions"("role_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140401_primary" ON "role_has_permissions"("permission_id", "role_id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140397_primary" ON "roles"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140405_primary" ON "schema_change_log"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140405_uk_script_name" ON "schema_change_log"("script_name");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140414_primary" ON "users"("id");

-- CreateIndex
CREATE UNIQUE INDEX "idx_140414_users_email_unique" ON "users"("email");

-- CreateIndex
CREATE INDEX "idx_140414_idx_users" ON "users"("id", "name", "email", "created_at");

-- AddForeignKey
ALTER TABLE "event_reschedules" ADD CONSTRAINT "event_reschedules_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "model_has_permissions" ADD CONSTRAINT "model_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "model_has_roles" ADD CONSTRAINT "model_has_roles_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_permission_id_foreign" FOREIGN KEY ("permission_id") REFERENCES "permissions"("id") ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE "role_has_permissions" ADD CONSTRAINT "role_has_permissions_role_id_foreign" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE CASCADE ON UPDATE RESTRICT;
