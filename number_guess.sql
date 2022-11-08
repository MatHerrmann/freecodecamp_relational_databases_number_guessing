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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50),
    games_played integer,
    best_score integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Matthias', 4, 4);
INSERT INTO public.users VALUES (2, 'Anna', 0, 0);
INSERT INTO public.users VALUES (3, 'user_1667905681316', 0, 0);
INSERT INTO public.users VALUES (4, 'user_1667905681315', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1667906485871', 0, 0);
INSERT INTO public.users VALUES (6, 'user_1667906485870', 0, 0);
INSERT INTO public.users VALUES (7, 'Alex', 0, 0);
INSERT INTO public.users VALUES (8, 'user_1667906690845', 0, 0);
INSERT INTO public.users VALUES (9, 'user_1667906690844', 0, 0);
INSERT INTO public.users VALUES (10, 'A', 0, 2147483647);
INSERT INTO public.users VALUES (11, 'B', 1, 10);
INSERT INTO public.users VALUES (13, 'user_1667907238398', 2, 653);
INSERT INTO public.users VALUES (12, 'user_1667907238399', 5, 133);
INSERT INTO public.users VALUES (15, 'user_1667907349602', 2, 230);
INSERT INTO public.users VALUES (14, 'user_1667907349603', 5, 89);
INSERT INTO public.users VALUES (17, 'user_1667907368607', 2, 204);
INSERT INTO public.users VALUES (16, 'user_1667907368608', 5, 69);
INSERT INTO public.users VALUES (19, 'user_1667907386096', 2, 114);
INSERT INTO public.users VALUES (18, 'user_1667907386097', 5, 290);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

