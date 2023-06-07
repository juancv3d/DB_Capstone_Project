SELECT 
    c.id AS customer_id, 
    c.name AS full_name, 
    o.id AS order_id, 
    o.total_cost AS cost, 
    m.description AS menu_description
FROM 
    little_lemon_db.Customer AS c
JOIN 
    little_lemon_db.Orders AS o ON c.id = o.customer_id
JOIN 
    little_lemon_db.Menu AS m ON o.menu_id = m.id
WHERE 
    o.total_cost > 150
ORDER BY 
    o.total_cost ASC;
