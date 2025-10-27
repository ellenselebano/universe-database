--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbital_period_years numeric(8,2) NOT NULL,
    last_seen_year integer,
    is_periodic boolean,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    age_in_millions_of_years numeric(10,2) NOT NULL,
    has_life boolean,
    distance_from_earth numeric(15,2),
    description text
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
    name character varying(255) NOT NULL,
    diameter_km numeric(8,2) NOT NULL,
    has_water boolean,
    is_spherical boolean,
    orbital_period_days numeric(6,2),
    planet_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    planet_type character varying(100) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    diameter_km numeric(10,2),
    star_id integer NOT NULL
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
    name character varying(255) NOT NULL,
    star_type character varying(100) NOT NULL,
    temperature integer NOT NULL,
    is_spherical boolean,
    mass numeric(10,2),
    galaxy_id integer NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 75.32, 1986, true, 'Most famous periodic comet');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2537.00, 1997, true, 'Exceptionally bright comet visible in 1997');
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 6766.00, 2020, true, 'Bright comet visible in 2020');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600.50, true, 0.00, 'Our home galaxy containing our solar system');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10050.75, false, 2537.00, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000.25, false, 3000.00, 'Third-largest member of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 13200.00, false, 53500.00, 'Famous for its supermassive black hole');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 4000.80, false, 23000.00, 'Classic example of a grand design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 13250.30, false, 29000.00, 'Known for its bright nucleus and large central bulge');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474.80, true, true, 27.32, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.40, false, false, 0.32, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.40, false, false, 1.26, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643.20, false, true, 1.77, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3121.60, true, true, 3.55, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.20, true, true, 7.15, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.60, true, true, 16.69, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 396.40, false, true, 0.94, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504.20, true, true, 1.37, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 1062.20, false, true, 1.89, 6);
INSERT INTO public.moon VALUES (11, 'Dione', 1122.80, false, true, 2.74, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 1527.60, false, true, 4.52, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 5149.50, true, true, 15.95, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1468.60, false, true, 79.33, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 471.60, false, true, 1.41, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1157.80, false, true, 2.52, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1169.40, false, true, 4.14, 7);
INSERT INTO public.moon VALUES (18, 'Titania', 1576.80, false, true, 8.71, 7);
INSERT INTO public.moon VALUES (19, 'Oberon', 1522.80, false, true, 13.46, 7);
INSERT INTO public.moon VALUES (20, 'Triton', 2706.80, true, true, 5.88, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, true, 4500, 4879.40, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, true, 4500, 12104.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, true, 4500, 12742.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, true, 4500, 6779.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas giant', false, true, 4500, 139820.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas giant', false, true, 4500, 116460.00, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', false, true, 4500, 50724.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice giant', false, true, 4500, 49244.00, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Terrestrial', false, true, 4800, 14000.00, 6);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 'Terrestrial', true, true, 4000, 12000.00, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 'Terrestrial', true, true, 7000, 15000.00, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Gas giant', false, true, 6500, 160000.00, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 5778, true, 1.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence', 9940, true, 2.02, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-type main-sequence', 5790, true, 1.10, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', 3500, true, 11.60, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'A-type main-sequence', 9602, true, 2.14, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Red dwarf', 3042, true, 0.12, 1);


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

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

