CREATE TABLE account (
id		SERIAL,
name		VARCHAR(64) NOT NULL,
email		VARCHAR(64) DEFAULT NULL,
password	VARCHAR(128) NOT NULL,
ha1		CHAR(32) NOT NULL,
country		INTEGER -- references country.id
);

CREATE TABLE brand (
id		SERIAL,
gid             UUID NOT NULL,
name		VARCHAR NOT NULL
);

CREATE TABLE chocolate (
id		SERIAL,
gid             UUID NOT NULL,
name		VARCHAR NOT NULL,
brand_id	INTEGER NOT NULL -- references brand.id
);

CREATE TABLE chocolate_meta (
id		INTEGER NOT NULL, -- PK, references chocolate.id CASCADE
rating		SMALLINT CHECK (rating >= 0 AND rating <= 100),
rating_count	INTEGER
);

CREATE TABLE chocolate_rating_raw (
account		INTEGER NOT NULL, -- PK, references account.id
chocolate	INTEGER NOT NULL, -- PK, references chocolate.id
rating		SMALLINT NOT NULL CHECK (rating >= 0 AND rating <= 100)
);

CREATE TABLE chocolate_tag_raw (
account		INTEGER NOT NULL, -- PK, references account.id
chocolate	INTEGER NOT NULL, -- PK, references chocolate.id
tag		INTEGER NOT NULL, -- PK, references tag.id
is_upvote	BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE country (
id		SERIAL,
gid             UUID NOT NULL,
name		VARCHAR NOT NULL,
iso_code	CHAR(2)
);

CREATE TABLE l_brand_url (
id              SERIAL,
link_type       INTEGER NOT NULL, -- references link_type.id
brand		INTEGER NOT NULL, -- PK, references brand.id
url             INTEGER NOT NULL -- PK, references url.id
);

CREATE TABLE l_chocolate_url (
id		SERIAL,
link_type	INTEGER NOT NULL, -- references link_type.id
chocolate       INTEGER NOT NULL, -- PK, references chocolate.id
url		INTEGER NOT NULL -- PK, references url.id
);

CREATE TABLE l_product_url (
id              SERIAL,
link_type       INTEGER NOT NULL, -- references link_type.id
product		INTEGER NOT NULL, -- PK, references product.id
url             INTEGER NOT NULL -- PK, references url.id
);

CREATE TABLE link_type (
id                  SERIAL,
gid                 UUID NOT NULL,
name                VARCHAR(255) NOT NULL,
description         TEXT,
link_phrase         VARCHAR(255) NOT NULL,
reverse_link_phrase VARCHAR(255) NOT NULL
);

CREATE TABLE product (
id              SERIAL,
gid             UUID NOT NULL,
name            VARCHAR NOT NULL,
barcode		VARCHAR(255),
weight		INTEGER,
chocolate_id    INTEGER NOT NULL -- references chocolate.id
);

CREATE TABLE tag (
id		SERIAL,
name		VARCHAR NOT NULL
);

CREATE TABLE url (
id		SERIAL,
url		VARCHAR NOT NULL
);
