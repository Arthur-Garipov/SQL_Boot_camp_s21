WITH last_rate_cte as (
	SELECT
		currency.id,
		currency.name,
		currency.rate_to_usd as last_rate
	FROM currency
	WHERE currency.updated IN (SELECT MAX(currency.updated) FROM currency)
), volume as (
	select user_id, balance.type, sum(money) as volume
	from balance
	group by user_id, balance.type
) 
SELECT 
    COALESCE("user".name, 'not defined') as name, 
    COALESCE("user".lastname, 'not defined') as lastname, 
    balance.type, 
    volume.volume, 
    COALESCE(currency.name, 'not defined') AS currency_name, 
    COALESCE(last_rate_cte.last_rate, 1) AS last_rate_to_usd,
	volume.volume * COALESCE(last_rate_cte.last_rate, 1) AS total_volume_in_usd
FROM balance
FULL JOIN currency on currency.id = balance.currency_id
FULL JOIN "user" ON "user".id = balance.user_id
FULL JOIN last_rate_cte ON balance.currency_id = last_rate_cte.id
FULL JOIN volume on volume.user_id = balance.user_id and volume.type = balance.type
GROUP BY  
"user".id, 
"user".name, 
"user".lastname, 
balance.type, 
currency.name, 
last_rate_cte.last_rate, 
volume.volume, 
balance.user_id
ORDER BY 1 desc, 2, 3