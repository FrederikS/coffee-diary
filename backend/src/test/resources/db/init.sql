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