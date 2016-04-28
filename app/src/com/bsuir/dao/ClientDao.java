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
import com.model.Client;

public class ClientDao {
	
	private Connection connection;

    public ClientDao() {
        connection = DbUtils.getConnection();
    }

    public void addClient(Client client) {
        // TODO:
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
        // TODO:
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

	private Client clientFromResultSet(ResultSet rs) throws SQLException {
		Client client = new Client();
		client.setId(rs.getInt("id"));
		client.setFirst_name(rs.getString("first_name"));
		client.setLast_name(rs.getString("last_name"));
		client.setMiddle_name(rs.getString("middle_name"));
		client.setBirthday_date(rs.getDate("birthday_date"));
		
		client.setGender(rs.getString("gender"));
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
		client.setResirential_city_id(rs.getInt("resirential_city_id"));
		client.setResidential_address(rs.getString("residential_address"));
		client.setMartial_status_id(rs.getInt("martial_status_id"));
		client.setNationality_id(rs.getInt("nationality_id"));
		client.setDisability_id(rs.getInt("disability_id"));
		client.setIs_retired(rs.getBoolean("is_retired"));
		client.setMonthly_income(rs.getDouble("monthly_income"));
		client.setIs_reservist(rs.getBoolean("is_reservist"));
		
		client.setActual_residential_city(rs.getString("actual_city"));
		client.setResirential_city(rs.getString("residential_city"));
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
