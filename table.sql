-- Table: public.books

-- DROP TABLE public.books;

CREATE TABLE public.books
(
    idlib integer GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    calidad varchar(50) NOT NULL,
    tipo varchar(50) NOT NULL,
    titulo varchar(50) NOT NULL,
    autor varchar(50) NOT NULL,
    anho integer NOT NULL,
    editorial varchar(50) NOT NULL,
    precio numeric NOT NULL,
    CONSTRAINT books_pkey PRIMARY KEY (idlib)
)

TABLESPACE pg_default;

ALTER TABLE public.books
    OWNER to postgres;

