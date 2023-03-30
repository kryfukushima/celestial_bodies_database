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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    star_id integer,
    galaxy_id integer,
    name character varying(20) NOT NULL,
    main_stars integer,
    messier_objects integer,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_thousands_of_lys numeric(4,1) NOT NULL,
    shape character varying(30),
    is_satellite_galaxy boolean NOT NULL
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
    planet_id integer,
    name character varying(20) NOT NULL,
    orbital_period_days numeric(6,3),
    avg_orbital_speed_kms numeric(8,3),
    largest_moon integer
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
    star_id integer,
    name character varying(20) NOT NULL,
    satellites integer NOT NULL,
    is_dwarf_planet boolean NOT NULL,
    has_rings boolean
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
    galaxy_id integer,
    name character varying(20) NOT NULL,
    apparent_magnitude_v numeric(4,2),
    stellar_classification character varying(10)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 2, 2, 'Dorado', 3, 0, 'Constellation in the southern sky. Named in the late 16th century after the dolphinfish, Dorado in Spanish.');
INSERT INTO public.constellation VALUES (2, 3, NULL, 'Mensa', 4, 0, 'Constellation on the Southern Celestial Hemisphere. Named in the 18th century, Latin for table.');
INSERT INTO public.constellation VALUES (3, NULL, 4, 'Ursa Major', 7, 7, 'Constellation in the northern sky. Named in the 2nd century AD, Latin for Greater Bear.');
INSERT INTO public.constellation VALUES (4, 10, NULL, 'Ursa Minor', 7, 0, 'Constellation in the northern sky. Named in the 2nd century AD, Latin for Lesser Bear.');
INSERT INTO public.constellation VALUES (5, 6, NULL, 'Orion', 7, 3, 'Constellation on the celestial equator. Named after Orion, a hunter in Greek mythology.');
INSERT INTO public.constellation VALUES (6, NULL, 1, 'Sagittarius', 12, 15, 'Constellation in the Southern Celestial Hemisphere. Named in the 2nd century, Latin for archer.');
INSERT INTO public.constellation VALUES (7, NULL, 5, 'Virgo', 9, 11, 'Constellation in the Northern Hemisphere. Latin for maiden.');
INSERT INTO public.constellation VALUES (8, 7, NULL, 'Draco', 14, 1, 'Constellation in the northern sky. Named in the 2nd century, Latin for dragon.');
INSERT INTO public.constellation VALUES (10, 12, NULL, 'Centaurus', 11, 0, 'Constellation in the southern sky. Named in the 2nd century, named after a centaur from Greek mythology.');
INSERT INTO public.constellation VALUES (11, 5, NULL, 'Lyra', 5, 2, 'Constellation in the northern sky. Named in the 2nd century, Latin for lyre.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105.7, 'barred spiral', false);
INSERT INTO public.galaxy VALUES (2, 'Large Magnellic Cloud', 14.0, 'irregular', true);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 220.0, 'barred spiral', false);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 37.0, 'starburst', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 50.0, 'spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 170.0, 'spiral', false);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius Dwarf Spherodical Galaxy', 10.0, 'elliptical', true);
INSERT INTO public.galaxy VALUES (8, 'Bode''s Galaxy', 90.0, 'grand design spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 27.321, 1.022, 5);
INSERT INTO public.moon VALUES (2, 4, 'Io', 1.769, 17.334, 4);
INSERT INTO public.moon VALUES (3, 4, 'Europa', 3.551, 13743.360, 6);
INSERT INTO public.moon VALUES (4, 5, 'Phobos', 0.318, 2.138, NULL);
INSERT INTO public.moon VALUES (5, 11, 'Vanth', 9.539, NULL, NULL);
INSERT INTO public.moon VALUES (6, 9, 'Thalassa', 0.311, 11.680, NULL);
INSERT INTO public.moon VALUES (7, 9, 'Naiad', 0.294, 11.860, NULL);
INSERT INTO public.moon VALUES (8, 9, 'Triton', 5.876, 4.390, 7);
INSERT INTO public.moon VALUES (9, 5, 'Deimos', 1.263, 1.351, NULL);
INSERT INTO public.moon VALUES (10, 4, 'Ganymede', 7.154, 10.880, 1);
INSERT INTO public.moon VALUES (11, 8, 'Titan', 15.945, 5.570, 2);
INSERT INTO public.moon VALUES (12, 4, 'Callisto', 16.689, 8.204, 3);
INSERT INTO public.moon VALUES (13, 8, 'Rhea', 4.518, 8.480, 9);
INSERT INTO public.moon VALUES (14, 12, 'Weywot', 12.431, NULL, NULL);
INSERT INTO public.moon VALUES (15, 3, 'Charon', 6.387, 0.210, 12);
INSERT INTO public.moon VALUES (16, 9, 'Nereid', 360.110, 1.120, 22);
INSERT INTO public.moon VALUES (17, 8, 'Iapetus', 79.321, 3.260, 11);
INSERT INTO public.moon VALUES (18, 8, 'Dione', 2.736, 10.030, 15);
INSERT INTO public.moon VALUES (19, 8, 'Tethys', 1.887, 11.350, 16);
INSERT INTO public.moon VALUES (20, 3, 'Nix', 24.854, NULL, NULL);
INSERT INTO public.moon VALUES (21, 3, 'Hydra', 38.201, 0.123, NULL);
INSERT INTO public.moon VALUES (22, 8, 'Mimas', 0.942, 14.280, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 10, 'Earth', 1, false, false);
INSERT INTO public.planet VALUES (2, 1, 'Mercury', 0, false, false);
INSERT INTO public.planet VALUES (3, NULL, 'Pluto', 5, true, false);
INSERT INTO public.planet VALUES (4, NULL, 'Jupiter', 95, false, true);
INSERT INTO public.planet VALUES (5, 11, 'Mars', 2, false, false);
INSERT INTO public.planet VALUES (6, NULL, 'Makemake', 1, true, NULL);
INSERT INTO public.planet VALUES (7, NULL, 'Ceres', 0, true, false);
INSERT INTO public.planet VALUES (8, 12, 'Saturn', 83, false, true);
INSERT INTO public.planet VALUES (9, NULL, 'Neptune', 14, false, true);
INSERT INTO public.planet VALUES (10, 1, 'Venus', 0, false, false);
INSERT INTO public.planet VALUES (11, NULL, 'Orcus', 1, true, NULL);
INSERT INTO public.planet VALUES (12, NULL, 'Quaoar', 1, true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', -26.74, 'G2V');
INSERT INTO public.star VALUES (2, 2, 'S Doradus', 8.60, 'B8/9eq');
INSERT INTO public.star VALUES (3, 2, 'R71', 8.70, 'LBV');
INSERT INTO public.star VALUES (4, 2, 'W Mensae', 13.90, 'F5Ipec');
INSERT INTO public.star VALUES (5, 1, 'Vega', 0.02, 'A0Va');
INSERT INTO public.star VALUES (6, 1, 'Rigel', 0.13, 'B8 Ia');
INSERT INTO public.star VALUES (7, 1, '26 Draconis', 5.23, 'G0Va');
INSERT INTO public.star VALUES (8, 1, 'Spica', 0.97, 'B1V');
INSERT INTO public.star VALUES (9, 2, 'HD 33579', 8.99, 'A3Ia');
INSERT INTO public.star VALUES (10, 1, 'Polaris', 1.98, 'F7Ib');
INSERT INTO public.star VALUES (11, 1, 'Sadr', 2.23, 'F8 Iab');
INSERT INTO public.star VALUES (12, 1, 'Alpha Centauri A', 0.01, 'G2V');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 11, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_largest_moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_largest_moon_key UNIQUE (largest_moon);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

