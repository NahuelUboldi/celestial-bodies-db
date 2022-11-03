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
-- Name: constelation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constelation (
    constelation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    meaning character varying(50)
);


ALTER TABLE public.constelation OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelation_constelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelation_constelation_id_seq OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelation_constelation_id_seq OWNED BY public.constelation.constelation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constelation_id integer,
    meaning text,
    is_visible_to_naked_eye boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year_discovered integer,
    diameter_in_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    orbital_period_in_years numeric(5,2),
    rotation_period_in_days numeric(5,2),
    has_moon boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_in_light_years integer,
    brightness_of_star numeric(3,2),
    approval_date date
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constelation constelation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation ALTER COLUMN constelation_id SET DEFAULT nextval('public.constelation_constelation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constelation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constelation VALUES (1, 'Aquarius', NULL, 'Water-bearer');
INSERT INTO public.constelation VALUES (2, 'Aries', NULL, 'Ram');
INSERT INTO public.constelation VALUES (3, 'Bootes', NULL, 'Herdsman');
INSERT INTO public.constelation VALUES (4, 'Capricornus', NULL, 'Sea Goat');
INSERT INTO public.constelation VALUES (5, 'Centaurus', NULL, 'Centtaur');
INSERT INTO public.constelation VALUES (6, 'Cetus', NULL, 'Sea monster');
INSERT INTO public.constelation VALUES (7, 'gorelatine', 2045, 'morocotolore');
INSERT INTO public.constelation VALUES (8, 'bururu', 965, 'acarale');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward', 5, 'chisito into the morning', false);
INSERT INTO public.galaxy VALUES (2, 'Galorato', 3, 'caragelerotag', false);
INSERT INTO public.galaxy VALUES (3, 'Bulure', 2, 'Gargaroña molorateritre', true);
INSERT INTO public.galaxy VALUES (35, 'Gortrera', 1, 'Sandwitch de pollo', true);
INSERT INTO public.galaxy VALUES (36, 'Gastodare', 1, 'La nuca de Julian', false);
INSERT INTO public.galaxy VALUES (37, 'Avocado', 6, 'La sombrilla de las nueve', false);
INSERT INTO public.galaxy VALUES (38, 'Alaraca', 4, 'Colombina Che', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Moon', NULL, 3476, 13);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 23, 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 13, 2);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 3630, 9);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 5262, 7);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 3138, 7);
INSERT INTO public.moon VALUES (8, 'Callisto', 1610, 4800, 5);
INSERT INTO public.moon VALUES (9, 'Amalthea', 1892, 200, 5);
INSERT INTO public.moon VALUES (10, 'Himalia', 1904, 170, 5);
INSERT INTO public.moon VALUES (11, 'Thebe', 1610, 4800, 4);
INSERT INTO public.moon VALUES (12, 'Mimas', 1789, 394, 2);
INSERT INTO public.moon VALUES (13, 'bore', 1234, 321, 3);
INSERT INTO public.moon VALUES (14, 'bababa', 4531, 123, 3);
INSERT INTO public.moon VALUES (15, 'asdf', 3456, 354, 5);
INSERT INTO public.moon VALUES (16, 'reterete', 4567, 13212, 8);
INSERT INTO public.moon VALUES (17, 'Enceladus', 1789, 123, 9);
INSERT INTO public.moon VALUES (18, 'Tethys', 1543, 567, 3);
INSERT INTO public.moon VALUES (19, 'BONETO', 1610, 4800, 8);
INSERT INTO public.moon VALUES (20, 'Cormillot', 1543, 432, 7);
INSERT INTO public.moon VALUES (21, 'Natiore', 1610, 4800, 6);
INSERT INTO public.moon VALUES (22, 'Pameda', 1986, 969, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 8, 0.24, 58.65, false);
INSERT INTO public.planet VALUES (2, 'Venus', 2, 0.62, 243.03, false);
INSERT INTO public.planet VALUES (3, 'Earth', 4, 1.00, 1.00, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1.88, 1.03, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 8, 11.86, 0.41, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, 29.00, 0.55, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, 56.76, 87.45, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 7, 4.60, 0.38, false);
INSERT INTO public.planet VALUES (10, 'Orcus', 2, 247.50, 247.60, false);
INSERT INTO public.planet VALUES (11, 'Pluto', 6, NULL, 98.76, true);
INSERT INTO public.planet VALUES (12, 'Haumea', 3, 43.50, 65.70, false);
INSERT INTO public.planet VALUES (13, 'Quaoar', 2, 288.00, 0.16, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sadalsuud', 2, 612, 2.90, NULL);
INSERT INTO public.star VALUES (2, 'Hamal', 1, 652, 7.90, NULL);
INSERT INTO public.star VALUES (3, 'Arcturus', 35, 37, 0.05, NULL);
INSERT INTO public.star VALUES (4, 'Deneb Algedi', 37, 39, 2.85, NULL);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 38, 5, 0.01, NULL);
INSERT INTO public.star VALUES (6, 'Beta Comae Berenices', 38, 30, 4.26, NULL);
INSERT INTO public.star VALUES (7, 'Regulus', 35, 77, 1.36, NULL);
INSERT INTO public.star VALUES (8, 'Aldebaran', 3, 65, 0.85, NULL);
INSERT INTO public.star VALUES (9, 'Diphda', 2, 96, 2.04, NULL);


--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelation_constelation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 38, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constelation constelation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation
    ADD CONSTRAINT constelation_name_key UNIQUE (name);


--
-- Name: constelation constelation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation
    ADD CONSTRAINT constelation_pkey PRIMARY KEY (constelation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constelation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constelation_id_fkey FOREIGN KEY (constelation_id) REFERENCES public.constelation(constelation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

