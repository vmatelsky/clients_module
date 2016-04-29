INSERT INTO `clients`(
	`first_name`, `last_name`, `middle_name`, 
	`birthday_date`, `gender`, `passport_series`, 
	`passport_number`, `passport_authority`, 
	`passport_issue_date`, `passport_identification_number`, 
	`birthday_place`, `actual_residential_city_id`, 
	`actual_address`, `home_phone_number`, 
	`cellular_phone_number`, `email`, 
	`place_of_work`, `job_title`, `resirential_city_id`, 
	`residential_address`, `martial_status_id`, 
	`nationality_id`, `disability_id`, 
	`is_retired`, `monthly_income`, 
	`is_reservist`
) 
VALUES 
	(
		?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
	)