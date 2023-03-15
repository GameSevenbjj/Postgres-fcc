--
-- PostgreSQL database dump
--
 -- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;


SET lock_timeout = 0;


SET idle_in_transaction_session_timeout = 0;


SET client_encoding = 'UTF8';


SET standard_conforming_strings = on;


SELECT pg_catalog.set_config('search_path', '', false);


SET check_function_bodies = false;


SET xmloption = content;


SET client_min_messages = warning;


SET row_security = off;


DROP DATABASE universe;

--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe
SET statement_timeout = 0;


SET lock_timeout = 0;


SET idle_in_transaction_session_timeout = 0;


SET client_encoding = 'UTF8';


SET standard_conforming_strings = on;


SELECT pg_catalog.set_config('search_path', '', false);


SET check_function_bodies = false;


SET xmloption = content;


SET client_min_messages = warning;


SET row_security = off;


SET default_tablespace = '';


SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet ( comet_id integer NOT NULL,
                                             name character varying(20) NOT NULL,
                                                                        visible_to_planets boolean, speed integer, size_km_wide numeric);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy ( galaxy_id integer NOT NULL,
                                               name character varying(20) NOT NULL,
                                                                          age_in_lightyears integer NOT NULL,
                                                                                                    blackhole boolean, size_km_wide numeric);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon ( moon_id integer NOT NULL,
                                           name character varying(20) NOT NULL,
                                                                      size_km_wide numeric NOT NULL,
                                                                                           color text NOT NULL,
                                                                                                      age integer, planet_id integer);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet ( planet_id integer NOT NULL,
                                               name character varying(20) NOT NULL,
                                                                          age integer NOT NULL,
                                                                                      size_km_wide numeric, color text, inhabitable boolean, star_id integer);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star ( star_id integer NOT NULL,
                                           name character varying(20) NOT NULL,
                                                                      size_in_km_wide numeric NOT NULL,
                                                                                              age_in_lightyears integer NOT NULL,
                                                                                                                        moving boolean, galaxy_id integer);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq AS integer
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
ALTER COLUMN comet_id
SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);

--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet
VALUES (1,
        'Speedy',
        true,
        435636,
        3657465);


INSERT INTO public.comet
VALUES (2,
        'Destoyer',
        true,
        45746,
        457564455);


INSERT INTO public.comet
VALUES (3,
        'Rocky',
        false,
        5433,
        543474456);

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy
VALUES (1,
        'Milky Way',
        472,
        true,
        8874835433);


INSERT INTO public.galaxy
VALUES (2,
        'Bode',
        222,
        true,
        46982097892);


INSERT INTO public.galaxy
VALUES (3,
        'Cartwheel',
        231,
        true,
        9876234344);


INSERT INTO public.galaxy
VALUES (4,
        'Cigar',
        5433,
        true,
        89270489534);


INSERT INTO public.galaxy
VALUES (5,
        'Ramon',
        122,
        false,
        8496);


INSERT INTO public.galaxy
VALUES (6,
        'Max',
        1094,
        false,
        8983332);

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon
VALUES (1,
        'Warren',
        4324,
        'Black',
        345475,
        NULL);


INSERT INTO public.moon
VALUES (2,
        'Leda',
        3455,
        'Green',
        76543,
        NULL);


INSERT INTO public.moon
VALUES (3,
        'Nelly',
        4365654,
        'Purple',
        57543,
        NULL);


INSERT INTO public.moon
VALUES (4,
        'Leon',
        3455,
        'Red',
        34635,
        NULL);


INSERT INTO public.moon
VALUES (5,
        'Spart',
        57864443,
        'Yellow',
        2343,
        NULL);


INSERT INTO public.moon
VALUES (6,
        'Dart',
        67453,
        'Dark Blue',
        4573,
        NULL);


INSERT INTO public.moon
VALUES (7,
        'Ian',
        364745,
        'Tan',
        363,
        NULL);


INSERT INTO public.moon
VALUES (8,
        'Hercules',
        35645543,
        'Light brown',
        535,
        NULL);


INSERT INTO public.moon
VALUES (9,
        'Celtic',
        6432,
        'Green',
        54634,
        NULL);


INSERT INTO public.moon
VALUES (10,
        'Viking',
        34532,
        'Light gray',
        3464,
        NULL);


INSERT INTO public.moon
VALUES (11,
        'Peter',
        432324,
        'Black',
        45475,
        NULL);


INSERT INTO public.moon
VALUES (12,
        'Linda',
        335455,
        'Baby blue',
        6543,
        NULL);


INSERT INTO public.moon
VALUES (13,
        'Kelly',
        65654,
        'Light purple',
        7543,
        NULL);


INSERT INTO public.moon
VALUES (14,
        'King',
        333455,
        'Dark Red',
        4635,
        NULL);


INSERT INTO public.moon
VALUES (15,
        'Triangle',
        764443,
        'Light green',
        32343,
        NULL);


INSERT INTO public.moon
VALUES (16,
        'Darce',
        7453,
        'Blue',
        334573,
        NULL);


INSERT INTO public.moon
VALUES (17,
        'Kiki',
        745,
        'Pink',
        33363,
        NULL);


INSERT INTO public.moon
VALUES (18,
        'Joel',
        645543,
        'Brown',
        53533,
        NULL);


INSERT INTO public.moon
VALUES (19,
        'Goblin',
        432,
        'Dark Green',
        4634,
        NULL);


INSERT INTO public.moon
VALUES (20,
        'Willis',
        4532,
        'Gray',
        464,
        NULL);

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet
VALUES (1,
        'Earth',
        933784,
        464536343,
        'green',
        true,
        NULL);


INSERT INTO public.planet
VALUES (2,
        'Mars',
        453735,
        5376575,
        'Purple',
        true,
        NULL);


INSERT INTO public.planet
VALUES (3,
        'Pluto',
        4343645,
        3465,
        'blue',
        false,
        NULL);


INSERT INTO public.planet
VALUES (4,
        'Venus',
        455848,
        658375867645,
        'white',
        false,
        NULL);


INSERT INTO public.planet
VALUES (5,
        'Saturn',
        534654,
        3564746754645,
        'Brown',
        false,
        NULL);


INSERT INTO public.planet
VALUES (6,
        'Neptune',
        437655,
        35756753,
        'blue',
        false,
        NULL);


INSERT INTO public.planet
VALUES (7,
        'Heaven',
        3784,
        64536343,
        'green',
        true,
        NULL);


INSERT INTO public.planet
VALUES (8,
        'Hell',
        53735,
        376575,
        'Red',
        true,
        NULL);


INSERT INTO public.planet
VALUES (9,
        'Ocean',
        343645,
        465,
        'blue',
        false,
        NULL);


INSERT INTO public.planet
VALUES (10,
        'Bikini Bottom',
        55848,
        8375867645,
        'Neon',
        false,
        NULL);


INSERT INTO public.planet
VALUES (11,
        'King Kong',
        34654,
        3746754645,
        'Gray',
        false,
        NULL);


INSERT INTO public.planet
VALUES (12,
        'Mercury',
        4655,
        357563,
        'red',
        false,
        NULL);

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star
VALUES (1,
        'Crux',
        435643,
        53,
        true,
        NULL);


INSERT INTO public.star
VALUES (2,
        'Cancer',
        354,
        34564,
        true,
        NULL);


INSERT INTO public.star
VALUES (3,
        'Aries',
        245,
        43,
        false,
        NULL);


INSERT INTO public.star
VALUES (4,
        'Leo',
        45342,
        53645,
        true,
        NULL);


INSERT INTO public.star
VALUES (5,
        'Mochi',
        543,
        436534,
        true,
        NULL);


INSERT INTO public.star
VALUES (6,
        'Duke',
        54,
        65474,
        false,
        NULL);

--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);

--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ADD CONSTRAINT comet_name_key UNIQUE (name);

--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: galaxy galaxy_size_km_wide_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ADD CONSTRAINT galaxy_size_km_wide_key UNIQUE (size_km_wide);

--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_name_key UNIQUE (name);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_name_key UNIQUE (name);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_name_key UNIQUE (name);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ADD CONSTRAINT moon_planet_id_fkey
FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ADD CONSTRAINT planet_star_id_fkey
FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ADD CONSTRAINT star_galaxy_id_fkey
FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- PostgreSQL database dump complete
--
