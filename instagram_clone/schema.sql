CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" VARCHAR(30),
  "bio" VARCHAR(400),
  "avatar" VARCHAR(200),
  "phone" VARCHAR(25),
  "email" VARCHAR(40),
  "password" VARCHAR(50),
  "status" VARCHAR(15),
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "url" VARCHAR(200),
  "caption" VARCHAR(240),
  "lat" REAL,
  "lng" REAL,
  "user_id" INTEGER,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "contents" VARCHAR(240),
  "user_id" INTEGER,
  "post_id" INTEGER,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "likes" (
  "id" SERIAL PRIMARY KEY,
  "user_id" INTEGER,
  "post_id" INTEGER,
  "comment_id" INTEGER,
  "created_at" TIMESTAMP
);

CREATE TABLE "tags" (
  "id" SERIAL PRIMARY KEY,
  "x" INTEGER,
  "y" INTEGER,
  "user_id" INTEGER,
  "post_id" INTEGER,
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "mentions" (
  "id" SERIAL PRIMARY KEY,
  "user_id" INTEGER,
  "post_id" INTEGER,
  "created_at" TIMESTAMP
);

CREATE TABLE "hashtags" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(200),
  "created_at" TIMESTAMP
);

CREATE TABLE "hashtag_posts" (
  "id" SERIAL PRIMARY KEY,
  "hashtag_id" INTEGER,
  "post_id" INTEGER
);

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("comment_id") REFERENCES "comments" ("id");

ALTER TABLE "tags" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "tags" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "mentions" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "mentions" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "hashtag_posts" ADD FOREIGN KEY ("hashtag_id") REFERENCES "hashtags" ("id");

ALTER TABLE "hashtag_posts" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");
