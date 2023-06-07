SELECT 
    m.name AS menu_name
FROM 
    little_lemon_db.Menu AS m
WHERE 
    m.id = ANY (SELECT 
                    o.menu_id 
                FROM 
                    little_lemon_db.Orders AS o 
                WHERE 
                    o.quantity > 2);
