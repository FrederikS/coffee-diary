--
-- PostgreSQL database dump
--

\restrict TWbLPkNI8uv4XMsKDqfZEU5IXRfk3Smv1tQdN9pVrJD2LcVn1pHGB7hMTT7SehF

-- Dumped from database version 17.6 (Debian 17.6-2.pgdg11+1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-2.pgdg11+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: coffee_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee_type VALUES (1, 'Espresso');
INSERT INTO public.coffee_type VALUES (2, 'Omniroast');
INSERT INTO public.coffee_type VALUES (3, 'Filter');


--
-- Data for Name: roastery; Type: TABLE DATA; Schema: public; Owner: -
--

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


--
-- Data for Name: coffee; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee VALUES (19, 'Libelle Blend', 6, 1, 100, 0, 'Die milde Säure bringt die süßen Noten und die dunkle Schokoladennuance besonders gut zur Geltung. ', '$8.90', 'https://www.cafe-enrico.de/produkt/libelle-blend/', '2025-12-12 14:58:40.587625+01');
INSERT INTO public.coffee VALUES (1, 'Narino', 1, 1, 100, 0, 'Der Nariño ist ein vielschichtiger Espresso, mit Noten von Zitrus, Karamell, Mandel und Tee.', '$12.50', 'https://www.backyard-coffee.com/Narino-250g-Espresso-aus-Kolumbien/CX.NAR0250', '2025-11-12 19:13:56.096415+01');
INSERT INTO public.coffee VALUES (2, 'O''Malley', 1, 1, 100, 0, 'Mit Noten von Schokolade, würzigen Anklängen und Karamell', '$10.30', 'https://www.backyard-coffee.com/O-Malley-Espresso-aus-Kolumbien-und-Brasilien/CX.OM', '2025-11-12 19:24:41.043132+01');
INSERT INTO public.coffee VALUES (5, 'Ostrich', 2, 2, 100, 0, 'Noten von Earl Grey, Bergamotte, Blaubeere und Limette. Sehr süß mit ganz viel Toffee und Karamell. Herausragendes, seidiges Mundgefühl.', '$9.50', 'https://www.flyingroasters.de/en/shop/ostrich/', '2025-11-13 19:08:44.134733+01');
INSERT INTO public.coffee VALUES (4, 'Blackcap', 2, 1, 100, 0, 'Ganz viel Schokolade und Kakao, gepaart mit Schwarzer Johannisbeere. Im Cappuccino erinnert er an Schokoladenpudding.', '$8.80', 'https://www.flyingroasters.de/en/shop/blackcap-espresso/', '2025-11-13 18:52:59.088887+01');
INSERT INTO public.coffee VALUES (20, 'Honduras Capucas', 11, 1, 100, 0, 'Durch die „washed“-Aufbereitung entsteht ein besonders klarer, ausbalancierter Geschmack mit Noten von Buttercroissant, leichter Nuss und dezenter Süße.', '$11.40', 'https://www.torrefazione.de/product-page/espresso', '2026-01-28 18:11:39.517838+01');
INSERT INTO public.coffee VALUES (3, 'Nightingale', 2, 1, 80, 20, 'Leichte Fruchtnoten mit einer großen Portion Bitterschokolade und gerösteter Haselnuss. Der Nightingale hat einen vollen Körper und eignet sich mit seiner erstklassigen Crèma insbesondere für Milchgetränke.', '$8.80', 'https://www.flyingroasters.de/en/shop/nightingale-espresso/', '2025-11-13 18:18:49.311546+01');
INSERT INTO public.coffee VALUES (6, 'White Elephant', 3, 1, 0, 100, 'Durch die lange und helle Röstung entsteht ein milder, säurearmer Espresso mit schokoladigen, süßen Noten, die an ''Milky Way'' erinnern.', '$8.90', 'https://www.schramms-kaffee.de/products/white-elephant-indian-robusta', '2025-12-12 12:54:54.364728+01');
INSERT INTO public.coffee VALUES (7, 'Ufergold', 4, 1, 100, 0, 'Dabei entsteht ein mittlerer Körper, cremig und ausbalanciert mit süßen Aromen wie Milchschokolade, Mandel, Honig und feinen Fruchtnoten.', '$10.90', 'https://www.kabo-kaffee.de/collections/espresso/products/espresso-ufergold', '2025-12-12 13:05:51.729531+01');
INSERT INTO public.coffee VALUES (8, 'Mr. Toi', 4, 1, 0, 100, 'Nuß-Nougat, Rum-Traube, krägftig & würzig', '$14.90', 'https://www.kabo-kaffee.de/collections/espresso/products/mr-toi', '2025-12-12 13:10:07.450467+01');
INSERT INTO public.coffee VALUES (9, 'Tiefgang', 4, 1, 0, 100, 'Geschmacklich überzeugt unser Tiefgang Espresso durch eine würzig-nussige Note, eine absolute Klarheit in der Tasse und einen samtig-vollmundigen Abgang.', '$12.90', 'https://www.kabo-kaffee.de/collections/espresso/products/espresso-tiefgang', '2025-12-12 13:13:58.019591+01');
INSERT INTO public.coffee VALUES (10, 'Winter Edition 2023/24', 4, 1, 100, 0, 'Maronen, dunkle Beeren und wuerzige Suesse', '$14.90', 'https://www.kabo-kaffee.de/collections/espresso', '2025-12-12 13:33:56.352346+01');
INSERT INTO public.coffee VALUES (12, 'Berliner Schnauze', 5, 1, 80, 20, 'Mit Noten von Mandel und dunkler Schokolade und einem leicht spritzigen Abgang hat er alles, was einen vielschichtigen Espresso ausmachen sollte. ', '$10.90', 'https://www.toms-kaffeeroesterei.de/produktseite/berliner-schnauze', '2025-12-12 13:43:49.307107+01');
INSERT INTO public.coffee VALUES (13, 'Honduras', 6, 1, 100, 0, 'Die geringe Säure bringt die warmen Aromen von Zimt und Karamell besonders gut zur Geltung, während Beeren- und Zitrusnoten dem Geschmack eine frische Wendung verleihen.', '$10.90', 'https://www.cafe-enrico.de/produkt/honduras-organic/', '2025-12-12 13:48:47.967496+01');
INSERT INTO public.coffee VALUES (14, 'Malabar', 7, 1, 100, 0, 'Sein vollmundiger Geschmack mit Noten von Kakao, Nuss und dezent floralen und kräuterigen Nuancen kommt besonders gut im Siebträger, Espressokocher oder Vollautomaten zur Geltung.', '$8.90', 'https://mykona.de/produkt/espresso-malabar-monsooned-ab-2490e-1kg-exkl-versandkosten/', '2025-12-12 13:55:29.580993+01');
INSERT INTO public.coffee VALUES (15, 'Guatemala SHB', 8, 2, 100, 0, 'Ein Kaffee mit schönen Macadamia- und Nektarinen-Noten.', '$8.00', 'https://www.ridders-roesterei.de/Guatemala-SHB::143.html', '2025-12-12 14:05:37.93671+01');
INSERT INTO public.coffee VALUES (16, 'Berlin', 9, 1, 100, 0, 'Dank seiner nussigen und würzigen Noten mit Anklängen von Kakao und Karamell eignet er sich ideal für Zubereitungen im Siebträger, Espressokocher oder Vollautomaten.', '$10.00', 'https://zazza-kaffee.de/product/berlin/', '2025-12-12 14:10:26.611258+01');
INSERT INTO public.coffee VALUES (17, 'Classico', 10, 1, 85, 15, 'Mit seiner cremig-nussigen Textur und vielschichtigen Persönlichkeit vereint er Bohnen aus Brasilien, Honduras und Indien zu einem harmonischen Geschmackserlebnis.', '$10.80', 'https://blauebohne.com/shop/classico/', '2025-12-12 14:16:31.530825+01');
INSERT INTO public.coffee VALUES (18, '60/40', 5, 1, 60, 40, 'Ein mittelkräftiger, schokoladiger Espresso mit einer sehr überzeugenden Crema und einem vollmundigen Körper. ', '$10.50', 'https://www.toms-kaffeeroesterei.de/produktseite/60-40', '2025-12-12 14:55:04.782623+01');
INSERT INTO public.coffee VALUES (21, 'KIZ BARmischung', 7, 1, 70, 30, 'Ein ausdrucksstarker Espresso-Blend mit Charakter: Die KIZ BARmischung vereint 70 % Arabica und 30 % monsooned Robusta aus Brasilien, Indien und Sumatra. Würzige Noten und Kakaoaromen sorgen für ein kräftiges Profil, das sich hervorragend für milchbasierte Kaffeespezialitäten eignet.', '$8.90', 'https://mykona.de/produkt/espresso-kiz-barmischung-70-30-ab-2490e-1kg-exkl-versandkosten/', '2026-01-28 18:24:18.342904+01');
INSERT INTO public.coffee VALUES (32, 'Power Choc Blend', 13, 1, 80, 20, 'Vollmundig und Stark: Diese Mischung vereint die schokoladigen Noten des brasilianischen Arabica mit der Stärke des indischen Robusta, was sie perfekt für Espresso-Liebhaber und Fans eines kräftigen Filterkaffees macht.', '$10.90', 'https://kawam.eu/produkt/power-choc-blend/', '2026-02-23 11:40:44.706982+01');
INSERT INTO public.coffee VALUES (40, 'Berlin', 10, 2, 100, 0, 'Klassische Noten von Schokolade und Nüssen, fein ausbalanciert von einer spritzig-leichten, zitrischen Säure. Die vielfältigen Aromen in der Röstung eignen sich perfekt für jede Menge Experimente. So wird aus einem cleanen, fruchtig-frischen Espresso schnell ein Filterkaﬀee mit einer angenehm milden Säure und warmen Untertönen (die manche an Nussnuancen erinnern).', '$12.10', 'https://blauebohne.com/shop/berlin/', '2026-02-23 11:53:24.98039+01');
INSERT INTO public.coffee VALUES (48, 'Brasil Santos', 5, 2, 100, 0, 'Geschmacklich präsentiert sich der Brasil Santos ausgewogen und weich. Noten von Schokolade und Kakao stehen im Vordergrund, begleitet von einem mittleren Körper und einer nur sehr dezent wahrnehmbaren Säure. Der mittlere Röstgrad unterstützt die runde Struktur und sorgt für ein stimmiges Gesamtbild ohne dominante Spitzen.', '$10.50', 'https://toms-kaffeeroesterei.de/products/brasil-santos/', '2026-02-23 12:02:48.486329+01');
INSERT INTO public.coffee VALUES (56, 'Synthese Blend 50/50', 6, 1, 50, 50, 'Vollmundiger, ausgewogener Geschmack, Zimt und Karamell.', '$7.90', 'https://www.cafe-enrico.de/produkt/synthese-blend-kaffee/', '2026-02-23 12:08:22.041203+01');
INSERT INTO public.coffee VALUES (64, 'Kawa Robust', 13, 1, 0, 100, 'Kräftig. Schokoladig. Pure Robusta Power. Die Tasse überzeugt mit ultra starker Struktur, dunkler Schokolade und feinen Rum-Noten – ein Kaffee, der Eindruck hinterlässt und ideal für Espresso oder als kräftiger Start in den Tag geeignet ist.', '$8.90', 'https://kawam.eu/produkt/kawa-robust/', '2026-02-23 12:12:21.449194+01');
INSERT INTO public.coffee VALUES (72, 'Mococa Fazenda', 7, 1, 100, 0, 'Prozess: natural fermented; Röstung: light Roast; Geschmack: mild, blumig, weich, süße Kakaonote mit milchigem touch', '$8.90', 'https://mykona.de/produkt/brasilien-mococa-fazenda-pinheiro-ab-3290-1kg-exkl-versandkosten/', '2026-02-23 12:18:51.048361+01');
INSERT INTO public.coffee VALUES (80, 'Rio de Janeiro', 9, 3, 100, 0, 'Filter-Röstung aus 100% Arabica-Bohnen – Schokolade, Nuss, Honig. Säurearm und besonders magenschonend.', '$10.00', 'https://zazza-kaffee.de/product/rio-de-janeiro/', '2026-02-23 12:22:48.482349+01');
INSERT INTO public.coffee VALUES (89, 'Blend 60/40', 13, 2, 60, 40, 'Eine perfekte Fusion von reichen, schokoladig-nussigen Aromen aus sorgfältig ausgewählten Bohnen. Eine Premium-Mischung für alle, die herausragenden Geschmack schätzen. Ob Espresso oder starker schwarzer Kaffee – KAWA Blend 60/40 liefert ein vollmundiges Erlebnis mit einer seidigen Crema und tiefem, befriedigendem Geschmack.', '$10.90', 'https://kawam.eu/produkt/kawa-espresso-blend-60-40-stark-arabica-robusta-brasilien-indien/', '2026-02-23 12:26:42.946585+01');
INSERT INTO public.coffee VALUES (98, 'Friedenauer Sumagu', 8, 3, 100, 0, 'Der Friedenauer Sumagu ist so etwas wie unsere Hausmischung bei den Kaffeesorten. In ihm vereinen sich Kaffees aus Brasilien, Indien und Guatemala zu einem säurearmen Arabica-Blend, der mittelkräftig schmeckt. ', '$8.00', 'https://www.ridders-roesterei.de/Kaffee-Espresso/Kaffee/Deutschland/Friedenauer-Sumagu::144.html', '2026-02-23 12:30:57.799671+01');
INSERT INTO public.coffee VALUES (106, 'Robusta Uganda', 11, 3, 0, 100, '100% Robusta AB aus Uganda. Das Zusammenspiel aus Höhenlage und traditionellem Anbau verleiht diesem Filterkaffee  seine besondere Intensität und Charakterstärke.', '$7.20', 'https://www.torrefazione.de/product-page/filterkaffee', '2026-02-23 12:38:52.700033+01');
INSERT INTO public.coffee VALUES (114, 'Espresso di Jolina', 15, 1, 100, 0, 'Der Espresso di Jolina überzeugt mit seinem ausgewogenen, schokoladigen Aroma und wenig Säure. Sein volles, anhaltendes Aroma macht ihn ideal für einen intensiven Espresso-Genuss. Perfekt auch als Geschmacksträger für Flat White, Cappuccino, Latte oder andere Milchmischgetränke.', '$10.50', 'https://havelbohne.de/products/espresso-di-jolina', '2026-02-24 13:39:58.159+01');
INSERT INTO public.coffee VALUES (124, '100% Arabica', 17, 2, 100, 0, 'Es ist ein aromatischer Kaffee, ausgewogen und rund am Gaumen mit Aromen von Vanille, Milchschokolade und Gewürznelken. ', '$7.50', 'https://www.caffevergnano.de/products/', '2026-02-24 13:48:47.418469+01');
INSERT INTO public.coffee VALUES (132, 'Espresso Nocciola', 3, 1, 100, 0, 'Diese ausgewählte Kaffeemischung hochwertiger, entkoffeinierter und biozertifizierter Arabicas entfaltet durch die mittelkräftige bis kräftige Röstung ein feines nussiges Aroma. Die Entkoffeinierung geschieht nach der aromaschonenden "Mountain Water Process" Methode ausschließlich mit Wasser.', '$9.90', 'https://www.schramms-kaffee.de/collections/espresso/products/espresso-nocciola-schonend-mit-wasser-entkoffeiniert', '2026-02-24 13:53:40.940832+01');
INSERT INTO public.coffee VALUES (141, 'Flaute', 4, 1, 100, 0, 'Mittelkräftig, wenig Säure, Vollmilchschokolade, Nuss', '$14.90', 'https://www.kabo-kaffee.de/collections/entkoffeinierter-kaffee/products/entkoffeiniert-flaute', '2026-02-24 13:57:30.785305+01');
INSERT INTO public.coffee VALUES (149, 'Espresso Entkoffeiniert', 19, 1, 100, 0, 'Der mitteldunkle Röstgrad sorgt für eine elegante Balance zwischen Tiefe und feiner Würze. In der Tasse entfalten sich schokoladige Kakao-Noten, begleitet von röstigem Toast, würzigen Anklängen von Zimt und Süßholz sowie einer dezenten Nuance von schwarzem Tee. Das Aromaprofil wirkt angenehm süßlich und mit rundem Körper, ausgewogener Struktur und klarem, ausgewogenem Nachgeschmack. Die dezente Fruchtigkeit bleibt im Hintergrund und unterstreicht die harmonische Gesamtbalance.', '$8.95', 'https://shop.berliner-kaffeeroesterei.de/espresso-entkoffeiniert-1060902', '2026-02-24 14:02:51.036025+01');
INSERT INTO public.coffee VALUES (157, 'Sleepy Owl', 2, 1, 100, 0, 'Kräftig mit geringer Säure, Aromen von Nüssen und Schokolade mit feinen Noten von dunklem Nougat und Cognac.', '$9.50', 'https://www.flyingroasters.de/en/shop/decaf-espresso/', '2026-02-24 14:08:08.862555+01');
INSERT INTO public.coffee VALUES (166, 'Hummingbird', 2, 1, 100, 0, 'Ein mittelstark gerösteter Single-Origin-Espresso, so lebendig wie ein Kolibri. Sein nussiges Aroma kommt im Cappuccino besonders gut zur Geltung. Hummingbird wird Ihr treuer Begleiter sein, der Ihnen den Morgen versüßt. Aromen von vielen roten Beeren, süß mit Nüssen und Nougat.

', '$8.90', 'https://www.flyingroasters.de/en/shop/hummingbird-espresso/', '2026-02-24 14:11:50.059867+01');
INSERT INTO public.coffee VALUES (175, 'Jocotoco', 2, 1, 100, 0, 'Noten von Milchschokolade, Vanille, roten Beeren und Marzipan. Toller Nachgeschmack und schön cremige Textur.', '$9.60', 'https://www.flyingroasters.de/shop/espresso-jocotoco/', '2026-03-31 12:59:54.666907+02');
INSERT INTO public.coffee VALUES (184, 'Napcap', 2, 1, 100, 0, 'Ein Espresso-Blend mit 40 % weniger Koffein. Ganz viel Nuß, Schokolade und Kakao, gepaart mit Schwarzer Johannisbeere. Im Cappuccino erinnert er an Schokoladenpudding.', '$10.20', 'https://www.flyingroasters.de/shop/napcap/', '2026-03-31 13:03:44.130092+02');
INSERT INTO public.coffee VALUES (192, 'Supremo BIO', 19, 1, 80, 20, 'Dieser Espresso zeichnet sich durch eine sehr gute karamellige Interaktion mit Milch aus: Im Cappuccino bleibt er dank seiner kräftigen Würze sichtbar, geht aber mit der Milch trotzdem eine sehr harmonische Verbindung ein. Im Latte macchiato fügt er sich vollständig ein, und es entsteht ein wunderbar abgerundeter feiner Mokka-Geschmack.', '$8.95', 'https://shop.berliner-kaffeeroesterei.de/espresso-supremo-bio-1060202', '2026-04-19 12:34:12.965236+02');
INSERT INTO public.coffee VALUES (200, 'Äthiopien Waldespresso BIO', 19, 1, 100, 0, 'In der Tasse zeigt sich der Bio Espresso kräftig und rund. Noten von Vanille, Melasse und Zartbitterschokolade prägen sein Profil und sorgen für eine ausgewogene Kombination aus Süße, feiner Bitterkeit und Tiefe. So entsteht ein Espresso mit viel Charakter, der intensiv wirkt und zugleich angenehm weich bleibt.

Durch seinen mittel dunklen Röstgrad eignet sich der Äthiopien Waldespresso Bio ideal für die Zubereitung im Kaffeevollautomaten, im Siebträger und im Herdkännchen. Als Espresso überzeugt er mit dichtem, aromatischem Körper. In Cappuccino oder anderen Milchgetränken bleibt sein schokoladiges und karamelliges Profil klar präsent.', '$9.95', 'https://shop.berliner-kaffeeroesterei.de/aethiopien-waldespresso-bio-1011702', '2026-04-19 12:42:31.147617+02');


--
-- Data for Name: coffee_drink_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee_drink_type VALUES (1, 'Latte');
INSERT INTO public.coffee_drink_type VALUES (2, 'Filter');


--
-- Data for Name: bialetti_brewing_instruction; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bialetti_brewing_instruction VALUES (1, 1, 9.0, 65, 1, 1, 120);
INSERT INTO public.bialetti_brewing_instruction VALUES (3, 2, 8.5, 65, 1, 1, 120);
INSERT INTO public.bialetti_brewing_instruction VALUES (5, 3, 8.0, 60, 1, 1, 120);
INSERT INTO public.bialetti_brewing_instruction VALUES (2, 1, 18.0, 85, 2, 1, 240);
INSERT INTO public.bialetti_brewing_instruction VALUES (4, 2, 19.0, 85, 2, 1, 240);
INSERT INTO public.bialetti_brewing_instruction VALUES (6, 3, 16.0, 80, 2, 1, 240);
INSERT INTO public.bialetti_brewing_instruction VALUES (7, 4, 8.0, 60, 1, 1, 120);
INSERT INTO public.bialetti_brewing_instruction VALUES (8, 4, 16.0, 80, 2, 1, 240);
INSERT INTO public.bialetti_brewing_instruction VALUES (9, 5, 10.0, 80, 1, 1, 120);
INSERT INTO public.bialetti_brewing_instruction VALUES (10, 5, 20.0, 105, 2, 1, 240);
INSERT INTO public.bialetti_brewing_instruction VALUES (16, 175, 17.5, 85, 2, 1, 190);
INSERT INTO public.bialetti_brewing_instruction VALUES (20, 175, 8.8, 65, 1, 1, 105);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.country VALUES (1, 'Kolumbien', NULL);
INSERT INTO public.country VALUES (2, 'Brasilien', NULL);
INSERT INTO public.country VALUES (3, 'Honduras', NULL);
INSERT INTO public.country VALUES (4, 'Guatemala', NULL);
INSERT INTO public.country VALUES (5, 'Uganda', NULL);
INSERT INTO public.country VALUES (6, 'Peru', NULL);
INSERT INTO public.country VALUES (7, 'Sumatra', NULL);
INSERT INTO public.country VALUES (8, 'Ethopien', NULL);
INSERT INTO public.country VALUES (9, 'Indien', NULL);
INSERT INTO public.country VALUES (10, 'Vietnam', NULL);
INSERT INTO public.country VALUES (11, 'Nicaragua', NULL);
INSERT INTO public.country VALUES (12, 'Aethopien', NULL);
INSERT INTO public.country VALUES (13, 'Mexiko', NULL);
INSERT INTO public.country VALUES (14, 'Indonesien', NULL);


--
-- Data for Name: coffee_country; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee_country VALUES (1, 1, 1);
INSERT INTO public.coffee_country VALUES (2, 2, 1);
INSERT INTO public.coffee_country VALUES (3, 2, 2);
INSERT INTO public.coffee_country VALUES (4, 3, 3);
INSERT INTO public.coffee_country VALUES (5, 3, 4);
INSERT INTO public.coffee_country VALUES (6, 3, 5);
INSERT INTO public.coffee_country VALUES (7, 4, 6);
INSERT INTO public.coffee_country VALUES (8, 4, 4);
INSERT INTO public.coffee_country VALUES (9, 4, 7);
INSERT INTO public.coffee_country VALUES (10, 5, 8);
INSERT INTO public.coffee_country VALUES (11, 6, 9);
INSERT INTO public.coffee_country VALUES (12, 7, 2);
INSERT INTO public.coffee_country VALUES (13, 8, 10);
INSERT INTO public.coffee_country VALUES (14, 9, 10);
INSERT INTO public.coffee_country VALUES (15, 10, 5);
INSERT INTO public.coffee_country VALUES (16, 12, 1);
INSERT INTO public.coffee_country VALUES (17, 12, 3);
INSERT INTO public.coffee_country VALUES (18, 12, 9);
INSERT INTO public.coffee_country VALUES (19, 13, 3);
INSERT INTO public.coffee_country VALUES (20, 14, 9);
INSERT INTO public.coffee_country VALUES (21, 15, 4);
INSERT INTO public.coffee_country VALUES (22, 16, 2);
INSERT INTO public.coffee_country VALUES (23, 16, 9);
INSERT INTO public.coffee_country VALUES (24, 16, 7);
INSERT INTO public.coffee_country VALUES (25, 16, 1);
INSERT INTO public.coffee_country VALUES (26, 16, 4);
INSERT INTO public.coffee_country VALUES (27, 16, 11);
INSERT INTO public.coffee_country VALUES (28, 17, 2);
INSERT INTO public.coffee_country VALUES (29, 17, 3);
INSERT INTO public.coffee_country VALUES (30, 17, 9);
INSERT INTO public.coffee_country VALUES (31, 18, 2);
INSERT INTO public.coffee_country VALUES (32, 18, 9);
INSERT INTO public.coffee_country VALUES (33, 19, 4);
INSERT INTO public.coffee_country VALUES (34, 19, 2);
INSERT INTO public.coffee_country VALUES (35, 19, 12);
INSERT INTO public.coffee_country VALUES (36, 20, 3);
INSERT INTO public.coffee_country VALUES (37, 21, 2);
INSERT INTO public.coffee_country VALUES (38, 21, 7);
INSERT INTO public.coffee_country VALUES (39, 21, 9);
INSERT INTO public.coffee_country VALUES (40, 32, 2);
INSERT INTO public.coffee_country VALUES (41, 32, 9);
INSERT INTO public.coffee_country VALUES (42, 40, 3);
INSERT INTO public.coffee_country VALUES (43, 40, 8);
INSERT INTO public.coffee_country VALUES (44, 48, 2);
INSERT INTO public.coffee_country VALUES (45, 56, 3);
INSERT INTO public.coffee_country VALUES (46, 56, 2);
INSERT INTO public.coffee_country VALUES (47, 56, 4);
INSERT INTO public.coffee_country VALUES (48, 64, 10);
INSERT INTO public.coffee_country VALUES (49, 72, 2);
INSERT INTO public.coffee_country VALUES (50, 80, 2);
INSERT INTO public.coffee_country VALUES (51, 89, 2);
INSERT INTO public.coffee_country VALUES (52, 89, 9);
INSERT INTO public.coffee_country VALUES (53, 98, 2);
INSERT INTO public.coffee_country VALUES (54, 98, 9);
INSERT INTO public.coffee_country VALUES (55, 98, 4);
INSERT INTO public.coffee_country VALUES (56, 106, 5);
INSERT INTO public.coffee_country VALUES (57, 114, 6);
INSERT INTO public.coffee_country VALUES (58, 114, 1);
INSERT INTO public.coffee_country VALUES (59, 114, 13);
INSERT INTO public.coffee_country VALUES (60, 157, 3);
INSERT INTO public.coffee_country VALUES (61, 166, 6);
INSERT INTO public.coffee_country VALUES (62, 175, 1);
INSERT INTO public.coffee_country VALUES (63, 184, 6);
INSERT INTO public.coffee_country VALUES (64, 184, 4);
INSERT INTO public.coffee_country VALUES (65, 184, 7);
INSERT INTO public.coffee_country VALUES (66, 192, 14);
INSERT INTO public.coffee_country VALUES (67, 192, 3);
INSERT INTO public.coffee_country VALUES (68, 192, 9);
INSERT INTO public.coffee_country VALUES (69, 200, 12);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.image VALUES (3, 'https://www.flyingroasters.de/wp-content/uploads/2020/08/Nightingale_Espresso_italienisch-1-scaled.jpg', '{"uri": "s3://mathesar/fdk/20260418-115256002605/Nightingale_Espresso_italienisch-1-scaled.jpg", "mash": "039e979cd662192af208fa5a54f4b9e9daa4f028bda759ab8f7290739d217fe8"}', 'Flying Roasters - Nightingale Frontantsicht');
INSERT INTO public.image VALUES (6, 'https://www.flyingroasters.de/wp-content/uploads/2020/08/Kraeftiger_Espresso_Blackcap-scaled.jpg', '{"uri": "s3://mathesar/fdk/20260418-115755277590/Kraeftiger_Espresso_Blackcap-scaled.jpg", "mash": "4c78ef226c1926805850ebbf5b952d44c29d34bca8eb43b4f49ff82a25d6c347"}', 'Flying Roasters - Blackcap Frontansicht');
INSERT INTO public.image VALUES (12, 'https://www.flyingroasters.de/wp-content/uploads/2024/09/Flying-Roasters-1215-scaled.jpg', '{"uri": "s3://mathesar/fdk/20260418-130147767010/Flying-Roasters-1215-scaled.jpg", "mash": "e9a957fa4d56af2d70d3e401c494acf0c5a5ed90efb2efeab89eeae09a7886ca"}', 'Flying Roasters - Kaffeeladen Hochstr. 34');
INSERT INTO public.image VALUES (16, 'https://www.flyingroasters.de/wp-content/uploads/2026/01/Flying-Roasters-Kreuzberg-Kaffee-kaufen-Gebaeck-32-scaled.jpg', '{"uri": "s3://mathesar/fdk/20260418-130256661053/Flying-Roasters-Kreuzberg-Kaffee-kaufen-Gebaeck-32-scaled.jpg", "mash": "524738ce5cf618720396b9d7bacefd28ddb6973ea10e049adca673377b9a7273"}', 'Flying Roasters - Kaffeeladen Gneisenaustr. 85');
INSERT INTO public.image VALUES (20, 'https://www.berliner-kaffeeroesterei.de/wp-content/uploads/2021/04/BKR_Exterior-k.jpg', '{"uri": "s3://mathesar/fdk/20260419-102606962080/BKR_Exterior-k.jpg", "mash": "77d7b05378e789b14e7e0c352f7f5e629d22c2c8b6891ecfe7cb62b61755ba32"}', 'BKR - Kaffeeladen Uhlandstr.');
INSERT INTO public.image VALUES (25, 'https://shop.berliner-kaffeeroesterei.de/media/3c/06/4c/1733761528/1060202-0.jpg', '{"uri": "s3://mathesar/fdk/20260419-103047009404/BKR_Supremo_Front.jpg", "mash": "62f51311b92b812b12adfa584ebfe058917d1ddbbc561b0fe13316121bdd41af"}', 'BKR - Espresso Supremo Frontansicht');
INSERT INTO public.image VALUES (29, 'https://shop.berliner-kaffeeroesterei.de/media/95/6c/98/1733761528/1060202-1.jpg', '{"uri": "s3://mathesar/fdk/20260419-103139017204/BKR_Supremo_Back.jpg", "mash": "cf253e8b397b18997d51a77cf5f8f8a332cd6e12c891289f3d7e6c1b8295c543"}', 'BKR - Espresso Supremo Rückansicht');
INSERT INTO public.image VALUES (33, 'https://shop.berliner-kaffeeroesterei.de/media/5c/7f/52/1747402130/1011707-0.jpg', '{"uri": "s3://mathesar/fdk/20260419-103844563683/BKR_Waldespresso_Front.jpg", "mash": "7bc9362860b972f5a55d9c012cce757bcc3893fb59370d26b28afb82fc8565e5"}', 'BKR - Waldespresso Frontansicht');
INSERT INTO public.image VALUES (37, 'https://shop.berliner-kaffeeroesterei.de/media/ae/ea/de/1747402130/1011707-1.jpg', '{"uri": "s3://mathesar/fdk/20260419-103945003596/BKR_Waldespresso_Back.jpg", "mash": "b8d676f4adbb9617e297c2d00f24b84e4c38a20eb95127313c0caa4f84a499aa"}', 'BKR - Waldespresso Rückansicht');


--
-- Data for Name: coffee_image; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee_image VALUES (1, 3, 3, 0);
INSERT INTO public.coffee_image VALUES (2, 4, 6, 0);
INSERT INTO public.coffee_image VALUES (3, 192, 25, 0);
INSERT INTO public.coffee_image VALUES (4, 192, 29, 1);
INSERT INTO public.coffee_image VALUES (5, 200, 33, 0);
INSERT INTO public.coffee_image VALUES (6, 200, 37, 1);


--
-- Data for Name: profile_tag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.profile_tag VALUES (1, 'Zitrus');
INSERT INTO public.profile_tag VALUES (2, 'Karamell');
INSERT INTO public.profile_tag VALUES (3, 'Mandel');
INSERT INTO public.profile_tag VALUES (4, 'Tee');
INSERT INTO public.profile_tag VALUES (5, 'Schokolade');
INSERT INTO public.profile_tag VALUES (6, 'Wuerzig');
INSERT INTO public.profile_tag VALUES (7, 'Fruchtnoten');
INSERT INTO public.profile_tag VALUES (8, 'Bitterschokolade');
INSERT INTO public.profile_tag VALUES (9, 'Haselnuss');
INSERT INTO public.profile_tag VALUES (11, 'Kakao');
INSERT INTO public.profile_tag VALUES (12, 'Earl Grey');
INSERT INTO public.profile_tag VALUES (13, 'Bergamotte');
INSERT INTO public.profile_tag VALUES (14, 'Limette');
INSERT INTO public.profile_tag VALUES (15, 'Toffee');
INSERT INTO public.profile_tag VALUES (10, 'Cassisnoten');
INSERT INTO public.profile_tag VALUES (16, 'Milchschokolade');
INSERT INTO public.profile_tag VALUES (17, 'Nuss-Nougat');
INSERT INTO public.profile_tag VALUES (18, 'Rum-Traube');
INSERT INTO public.profile_tag VALUES (19, 'Geroestete Nuesse');
INSERT INTO public.profile_tag VALUES (20, 'Marone');
INSERT INTO public.profile_tag VALUES (21, 'Dunkle Beeren');
INSERT INTO public.profile_tag VALUES (22, 'Dunkle Schokolade');
INSERT INTO public.profile_tag VALUES (23, 'Honig');
INSERT INTO public.profile_tag VALUES (24, 'Zimt');
INSERT INTO public.profile_tag VALUES (25, 'Beeren');
INSERT INTO public.profile_tag VALUES (26, 'Zitrone');
INSERT INTO public.profile_tag VALUES (27, 'Blumig');
INSERT INTO public.profile_tag VALUES (28, 'Herbal');
INSERT INTO public.profile_tag VALUES (29, 'Nussig');
INSERT INTO public.profile_tag VALUES (30, 'Makadamia');
INSERT INTO public.profile_tag VALUES (31, 'Nektarine');
INSERT INTO public.profile_tag VALUES (32, 'Erdig');
INSERT INTO public.profile_tag VALUES (33, 'Cremig');
INSERT INTO public.profile_tag VALUES (34, 'Buttercroissant');
INSERT INTO public.profile_tag VALUES (35, 'Erdnuss');
INSERT INTO public.profile_tag VALUES (36, 'Rum');
INSERT INTO public.profile_tag VALUES (37, 'Milch');
INSERT INTO public.profile_tag VALUES (38, 'Exotisch');
INSERT INTO public.profile_tag VALUES (39, 'Vanille');
INSERT INTO public.profile_tag VALUES (40, 'Gewürznelke');
INSERT INTO public.profile_tag VALUES (41, 'Walnusslikör');
INSERT INTO public.profile_tag VALUES (42, 'Toastbrot');
INSERT INTO public.profile_tag VALUES (43, 'Süßholz');
INSERT INTO public.profile_tag VALUES (44, 'Schwarzer Tee');
INSERT INTO public.profile_tag VALUES (45, 'Cognac');
INSERT INTO public.profile_tag VALUES (46, 'Rote Beeren');
INSERT INTO public.profile_tag VALUES (47, 'Marzipan');
INSERT INTO public.profile_tag VALUES (48, 'Schwarze Johannisbeere');
INSERT INTO public.profile_tag VALUES (49, 'Honigmelone');
INSERT INTO public.profile_tag VALUES (50, 'Melasse');


--
-- Data for Name: coffee_profile_tag; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee_profile_tag VALUES (1, 1, 1);
INSERT INTO public.coffee_profile_tag VALUES (2, 1, 2);
INSERT INTO public.coffee_profile_tag VALUES (3, 1, 3);
INSERT INTO public.coffee_profile_tag VALUES (4, 1, 4);
INSERT INTO public.coffee_profile_tag VALUES (5, 2, 5);
INSERT INTO public.coffee_profile_tag VALUES (6, 2, 6);
INSERT INTO public.coffee_profile_tag VALUES (7, 2, 2);
INSERT INTO public.coffee_profile_tag VALUES (8, 3, 7);
INSERT INTO public.coffee_profile_tag VALUES (9, 3, 8);
INSERT INTO public.coffee_profile_tag VALUES (10, 3, 9);
INSERT INTO public.coffee_profile_tag VALUES (11, 4, 5);
INSERT INTO public.coffee_profile_tag VALUES (12, 4, 11);
INSERT INTO public.coffee_profile_tag VALUES (13, 4, 10);
INSERT INTO public.coffee_profile_tag VALUES (14, 5, 12);
INSERT INTO public.coffee_profile_tag VALUES (15, 5, 13);
INSERT INTO public.coffee_profile_tag VALUES (16, 5, 14);
INSERT INTO public.coffee_profile_tag VALUES (17, 5, 15);
INSERT INTO public.coffee_profile_tag VALUES (18, 5, 2);
INSERT INTO public.coffee_profile_tag VALUES (19, 6, 5);
INSERT INTO public.coffee_profile_tag VALUES (20, 7, 16);
INSERT INTO public.coffee_profile_tag VALUES (21, 7, 3);
INSERT INTO public.coffee_profile_tag VALUES (22, 8, 17);
INSERT INTO public.coffee_profile_tag VALUES (23, 8, 18);
INSERT INTO public.coffee_profile_tag VALUES (24, 9, 19);
INSERT INTO public.coffee_profile_tag VALUES (25, 9, 11);
INSERT INTO public.coffee_profile_tag VALUES (26, 10, 20);
INSERT INTO public.coffee_profile_tag VALUES (27, 10, 21);
INSERT INTO public.coffee_profile_tag VALUES (28, 10, 6);
INSERT INTO public.coffee_profile_tag VALUES (29, 12, 3);
INSERT INTO public.coffee_profile_tag VALUES (30, 12, 22);
INSERT INTO public.coffee_profile_tag VALUES (31, 12, 23);
INSERT INTO public.coffee_profile_tag VALUES (32, 13, 2);
INSERT INTO public.coffee_profile_tag VALUES (33, 13, 24);
INSERT INTO public.coffee_profile_tag VALUES (34, 13, 25);
INSERT INTO public.coffee_profile_tag VALUES (35, 13, 26);
INSERT INTO public.coffee_profile_tag VALUES (36, 14, 27);
INSERT INTO public.coffee_profile_tag VALUES (37, 14, 28);
INSERT INTO public.coffee_profile_tag VALUES (38, 14, 11);
INSERT INTO public.coffee_profile_tag VALUES (39, 14, 29);
INSERT INTO public.coffee_profile_tag VALUES (40, 15, 30);
INSERT INTO public.coffee_profile_tag VALUES (41, 15, 31);
INSERT INTO public.coffee_profile_tag VALUES (42, 16, 6);
INSERT INTO public.coffee_profile_tag VALUES (43, 16, 32);
INSERT INTO public.coffee_profile_tag VALUES (44, 16, 29);
INSERT INTO public.coffee_profile_tag VALUES (45, 16, 2);
INSERT INTO public.coffee_profile_tag VALUES (46, 17, 29);
INSERT INTO public.coffee_profile_tag VALUES (47, 17, 33);
INSERT INTO public.coffee_profile_tag VALUES (48, 18, 5);
INSERT INTO public.coffee_profile_tag VALUES (49, 19, 22);
INSERT INTO public.coffee_profile_tag VALUES (50, 20, 34);
INSERT INTO public.coffee_profile_tag VALUES (51, 20, 29);
INSERT INTO public.coffee_profile_tag VALUES (52, 20, 33);
INSERT INTO public.coffee_profile_tag VALUES (53, 21, 6);
INSERT INTO public.coffee_profile_tag VALUES (54, 21, 11);
INSERT INTO public.coffee_profile_tag VALUES (56, 32, 22);
INSERT INTO public.coffee_profile_tag VALUES (57, 40, 5);
INSERT INTO public.coffee_profile_tag VALUES (58, 40, 29);
INSERT INTO public.coffee_profile_tag VALUES (59, 40, 1);
INSERT INTO public.coffee_profile_tag VALUES (60, 48, 5);
INSERT INTO public.coffee_profile_tag VALUES (61, 48, 11);
INSERT INTO public.coffee_profile_tag VALUES (62, 56, 24);
INSERT INTO public.coffee_profile_tag VALUES (63, 56, 2);
INSERT INTO public.coffee_profile_tag VALUES (64, 64, 5);
INSERT INTO public.coffee_profile_tag VALUES (65, 64, 35);
INSERT INTO public.coffee_profile_tag VALUES (66, 64, 36);
INSERT INTO public.coffee_profile_tag VALUES (67, 72, 27);
INSERT INTO public.coffee_profile_tag VALUES (68, 72, 11);
INSERT INTO public.coffee_profile_tag VALUES (69, 72, 37);
INSERT INTO public.coffee_profile_tag VALUES (70, 80, 5);
INSERT INTO public.coffee_profile_tag VALUES (71, 80, 29);
INSERT INTO public.coffee_profile_tag VALUES (72, 80, 23);
INSERT INTO public.coffee_profile_tag VALUES (73, 89, 5);
INSERT INTO public.coffee_profile_tag VALUES (74, 89, 29);
INSERT INTO public.coffee_profile_tag VALUES (75, 98, 29);
INSERT INTO public.coffee_profile_tag VALUES (76, 106, 6);
INSERT INTO public.coffee_profile_tag VALUES (77, 106, 38);
INSERT INTO public.coffee_profile_tag VALUES (78, 114, 5);
INSERT INTO public.coffee_profile_tag VALUES (79, 124, 16);
INSERT INTO public.coffee_profile_tag VALUES (80, 124, 39);
INSERT INTO public.coffee_profile_tag VALUES (81, 124, 40);
INSERT INTO public.coffee_profile_tag VALUES (82, 124, 41);
INSERT INTO public.coffee_profile_tag VALUES (83, 132, 29);
INSERT INTO public.coffee_profile_tag VALUES (84, 141, 16);
INSERT INTO public.coffee_profile_tag VALUES (85, 141, 29);
INSERT INTO public.coffee_profile_tag VALUES (86, 149, 5);
INSERT INTO public.coffee_profile_tag VALUES (87, 149, 11);
INSERT INTO public.coffee_profile_tag VALUES (88, 149, 42);
INSERT INTO public.coffee_profile_tag VALUES (89, 149, 24);
INSERT INTO public.coffee_profile_tag VALUES (90, 149, 43);
INSERT INTO public.coffee_profile_tag VALUES (91, 149, 44);
INSERT INTO public.coffee_profile_tag VALUES (92, 157, 29);
INSERT INTO public.coffee_profile_tag VALUES (93, 157, 5);
INSERT INTO public.coffee_profile_tag VALUES (94, 157, 17);
INSERT INTO public.coffee_profile_tag VALUES (95, 157, 45);
INSERT INTO public.coffee_profile_tag VALUES (96, 166, 46);
INSERT INTO public.coffee_profile_tag VALUES (98, 166, 17);
INSERT INTO public.coffee_profile_tag VALUES (97, 166, 5);
INSERT INTO public.coffee_profile_tag VALUES (99, 175, 16);
INSERT INTO public.coffee_profile_tag VALUES (100, 175, 39);
INSERT INTO public.coffee_profile_tag VALUES (101, 175, 46);
INSERT INTO public.coffee_profile_tag VALUES (102, 175, 47);
INSERT INTO public.coffee_profile_tag VALUES (103, 184, 29);
INSERT INTO public.coffee_profile_tag VALUES (104, 184, 5);
INSERT INTO public.coffee_profile_tag VALUES (105, 184, 48);
INSERT INTO public.coffee_profile_tag VALUES (106, 192, 2);
INSERT INTO public.coffee_profile_tag VALUES (107, 192, 6);
INSERT INTO public.coffee_profile_tag VALUES (108, 192, 49);
INSERT INTO public.coffee_profile_tag VALUES (109, 200, 39);
INSERT INTO public.coffee_profile_tag VALUES (110, 200, 8);
INSERT INTO public.coffee_profile_tag VALUES (111, 200, 50);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."user" VALUES (1, 'bob@gmail.com');
INSERT INTO public."user" VALUES (2, 'alice@gmail.com');


--
-- Data for Name: coffee_rating; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.coffee_rating VALUES (1, 1, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (3, 1, 2, 5, 1);
INSERT INTO public.coffee_rating VALUES (4, 2, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (5, 3, 1, 9, 1);
INSERT INTO public.coffee_rating VALUES (7, 4, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (8, 4, 2, 8, 1);
INSERT INTO public.coffee_rating VALUES (9, 5, 1, 10, 1);
INSERT INTO public.coffee_rating VALUES (10, 5, 2, 10, 1);
INSERT INTO public.coffee_rating VALUES (11, 6, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (12, 6, 2, 9, 1);
INSERT INTO public.coffee_rating VALUES (13, 7, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (14, 7, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (15, 8, 1, 1, 1);
INSERT INTO public.coffee_rating VALUES (16, 8, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (17, 9, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (18, 9, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (19, 10, 1, 9, 1);
INSERT INTO public.coffee_rating VALUES (20, 10, 2, 9, 1);
INSERT INTO public.coffee_rating VALUES (21, 12, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (22, 12, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (23, 13, 1, 5, 1);
INSERT INTO public.coffee_rating VALUES (24, 13, 2, 4, 1);
INSERT INTO public.coffee_rating VALUES (25, 14, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (26, 14, 2, 8, 1);
INSERT INTO public.coffee_rating VALUES (27, 15, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (28, 15, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (29, 16, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (30, 16, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (31, 17, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (32, 17, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (33, 18, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (34, 18, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (35, 19, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (36, 19, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (6, 3, 2, 9, 1);
INSERT INTO public.coffee_rating VALUES (37, 20, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (38, 20, 2, 8, 1);
INSERT INTO public.coffee_rating VALUES (2, 2, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (39, 21, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (40, 21, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (43, 32, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (46, 32, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (49, 40, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (55, 40, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (66, 48, 1, 8, 2);
INSERT INTO public.coffee_rating VALUES (69, 48, 2, 8, 2);
INSERT INTO public.coffee_rating VALUES (78, 56, 1, 5, 1);
INSERT INTO public.coffee_rating VALUES (81, 56, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (84, 64, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (87, 64, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (90, 72, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (93, 72, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (96, 80, 1, 7, 2);
INSERT INTO public.coffee_rating VALUES (99, 80, 2, 7, 2);
INSERT INTO public.coffee_rating VALUES (102, 89, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (105, 89, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (108, 98, 1, 5, 2);
INSERT INTO public.coffee_rating VALUES (111, 98, 2, 6, 2);
INSERT INTO public.coffee_rating VALUES (114, 106, 1, 5, 2);
INSERT INTO public.coffee_rating VALUES (117, 106, 2, 5, 2);
INSERT INTO public.coffee_rating VALUES (132, 40, 1, 6, 2);
INSERT INTO public.coffee_rating VALUES (136, 40, 2, 6, 2);
INSERT INTO public.coffee_rating VALUES (139, 114, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (142, 114, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (145, 124, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (148, 124, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (151, 132, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (154, 132, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (157, 141, 1, 6, 1);
INSERT INTO public.coffee_rating VALUES (160, 141, 2, 6, 1);
INSERT INTO public.coffee_rating VALUES (163, 149, 1, 5, 1);
INSERT INTO public.coffee_rating VALUES (166, 149, 2, 5, 1);
INSERT INTO public.coffee_rating VALUES (169, 157, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (172, 157, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (175, 166, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (178, 166, 2, 7, 1);
INSERT INTO public.coffee_rating VALUES (184, 184, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (181, 175, 1, 8, 1);
INSERT INTO public.coffee_rating VALUES (187, 175, 2, 8, 1);
INSERT INTO public.coffee_rating VALUES (190, 192, 1, 7, 1);
INSERT INTO public.coffee_rating VALUES (193, 200, 1, 8, 1);


--
-- Data for Name: roastery_image; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roastery_image VALUES (1, 2, 12, 0);
INSERT INTO public.roastery_image VALUES (2, 2, 16, 1);


--
-- Name: bialetti_brewing_instruction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bialetti_brewing_instruction_id_seq', 20, true);


--
-- Name: coffee_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_country_id_seq', 69, true);


--
-- Name: coffee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_id_seq', 200, true);


--
-- Name: coffee_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_image_id_seq', 6, true);


--
-- Name: coffee_profile_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_profile_tag_id_seq', 111, true);


--
-- Name: coffee_rating_drink_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_rating_drink_type_id_seq', 2, true);


--
-- Name: coffee_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_rating_id_seq', 193, true);


--
-- Name: coffee_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.coffee_type_id_seq', 3, true);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.country_id_seq', 14, true);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.image_id_seq', 37, true);


--
-- Name: profile_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.profile_tag_id_seq', 50, true);


--
-- Name: roastery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roastery_id_seq', 19, true);


--
-- Name: roastery_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roastery_image_id_seq', 2, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

\unrestrict TWbLPkNI8uv4XMsKDqfZEU5IXRfk3Smv1tQdN9pVrJD2LcVn1pHGB7hMTT7SehF
