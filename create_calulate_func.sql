CREATE OR REPLACE PROCEDURE public.sum_net_total()
	LANGUAGE plpgsql
AS $procedure$
	begin
		insert into total_netsale (
			customer_id,
			first_name,
			last_name,
			total_sale_thb,
			tax_thb,
			shipping_thb
		)
		(select 
			c.customer_id, 
			c.first_name, 
			c.last_name, 
			36*sum(total) as total_sale_thb, 
			36*sum(tax) as tax_thb, 
			36*sum(shipping) as shipping_thb 
		from customer c 
		join net_sale ns on c.customer_id =  ns.customer_id 
		group by c.customer_id, c.first_name, c.last_name)
		on conflict (
		 customer_id
		) 
		do update set 
		first_name = EXCLUDED.first_name,
		last_name = EXCLUDED.last_name,
		total_sale_thb = EXCLUDED.total_sale_thb,
		tax_thb = EXCLUDED.tax_thb,
		shipping_thb = EXCLUDED.shipping_thb,
		update_date  = EXCLUDED.update_date;
	

	END;
$procedure$
;
