CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" VARCHAR(30),
  "created_at" TIMESTAMP,
  "updated_at" TIMESTAMP
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "url" VARCHAR(200),
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

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "likes" ADD FOREIGN KEY ("comment_id") REFERENCES "comments" ("id");
