SELECT 
	clients.*, 
	actual_city.name as actual_city,  
	disability.name as disability_name, 
	martial_status.name as martial_status, 
	nationality.name as nationality 
FROM 
	(
		clients, disability, martial_status, nationality
	) 
	JOIN cities actual_city ON clients.actual_residential_city_id = actual_city.id  
WHERE 
	clients.nationality_id = nationality.id 
	AND clients.disability_id = disability.id 
	AND clients.martial_status_id = martial_status.id
	AND clients.id = ?
  