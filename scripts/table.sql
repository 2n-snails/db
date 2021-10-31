--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 14.0

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

--
-- Name: state_state_enum; Type: TYPE; Schema: public; Owner: username
--

CREATE TYPE public.state_state_enum AS ENUM (
    'sale',
    'sold',
    'wish',
    'reservation',
    'delete'
);


ALTER TYPE public.state_state_enum OWNER TO username;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address_area; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.address_area (
    area_no integer NOT NULL,
    area_name character varying(30) NOT NULL,
    area_city_no integer
);


ALTER TABLE public.address_area OWNER TO username;

--
-- Name: address_area_area_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.address_area_area_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_area_area_no_seq OWNER TO username;

--
-- Name: address_area_area_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.address_area_area_no_seq OWNED BY public.address_area.area_no;


--
-- Name: address_city; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.address_city (
    city_no integer NOT NULL,
    city_name character varying(30) NOT NULL
);


ALTER TABLE public.address_city OWNER TO username;

--
-- Name: address_city_city_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.address_city_city_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_city_city_no_seq OWNER TO username;

--
-- Name: address_city_city_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.address_city_city_no_seq OWNED BY public.address_city.city_no;


--
-- Name: category; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.category (
    category_no integer NOT NULL,
    category_parent_name character varying(20) NOT NULL,
    category_child_name character varying(20) NOT NULL
);


ALTER TABLE public.category OWNER TO username;

--
-- Name: category_category_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.category_category_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_no_seq OWNER TO username;

--
-- Name: category_category_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.category_category_no_seq OWNED BY public.category.category_no;


--
-- Name: chat; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.chat (
    area_no integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    content json NOT NULL,
    seller integer,
    buyer integer,
    chat_product_no integer
);


ALTER TABLE public.chat OWNER TO username;

--
-- Name: chat_area_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.chat_area_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_area_no_seq OWNER TO username;

--
-- Name: chat_area_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.chat_area_no_seq OWNED BY public.chat.area_no;


--
-- Name: comment; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.comment (
    comment_no integer NOT NULL,
    comment_content character varying(200) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    comment_user_no integer,
    comment_product_no integer
);


ALTER TABLE public.comment OWNER TO username;

--
-- Name: comment_comment_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.comment_comment_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_comment_no_seq OWNER TO username;

--
-- Name: comment_comment_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.comment_comment_no_seq OWNED BY public.comment.comment_no;


--
-- Name: deal; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.deal (
    deal_no integer NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    deal_area_no integer,
    product_no integer
);


ALTER TABLE public.deal OWNER TO username;

--
-- Name: deal_deal_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.deal_deal_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_deal_no_seq OWNER TO username;

--
-- Name: deal_deal_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.deal_deal_no_seq OWNED BY public.deal.deal_no;


--
-- Name: image; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.image (
    image_no integer NOT NULL,
    image_src character varying(250) NOT NULL,
    image_order integer NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    image_product_no integer
);


ALTER TABLE public.image OWNER TO username;

--
-- Name: image_image_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.image_image_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_image_no_seq OWNER TO username;

--
-- Name: image_image_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.image_image_no_seq OWNED BY public.image.image_no;


--
-- Name: product; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.product (
    product_no integer NOT NULL,
    product_title character varying(50) NOT NULL,
    product_content character varying(200) NOT NULL,
    product_price character varying(25) NOT NULL,
    product_view integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    product_user_no integer
);


ALTER TABLE public.product OWNER TO username;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.product_category (
    product_category_no integer NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    category_no integer,
    product_no integer
);


ALTER TABLE public.product_category OWNER TO username;

--
-- Name: product_category_product_category_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.product_category_product_category_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_product_category_no_seq OWNER TO username;

--
-- Name: product_category_product_category_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.product_category_product_category_no_seq OWNED BY public.product_category.product_category_no;


--
-- Name: product_product_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.product_product_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_no_seq OWNER TO username;

--
-- Name: product_product_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.product_product_no_seq OWNED BY public.product.product_no;


--
-- Name: re_comment; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.re_comment (
    recomment_no integer NOT NULL,
    recomment_content character varying(200) NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    recomment_comment_no integer,
    recomment_user_no integer
);


ALTER TABLE public.re_comment OWNER TO username;

--
-- Name: re_comment_recomment_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.re_comment_recomment_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.re_comment_recomment_no_seq OWNER TO username;

--
-- Name: re_comment_recomment_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.re_comment_recomment_no_seq OWNED BY public.re_comment.recomment_no;


--
-- Name: review; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.review (
    review_no integer NOT NULL,
    product_no integer NOT NULL,
    review_content character varying(100) NOT NULL,
    review_score integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    review_writer_user_no integer,
    review_receiver_user_no integer
);


ALTER TABLE public.review OWNER TO username;

--
-- Name: review_review_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.review_review_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_review_no_seq OWNER TO username;

--
-- Name: review_review_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.review_review_no_seq OWNED BY public.review.review_no;


--
-- Name: state; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.state (
    state_no integer NOT NULL,
    state public.state_state_enum DEFAULT 'sale'::public.state_state_enum NOT NULL,
    review_state character varying,
    user_no integer,
    product_no integer
);


ALTER TABLE public.state OWNER TO username;

--
-- Name: state_state_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.state_state_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_state_no_seq OWNER TO username;

--
-- Name: state_state_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.state_state_no_seq OWNED BY public.state.state_no;


--
-- Name: user; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public."user" (
    user_no integer NOT NULL,
    user_provider_id character varying(100) NOT NULL,
    user_level smallint DEFAULT '10'::smallint NOT NULL,
    user_profile_image character varying(100) DEFAULT 'none'::character varying NOT NULL,
    user_nick character varying(30) NOT NULL,
    user_provider character varying(20) NOT NULL,
    user_privacy boolean DEFAULT false NOT NULL,
    user_refresh_token character varying,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."user" OWNER TO username;

--
-- Name: user_user_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.user_user_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_no_seq OWNER TO username;

--
-- Name: user_user_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.user_user_no_seq OWNED BY public."user".user_no;


--
-- Name: wish; Type: TABLE; Schema: public; Owner: username
--

CREATE TABLE public.wish (
    wish_no integer NOT NULL,
    deleted character varying(15) DEFAULT 'N'::character varying NOT NULL,
    wish_user_no integer,
    wish_product_no integer
);


ALTER TABLE public.wish OWNER TO username;

--
-- Name: wish_wish_no_seq; Type: SEQUENCE; Schema: public; Owner: username
--

CREATE SEQUENCE public.wish_wish_no_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wish_wish_no_seq OWNER TO username;

--
-- Name: wish_wish_no_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: username
--

ALTER SEQUENCE public.wish_wish_no_seq OWNED BY public.wish.wish_no;


--
-- Name: address_area area_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.address_area ALTER COLUMN area_no SET DEFAULT nextval('public.address_area_area_no_seq'::regclass);


--
-- Name: address_city city_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.address_city ALTER COLUMN city_no SET DEFAULT nextval('public.address_city_city_no_seq'::regclass);


--
-- Name: category category_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.category ALTER COLUMN category_no SET DEFAULT nextval('public.category_category_no_seq'::regclass);


--
-- Name: chat area_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.chat ALTER COLUMN area_no SET DEFAULT nextval('public.chat_area_no_seq'::regclass);


--
-- Name: comment comment_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comment ALTER COLUMN comment_no SET DEFAULT nextval('public.comment_comment_no_seq'::regclass);


--
-- Name: deal deal_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.deal ALTER COLUMN deal_no SET DEFAULT nextval('public.deal_deal_no_seq'::regclass);


--
-- Name: image image_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.image ALTER COLUMN image_no SET DEFAULT nextval('public.image_image_no_seq'::regclass);


--
-- Name: product product_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product ALTER COLUMN product_no SET DEFAULT nextval('public.product_product_no_seq'::regclass);


--
-- Name: product_category product_category_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product_category ALTER COLUMN product_category_no SET DEFAULT nextval('public.product_category_product_category_no_seq'::regclass);


--
-- Name: re_comment recomment_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.re_comment ALTER COLUMN recomment_no SET DEFAULT nextval('public.re_comment_recomment_no_seq'::regclass);


--
-- Name: review review_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.review ALTER COLUMN review_no SET DEFAULT nextval('public.review_review_no_seq'::regclass);


--
-- Name: state state_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.state ALTER COLUMN state_no SET DEFAULT nextval('public.state_state_no_seq'::regclass);


--
-- Name: user user_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public."user" ALTER COLUMN user_no SET DEFAULT nextval('public.user_user_no_seq'::regclass);


--
-- Name: wish wish_no; Type: DEFAULT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.wish ALTER COLUMN wish_no SET DEFAULT nextval('public.wish_wish_no_seq'::regclass);


--
-- Data for Name: address_area; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.address_area (area_no, area_name, area_city_no) FROM stdin;
\.


--
-- Data for Name: address_city; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.address_city (city_no, city_name) FROM stdin;
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.category (category_no, category_parent_name, category_child_name) FROM stdin;
\.


--
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.chat (area_no, "createdAt", content, seller, buyer, chat_product_no) FROM stdin;
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.comment (comment_no, comment_content, "createdAt", deleted, comment_user_no, comment_product_no) FROM stdin;
\.


--
-- Data for Name: deal; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.deal (deal_no, deleted, deal_area_no, product_no) FROM stdin;
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.image (image_no, image_src, image_order, deleted, image_product_no) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.product (product_no, product_title, product_content, product_price, product_view, "createdAt", deleted, product_user_no) FROM stdin;
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.product_category (product_category_no, deleted, category_no, product_no) FROM stdin;
\.


--
-- Data for Name: re_comment; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.re_comment (recomment_no, recomment_content, "createdAt", deleted, recomment_comment_no, recomment_user_no) FROM stdin;
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.review (review_no, product_no, review_content, review_score, "createdAt", deleted, review_writer_user_no, review_receiver_user_no) FROM stdin;
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.state (state_no, state, review_state, user_no, product_no) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public."user" (user_no, user_provider_id, user_level, user_profile_image, user_nick, user_provider, user_privacy, user_refresh_token, deleted, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: wish; Type: TABLE DATA; Schema: public; Owner: username
--

COPY public.wish (wish_no, deleted, wish_user_no, wish_product_no) FROM stdin;
\.


--
-- Name: address_area_area_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.address_area_area_no_seq', 1, false);


--
-- Name: address_city_city_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.address_city_city_no_seq', 1, false);


--
-- Name: category_category_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.category_category_no_seq', 1, false);


--
-- Name: chat_area_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.chat_area_no_seq', 1, false);


--
-- Name: comment_comment_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.comment_comment_no_seq', 1, false);


--
-- Name: deal_deal_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.deal_deal_no_seq', 1, false);


--
-- Name: image_image_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.image_image_no_seq', 1, false);


--
-- Name: product_category_product_category_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.product_category_product_category_no_seq', 1, false);


--
-- Name: product_product_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.product_product_no_seq', 1, false);


--
-- Name: re_comment_recomment_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.re_comment_recomment_no_seq', 1, false);


--
-- Name: review_review_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.review_review_no_seq', 1, false);


--
-- Name: state_state_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.state_state_no_seq', 1, false);


--
-- Name: user_user_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.user_user_no_seq', 1, false);


--
-- Name: wish_wish_no_seq; Type: SEQUENCE SET; Schema: public; Owner: username
--

SELECT pg_catalog.setval('public.wish_wish_no_seq', 1, false);


--
-- Name: address_area PK_02554feb0123ef13250be46c831; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.address_area
    ADD CONSTRAINT "PK_02554feb0123ef13250be46c831" PRIMARY KEY (area_no);


--
-- Name: chat PK_0bae4b962a9a1f744610fa778c9; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "PK_0bae4b962a9a1f744610fa778c9" PRIMARY KEY (area_no);


--
-- Name: deal PK_143c1ebbf399790744018aa9572; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT "PK_143c1ebbf399790744018aa9572" PRIMARY KEY (deal_no);


--
-- Name: product_category PK_32b5c1b3a8215e9d25cefeadb2d; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT "PK_32b5c1b3a8215e9d25cefeadb2d" PRIMARY KEY (product_category_no);


--
-- Name: review PK_6062c414ef0697357e856d35281; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT "PK_6062c414ef0697357e856d35281" PRIMARY KEY (review_no);


--
-- Name: state PK_60ee120fdf335fded83af23d4a4; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT "PK_60ee120fdf335fded83af23d4a4" PRIMARY KEY (state_no);


--
-- Name: category PK_9027e5292b9565929c94b6e3015; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT "PK_9027e5292b9565929c94b6e3015" PRIMARY KEY (category_no);


--
-- Name: address_city PK_a81f6811a3d91d1245f4880dd0e; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.address_city
    ADD CONSTRAINT "PK_a81f6811a3d91d1245f4880dd0e" PRIMARY KEY (city_no);


--
-- Name: comment PK_aaaee3404fb6d20bac316ee1a23; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "PK_aaaee3404fb6d20bac316ee1a23" PRIMARY KEY (comment_no);


--
-- Name: image PK_b8d34e33eb1ed5ce223f45a29ce; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "PK_b8d34e33eb1ed5ce223f45a29ce" PRIMARY KEY (image_no);


--
-- Name: user PK_bea04c33c739bfdedf8aa201ee0; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_bea04c33c739bfdedf8aa201ee0" PRIMARY KEY (user_no);


--
-- Name: product PK_e19db1266a207e2861039d82533; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_e19db1266a207e2861039d82533" PRIMARY KEY (product_no);


--
-- Name: re_comment PK_e76e89011291986c4a53ae177bc; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.re_comment
    ADD CONSTRAINT "PK_e76e89011291986c4a53ae177bc" PRIMARY KEY (recomment_no);


--
-- Name: wish PK_fdd4096645a5af65ca96de8f3a1; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.wish
    ADD CONSTRAINT "PK_fdd4096645a5af65ca96de8f3a1" PRIMARY KEY (wish_no);


--
-- Name: state REL_778b1f54d36e0552f7b666a024; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT "REL_778b1f54d36e0552f7b666a024" UNIQUE (product_no);


--
-- Name: user UQ_aefa7142df1ddf0e1ac64b99677; Type: CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_aefa7142df1ddf0e1ac64b99677" UNIQUE (user_provider_id);


--
-- Name: review FK_0e25e5f58613a6f081f39e41aa5; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT "FK_0e25e5f58613a6f081f39e41aa5" FOREIGN KEY (review_writer_user_no) REFERENCES public."user"(user_no);


--
-- Name: comment FK_2880d20197cbf464cd407d482bf; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_2880d20197cbf464cd407d482bf" FOREIGN KEY (comment_product_no) REFERENCES public.product(product_no);


--
-- Name: re_comment FK_611003dff0d00266061c3f87e0b; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.re_comment
    ADD CONSTRAINT "FK_611003dff0d00266061c3f87e0b" FOREIGN KEY (recomment_comment_no) REFERENCES public.comment(comment_no);


--
-- Name: chat FK_66b7d4c6d4275e74beacf0fbbf6; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "FK_66b7d4c6d4275e74beacf0fbbf6" FOREIGN KEY (buyer) REFERENCES public."user"(user_no);


--
-- Name: product FK_67c43a91dcd16633e8b32388224; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "FK_67c43a91dcd16633e8b32388224" FOREIGN KEY (product_user_no) REFERENCES public."user"(user_no);


--
-- Name: state FK_778b1f54d36e0552f7b666a0244; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT "FK_778b1f54d36e0552f7b666a0244" FOREIGN KEY (product_no) REFERENCES public.product(product_no);


--
-- Name: chat FK_77e27a4f8092681152b4c16f461; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "FK_77e27a4f8092681152b4c16f461" FOREIGN KEY (chat_product_no) REFERENCES public.product(product_no);


--
-- Name: product_category FK_7d30e03beb417091284438bd8df; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT "FK_7d30e03beb417091284438bd8df" FOREIGN KEY (product_no) REFERENCES public.product(product_no);


--
-- Name: re_comment FK_7e855ba85d21ff2e733e52b52b5; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.re_comment
    ADD CONSTRAINT "FK_7e855ba85d21ff2e733e52b52b5" FOREIGN KEY (recomment_user_no) REFERENCES public."user"(user_no);


--
-- Name: deal FK_8a7305826b6cc41635f54edb30a; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT "FK_8a7305826b6cc41635f54edb30a" FOREIGN KEY (product_no) REFERENCES public.product(product_no);


--
-- Name: comment FK_98a9b81d95962a602f114b5ace3; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT "FK_98a9b81d95962a602f114b5ace3" FOREIGN KEY (comment_user_no) REFERENCES public."user"(user_no);


--
-- Name: address_area FK_998950adfadd9c69ed711f837a9; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.address_area
    ADD CONSTRAINT "FK_998950adfadd9c69ed711f837a9" FOREIGN KEY (area_city_no) REFERENCES public.address_city(city_no);


--
-- Name: state FK_ace47b363e76678aa7185a0f023; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT "FK_ace47b363e76678aa7185a0f023" FOREIGN KEY (user_no) REFERENCES public."user"(user_no);


--
-- Name: wish FK_b03b5f50a09cb0a486df9be410f; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.wish
    ADD CONSTRAINT "FK_b03b5f50a09cb0a486df9be410f" FOREIGN KEY (wish_user_no) REFERENCES public."user"(user_no);


--
-- Name: image FK_b78e10b0a235ea163bbc1866ed0; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "FK_b78e10b0a235ea163bbc1866ed0" FOREIGN KEY (image_product_no) REFERENCES public.product(product_no);


--
-- Name: product_category FK_c798edbe5d11dabdc89053e15ff; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT "FK_c798edbe5d11dabdc89053e15ff" FOREIGN KEY (category_no) REFERENCES public.category(category_no);


--
-- Name: deal FK_dfa1a9f1b29f2cc70ce0d30ce56; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT "FK_dfa1a9f1b29f2cc70ce0d30ce56" FOREIGN KEY (deal_area_no) REFERENCES public.address_area(area_no);


--
-- Name: review FK_e33b9daba7ca315e4f3b64610be; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT "FK_e33b9daba7ca315e4f3b64610be" FOREIGN KEY (review_receiver_user_no) REFERENCES public."user"(user_no);


--
-- Name: wish FK_e6af349ae9f9e95ab8361fe852b; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.wish
    ADD CONSTRAINT "FK_e6af349ae9f9e95ab8361fe852b" FOREIGN KEY (wish_product_no) REFERENCES public.product(product_no);


--
-- Name: chat FK_ff533f209be329f999ead3fecc2; Type: FK CONSTRAINT; Schema: public; Owner: username
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT "FK_ff533f209be329f999ead3fecc2" FOREIGN KEY (seller) REFERENCES public."user"(user_no);


--
-- PostgreSQL database dump complete
--

