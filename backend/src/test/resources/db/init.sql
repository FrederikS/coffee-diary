CREATE TABLE public.roastery (
	id bigserial NOT NULL,
	"name" text NOT NULL,
	website text NOT NULL,
	CONSTRAINT pk_table_2_id PRIMARY KEY (id),
	CONSTRAINT roastery_website_key UNIQUE (website)
);

INSERT INTO public.roastery VALUES (1, 'Backyard Coffee', 'https://www.backyard-coffee.com');
INSERT INTO public.roastery VALUES (2, 'Flying Roasters', 'https://www.flyingroasters.de');
INSERT INTO public.roastery VALUES (3, 'Schramms Kaffeeroesterei', 'https://www.schramms-kaffee.de');
INSERT INTO public.roastery VALUES (4, 'Kabo Kaffee', 'https://www.kabo-kaffee.de/');
INSERT INTO public.roastery VALUES (5, 'Toms Kaffeeroesterei', 'https://www.toms-kaffeeroesterei.de/');
INSERT INTO public.roastery VALUES (6, 'Cafe de Enrico', 'https://www.cafe-enrico.de/');
INSERT INTO public.roastery VALUES (7, 'Mykona Kaffeeroesterei', 'https://mykona.de');
INSERT INTO public.roastery VALUES (8, 'Ridders Kaffeeroesterei', 'https://www.ridders-roesterei.de/');
INSERT INTO public.roastery VALUES (9, 'Zazza Kaffeeroesterei', 'https://zazza-kaffee.de/');
INSERT INTO public.roastery VALUES (10, 'Blaue Bohne Kaffeeroesterei', 'https://blauebohne.com/');
INSERT INTO public.roastery VALUES (11, 'Torrefazione', 'https://www.torrefazione.de/');
INSERT INTO public.roastery VALUES (13, 'Kawa Kaffeemanufaktur', 'https://kawam.eu/');
INSERT INTO public.roastery VALUES (15, 'Havelbohne', 'https://havelbohne.de/');
INSERT INTO public.roastery VALUES (17, 'Caffè Vergnano 1882', 'https://www.caffevergnano.de/');
INSERT INTO public.roastery VALUES (19, 'Berliner Kaffeerösterei', 'https://shop.berliner-kaffeeroesterei.de/');

CREATE TABLE public.coffee_type (
	id smallserial NOT NULL,
	value text NOT NULL,
	CONSTRAINT pk_table_8_id PRIMARY KEY (id)
);

INSERT INTO public.coffee_type VALUES (1, 'espresso');
INSERT INTO public.coffee_type VALUES (2, 'filter');

CREATE TABLE public.coffee (
	id bigserial NOT NULL,
	name text NOT NULL,
	roastery_id bigint NOT NULL,
	type_id smallint NOT NULL,
	arabica smallint NOT NULL,
	robusta smallint NOT NULL,
	profile_description text NOT NULL,
	price money NOT NULL,
	link text NOT NULL,
	created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT pk_table_1_id PRIMARY KEY (id),
	CONSTRAINT fk_coffee_roastery_id_roastery_id FOREIGN KEY (roastery_id) REFERENCES public.roastery(id),
	CONSTRAINT fk_coffee_type_id_coffee_type_id FOREIGN KEY (type_id) REFERENCES public.coffee_type(id),
	CONSTRAINT coffee_arabica_check CHECK (((arabica >= 0) AND (arabica <= 100))),
	CONSTRAINT coffee_arabica_robusta_check CHECK (((arabica + robusta) = 100)),
	CONSTRAINT coffee_robusta_check CHECK (((robusta >= 0) AND (robusta <= 100)))
);

INSERT INTO public.coffee VALUES (1, 'House Blend', 1, 1, 80, 20, 'Chocolate and nuts with light citrus notes', 12.90, 'https://www.backyard-coffee.com/house-blend', '2024-01-15 10:00:00+00');
INSERT INTO public.coffee VALUES (2, 'Ethiopian Yirgacheffe', 1, 2, 100, 0, 'Floral with jasmine and bergamot', 16.90, 'https://www.backyard-coffee.com/ethiopian-yirgacheffe', '2024-01-20 10:00:00+00');
INSERT INTO public.coffee VALUES (3, 'Colombia Huila', 2, 1, 85, 15, 'Caramel sweetness with cherry', 14.50, 'https://www.flyingroasters.de/colombia-huila', '2024-02-01 10:00:00+00');
INSERT INTO public.coffee VALUES (4, 'Brazil Cerrado', 2, 2, 70, 30, 'Nutty with chocolate undertones', 11.90, 'https://www.flyingroasters.de/brazil-cerrado', '2024-02-10 10:00:00+00');
INSERT INTO public.coffee VALUES (5, 'Guatemala Antigua', 3, 1, 90, 10, 'Spicy with smoke and cocoa', 15.50, 'https://www.schramms-kaffee.de/guatemala-antigua', '2024-03-01 10:00:00+00');

-- Countries (origins)
CREATE TABLE public.country (
	id bigserial NOT NULL,
	name text NOT NULL,
	latlong point,
	CONSTRAINT pk_table_3_id PRIMARY KEY (id),
	CONSTRAINT country_name_key UNIQUE (name)
);

INSERT INTO public.country VALUES (1, 'Ethiopia', null);
INSERT INTO public.country VALUES (2, 'Colombia', null);
INSERT INTO public.country VALUES (3, 'Brazil', null);
INSERT INTO public.country VALUES (4, 'Guatemala', null);

-- Coffee-country join table
CREATE TABLE public.coffee_country (
	id bigserial NOT NULL,
	coffee_id bigint NOT NULL,
	country_id bigint NOT NULL,
	CONSTRAINT pk_coffee_country_coffee_id PRIMARY KEY (id),
	CONSTRAINT fk_coffee_country_coffee_id_coffee_id FOREIGN KEY (coffee_id) REFERENCES public.coffee(id),
	CONSTRAINT fk_coffee_country_country_id_country_id FOREIGN KEY (country_id) REFERENCES public.country(id)
);

INSERT INTO public.coffee_country VALUES (1, 1, 1);  -- House Blend -> Ethiopia
INSERT INTO public.coffee_country VALUES (2, 2, 1);  -- Ethiopian Yirgacheffe -> Ethiopia
INSERT INTO public.coffee_country VALUES (3, 3, 2);  -- Colombia Huila -> Colombia
INSERT INTO public.coffee_country VALUES (4, 4, 3);  -- Brazil Cerrado -> Brazil
INSERT INTO public.coffee_country VALUES (5, 5, 4);  -- Guatemala Antigua -> Guatemala

-- Profile tags
CREATE TABLE public.profile_tag (
	id bigserial NOT NULL,
	value text NOT NULL,
	CONSTRAINT pk_table_7_id PRIMARY KEY (id),
	CONSTRAINT profile_tag_value_key UNIQUE (value)
);

INSERT INTO public.profile_tag VALUES (1, 'Fruity');
INSERT INTO public.profile_tag VALUES (2, 'Chocolate');
INSERT INTO public.profile_tag VALUES (3, 'Nutty');
INSERT INTO public.profile_tag VALUES (4, 'Floral');
INSERT INTO public.profile_tag VALUES (5, 'Spicy');

-- Coffee-profile_tag join table
CREATE TABLE public.coffee_profile_tag (
	id bigserial NOT NULL,
	coffee_id bigint NOT NULL,
	tag_id bigint NOT NULL,
	CONSTRAINT pk_coffee_profile_tag_coffee_id PRIMARY KEY (id),
	CONSTRAINT fk_coffee_profile_tag_coffee_id_coffee_id FOREIGN KEY (coffee_id) REFERENCES public.coffee(id),
	CONSTRAINT fk_coffee_profile_tag_tag_id_profile_tag_id FOREIGN KEY (tag_id) REFERENCES public.profile_tag(id)
);

INSERT INTO public.coffee_profile_tag VALUES (1, 1, 2);  -- House Blend -> Chocolate
INSERT INTO public.coffee_profile_tag VALUES (2, 1, 3);  -- House Blend -> Nutty
INSERT INTO public.coffee_profile_tag VALUES (3, 2, 4);  -- Ethiopian Yirgacheffe -> Floral
INSERT INTO public.coffee_profile_tag VALUES (4, 2, 1);  -- Ethiopian Yirgacheffe -> Fruity
INSERT INTO public.coffee_profile_tag VALUES (5, 3, 1);  -- Colombia Huila -> Fruity
INSERT INTO public.coffee_profile_tag VALUES (6, 4, 3);  -- Brazil Cerrado -> Nutty
INSERT INTO public.coffee_profile_tag VALUES (7, 4, 2);  -- Brazil Cerrado -> Chocolate
INSERT INTO public.coffee_profile_tag VALUES (8, 5, 5);  -- Guatemala Antigua -> Spicy

-- Images
CREATE TABLE public.image (
	id bigserial NOT NULL,
	source_url text NOT NULL,
	file jsonb NOT NULL,
	description character varying NOT NULL,
	CONSTRAINT image_pkey PRIMARY KEY (id),
	CONSTRAINT image_source_url_key UNIQUE (source_url),
	CONSTRAINT image_file_key UNIQUE (file)
);

INSERT INTO public.image VALUES (1, 'https://example.com/coffee1.jpg', '{"uri":"s3://mathesar/fdk/test.jpg","mash":"abc123"}', 'House Blend bag');

-- Coffee-image join table
CREATE TABLE public.coffee_image (
	id bigserial NOT NULL,
	coffee_id bigint NOT NULL,
	image_id bigint NOT NULL,
	"order" smallint DEFAULT '0'::smallint NOT NULL,
	CONSTRAINT coffee_image_pkey PRIMARY KEY (id),
	CONSTRAINT coffee_image_coffee_id_fkey FOREIGN KEY (coffee_id) REFERENCES public.coffee(id),
	CONSTRAINT coffee_image_image_id_fkey FOREIGN KEY (image_id) REFERENCES public.image(id)
);

INSERT INTO public.coffee_image VALUES (1, 1, 1, 0);

-- Drink types
CREATE TABLE public.coffee_drink_type (
	id serial NOT NULL,
	value text NOT NULL,
	CONSTRAINT coffee_rating_drink_type_pkey PRIMARY KEY (id),
	CONSTRAINT coffee_rating_drink_type_value_key UNIQUE (value)
);

INSERT INTO public.coffee_drink_type VALUES (1, 'Espresso');
INSERT INTO public.coffee_drink_type VALUES (2, 'Filter');

-- Users
CREATE TABLE public."user" (
	id bigserial NOT NULL,
	email text NOT NULL,
	CONSTRAINT pk_table_9_id PRIMARY KEY (id),
	CONSTRAINT user_email_key UNIQUE (email)
);

INSERT INTO public."user" VALUES (1, 'test@example.com');

-- Coffee ratings
CREATE TABLE public.coffee_rating (
	id bigserial NOT NULL,
	coffee_id bigint NOT NULL,
	user_id bigint NOT NULL,
	rating smallint NOT NULL,
	drink_type_id integer,
	CONSTRAINT pk_table_10_id PRIMARY KEY (id),
	CONSTRAINT coffee_rating_coffee_id_user_id_drink_type_id_key UNIQUE (coffee_id, user_id, drink_type_id),
	CONSTRAINT fk_coffee_rating_coffee_id_coffee_id FOREIGN KEY (coffee_id) REFERENCES public.coffee(id),
	CONSTRAINT fk_coffee_rating_user_id_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id),
	CONSTRAINT coffee_rating_drink_type_id_fkey FOREIGN KEY (drink_type_id) REFERENCES public.coffee_drink_type(id),
	CONSTRAINT coffee_rating_rating_check CHECK (((rating >= 0) AND (rating <= 10)))
);

INSERT INTO public.coffee_rating VALUES (1, 1, 1, 8, 1);  -- House Blend, 8/10, Espresso