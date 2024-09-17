select pizza_name 
from menu
UNION
select pizza_name 
from menu
ORDER BY pizza_name DESC;