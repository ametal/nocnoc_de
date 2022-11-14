CREATE TABLE public.total_netsale (
	customer_id int4 NOT NULL,
	first_name varchar(300) NOT NULL,
	last_name varchar(300) NOT NULL,
	total_sale_thb float8 NOT NULL DEFAULT 0,
	shipping_thb float8 NOT NULL DEFAULT 0,
	tax_thb float8 NOT NULL DEFAULT 0,
	create_date timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	update_date timestamp NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX total_netsale_customer_id_idx ON public.total_netsale USING btree (customer_id);