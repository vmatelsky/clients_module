package com.bsuir.dao;

import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bsuir.utils.DbUtils;
import com.model.City;
import com.model.Client;
import com.model.Disability;
import com.model.MartialStatus;
import com.model.Nationality;

public class ClientDao {
	
	private Connection connection;

    public ClientDao() {
        connection = DbUtils.getConnection();
    }

    public void addClient(Client client) {
    	try {
            String fileAsString = fileAsString("/addClient.sql");
			PreparedStatement preparedStatement = connection.prepareStatement(fileAsString);

			prepareStatementForUser(client, preparedStatement);
            
            preparedStatement.executeUpdate();
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

    }

    public void deleteClient(int clientId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("DELETE FROM clients WHERE id=?");

            preparedStatement.setInt(1, clientId);
            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateClient(Client client) {
        try {
            String fileAsString = fileAsString("/updateClient.sql");
			PreparedStatement preparedStatement = connection.prepareStatement(fileAsString);

			prepareStatementForUser(client, preparedStatement);
			
			preparedStatement.setInt(25, client.getId());
            
            preparedStatement.executeUpdate();
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }

	private void prepareStatementForUser(Client client, PreparedStatement preparedStatement) throws SQLException {
		preparedStatement.setString(1, client.getFirst_name());
		preparedStatement.setString(2, client.getLast_name());
		preparedStatement.setString(3, client.getMiddle_name());
		preparedStatement.setDate(4, new java.sql.Date(client.getBirthday_date().getTime()));
		preparedStatement.setString(5, client.getPassport_series());
		preparedStatement.setString(6, client.getPassport_number());
		preparedStatement.setString(7, client.getPassport_authority());
		preparedStatement.setDate(8, new java.sql.Date(client.getPassport_issue_date().getTime()));
		preparedStatement.setString(9, client.getPassport_identification_number());
		preparedStatement.setString(10, client.getBirthday_place());
		preparedStatement.setInt(11, client.getActual_residential_city_id());
		preparedStatement.setString(12, client.getActual_address());
		preparedStatement.setString(13, client.getHome_phone_number());
		preparedStatement.setString(14, client.getCellular_phone_number());
		preparedStatement.setString(15, client.getEmail());
		preparedStatement.setString(16, client.getPlace_of_work());
		preparedStatement.setString(17, client.getJob_title());
		preparedStatement.setString(18, client.getResidential_address());
		preparedStatement.setInt(19, client.getMartial_status_id());
		preparedStatement.setInt(20, client.getNationality_id());
		preparedStatement.setInt(21, client.getDisability_id());
		preparedStatement.setBoolean(22, client.getIs_retired());
		preparedStatement.setBigDecimal(23, client.getMonthly_income());
	}

    public List<Client> getClients() {
        List<Client> clients = new ArrayList<Client>();
        try {
            Statement statement = connection.createStatement();
            
            String fileAsString = fileAsString("/getAllClients.sql");
			ResultSet rs = statement.executeQuery(fileAsString);
            while (rs.next()) {
                Client client = clientFromResultSet(rs);
                clients.add(client);
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return clients;
    }
    
    public List<City> getCities() {
    	List<City> cities = new ArrayList<City>();
        try {
            Statement statement = connection.createStatement();
            
            
			ResultSet rs = statement.executeQuery("SELECT * FROM cities");
            while (rs.next()) {
                City city = new City();
                city.setId(rs.getInt("id"));
                city.setName(rs.getString("name"));
                
                cities.add(city);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cities;
	}
    
    public List<Disability> getDisabilities() {
    	List<Disability> disabilities = new ArrayList<Disability>();
        try {
            Statement statement = connection.createStatement();
            
			ResultSet rs = statement.executeQuery("SELECT * FROM disability");
            while (rs.next()) {
            	Disability item = new Disability();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                
                disabilities.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return disabilities;
	}
    
    public List<MartialStatus> getMartialStatusList() {
    	List<MartialStatus> list = new ArrayList<MartialStatus>();
        try {
            Statement statement = connection.createStatement();
            
			ResultSet rs = statement.executeQuery("SELECT * FROM martial_status");
            while (rs.next()) {
            	MartialStatus item = new MartialStatus();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
	}
    
    public List<Nationality> getNationalities() {
    	List<Nationality> list = new ArrayList<Nationality>();
        try {
            Statement statement = connection.createStatement();
            
			ResultSet rs = statement.executeQuery("SELECT * FROM nationality");
            while (rs.next()) {
            	Nationality item = new Nationality();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
	}

	private Client clientFromResultSet(ResultSet rs) throws SQLException {
		Client client = new Client();
		client.setId(rs.getInt("id"));
		client.setFirst_name(rs.getString("first_name"));
		client.setLast_name(rs.getString("last_name"));
		client.setMiddle_name(rs.getString("middle_name"));
		client.setBirthday_date(rs.getDate("birthday_date"));
		
		client.setPassport_series(rs.getString("passport_series"));
		client.setPassport_number(rs.getString("passport_number"));
		client.setPassport_authority(rs.getString("passport_authority"));
		client.setPassport_issue_date(rs.getDate("passport_issue_date"));
		client.setPassport_identification_number(rs.getString("passport_identification_number"));
		client.setBirthday_place(rs.getString("birthday_place"));
		client.setActual_residential_city_id(rs.getInt("actual_residential_city_id"));
		client.setActual_address(rs.getString("actual_address"));
		client.setHome_phone_number(rs.getString("home_phone_number"));
		client.setCellular_phone_number(rs.getString("cellular_phone_number"));
		client.setEmail(rs.getString("email"));
		client.setPlace_of_work(rs.getString("place_of_work"));
		client.setJob_title(rs.getString("job_title"));
		client.setResidential_address(rs.getString("residential_address"));
		client.setMartial_status_id(rs.getInt("martial_status_id"));
		client.setNationality_id(rs.getInt("nationality_id"));
		client.setDisability_id(rs.getInt("disability_id"));
		client.setIs_retired(rs.getBoolean("is_retired"));
		client.setMonthly_income(rs.getBigDecimal("monthly_income"));
		
		client.setActual_residential_city(rs.getString("actual_city"));
		client.setMartial_status(rs.getString("martial_status"));
		client.setNationality(rs.getString("nationality"));
		client.setDisability(rs.getString("disability_name"));
		
		return client;
	}

    public Client getById(int clientId) {
    	Client client = new Client();
        try {
        	String fileAsString = fileAsString("/getById.sql");
            PreparedStatement preparedStatement = connection.prepareStatement(fileAsString);
            
            preparedStatement.setInt(1, clientId);
            
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
            	client = clientFromResultSet(rs);
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }

        return client;
    }
    
    public String fileAsString(String filePath) throws IOException {
    	URL resourcePath = DbUtils.class.getClassLoader().getResource(filePath);
    	return new String(Files.readAllBytes(Paths.get(resourcePath.getPath())));
    }

}
