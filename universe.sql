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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer,
    size integer,
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
-- Name: image; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.image (
    image_id integer NOT NULL,
    filename character varying(80),
    corresponding_name character varying(30),
    description character varying(30) NOT NULL,
    name character varying(60)
);


ALTER TABLE public.image OWNER TO freecodecamp;

--
-- Name: images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_image_id_seq OWNER TO freecodecamp;

--
-- Name: images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.images_image_id_seq OWNED BY public.image.image_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    distance_to_planet numeric(10,2),
    description text
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
    star_id integer NOT NULL,
    decription text,
    distance_to_star integer,
    years integer,
    has_life boolean,
    has_water boolean
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
    galaxy_id integer NOT NULL,
    is_active boolean,
    color character varying(30) NOT NULL,
    age integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: image image_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image ALTER COLUMN image_id SET DEFAULT nextval('public.images_image_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Snake', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Monkey', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Dragon', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Fish', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Banana', 3, NULL, NULL);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.image VALUES (1, NULL, NULL, 'd1', NULL);
INSERT INTO public.image VALUES (2, NULL, NULL, 'd2', NULL);
INSERT INTO public.image VALUES (3, NULL, NULL, 'd3', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Z', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'X', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'C', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'V', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'X', 6, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'X', 6, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Z', 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'X', 3, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'C', 4, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'V', 5, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'X', 6, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'X', 6, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, 'Yellow', NULL);
INSERT INTO public.star VALUES (2, 'M', 2, NULL, 'Red', NULL);
INSERT INTO public.star VALUES (3, 'Y', 3, NULL, 'Yellow', NULL);
INSERT INTO public.star VALUES (4, 'X', 4, NULL, 'White', NULL);
INSERT INTO public.star VALUES (5, 'F', 5, NULL, 'Orange', NULL);
INSERT INTO public.star VALUES (6, 'O', 6, NULL, 'Green', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.images_image_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: image images_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT images_description_key UNIQUE (description);


--
-- Name: image images_image_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT images_image_id_key UNIQUE (image_id);


--
-- Name: image images_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT images_pkey PRIMARY KEY (image_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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

