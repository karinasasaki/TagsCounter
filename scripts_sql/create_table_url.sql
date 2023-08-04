CREATE TABLE IF NOT EXISTS public.urls
(
    id bigint NOT NULL DEFAULT nextval('urls_id_seq'::regclass),
    link character varying COLLATE pg_catalog."default",
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT urls_pkey PRIMARY KEY (id)
)