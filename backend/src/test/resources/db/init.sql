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