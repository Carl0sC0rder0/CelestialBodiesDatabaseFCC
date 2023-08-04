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
-- Name: distances_from_earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distances_from_earth (
    distances_from_earth_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_ly numeric(15,3)
);


ALTER TABLE public.distances_from_earth OWNER TO freecodecamp;

--
-- Name: distances_from_earth_distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distances_from_earth_distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distances_from_earth_distance_id_seq OWNER TO freecodecamp;

--
-- Name: distances_from_earth_distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distances_from_earth_distance_id_seq OWNED BY public.distances_from_earth.distances_from_earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    distance_from_earth_ly numeric(15,3),
    radius_in_ly numeric(15,3)
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
    planet_id integer,
    radius_in_km numeric(10,3),
    orbital_perios_days integer
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
    moons integer,
    radius_in_km numeric(10,3),
    description text,
    has_life boolean,
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
    name character varying(30) NOT NULL,
    planets integer,
    galaxy_id integer,
    radius_in_km numeric(15,3)
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
-- Name: distances_from_earth distances_from_earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distances_from_earth ALTER COLUMN distances_from_earth_id SET DEFAULT nextval('public.distances_from_earth_distance_id_seq'::regclass);


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
-- Data for Name: distances_from_earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distances_from_earth VALUES (1, 'Andromeda', 2500000.000);
INSERT INTO public.distances_from_earth VALUES (2, 'SMC', 199000.000);
INSERT INTO public.distances_from_earth VALUES (3, 'LMC', 158200.000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', false, 0.000, 52850.000);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', false, 2500000.000, 110000.000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', false, 158200.000, 7000.000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', false, 199000.000, 3500.000);
INSERT INTO public.galaxy VALUES (6, 'Triangle', false, 3000000.000, 25000.000);
INSERT INTO public.galaxy VALUES (7, 'Leo', false, 750000.000, 2000.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, 3474.800, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.100, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.200, 1);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.600, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.800, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.100, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.300, 16);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2576.000, 16);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.100, 1);
INSERT INTO public.moon VALUES (10, 'Triton', 8, 1353.400, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 235.800, 1);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 788.900, 9);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761.400, 13);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788.900, 9);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 210.000, 1);
INSERT INTO public.moon VALUES (11, 'Charon', 10, 606.000, 6);
INSERT INTO public.moon VALUES (12, 'Dysnomia', 10, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Hiiaka', 10, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Namaka', 10, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Nereid', 10, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371.000, 'Our planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 0, 2439.700, 'Closest planet to the Sun', false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 6051.800, 'Similar size as Earth, but, with toxic atmosphere', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 3389.500, 'The red planet, reddish appearance', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 69911.000, 'The largest planet in Solar System', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 58232.000, 'The planet with rings system', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 25362.000, 'The ice giant', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 24622.000, 'Another ice giant, deep blue color', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 1188.300, 'Dwarf planet', false, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 1, 1163.000, 'The largest known dwarf planet', false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 2, 780.000, 'Elongated and rapidly spinning', false, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 0, 715.000, 'Reddish coloration', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 7, 1, NULL);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 1, 69550.000);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 4, 1, 865200.000);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 0, 1, 1180000.000);
INSERT INTO public.star VALUES (5, 'Sirius', 2, 1, 1790000.000);
INSERT INTO public.star VALUES (6, 'Antaris', 0, 1, 883000.000);


--
-- Name: distances_from_earth_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distances_from_earth_distance_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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
-- Name: distances_from_earth dfe_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distances_from_earth
    ADD CONSTRAINT dfe_unique UNIQUE (name);


--
-- Name: distances_from_earth distances_from_earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distances_from_earth
    ADD CONSTRAINT distances_from_earth_pkey PRIMARY KEY (distances_from_earth_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


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

