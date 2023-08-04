CREATE TABLE IF NOT EXISTS public.tags
(
    id bigint NOT NULL DEFAULT nextval('tags_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    quantity integer,
    url_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT tags_pkey PRIMARY KEY (id),
    CONSTRAINT fk_rails_4d35f6a6e1 FOREIGN KEY (url_id)
        REFERENCES public.urls (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)