package com.bsuir.dao;

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

    public void deleteClient(Client client) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("DELETE FROM clients WHERE id=?");

            preparedStatement.setInt(1, client.getId());
            
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
            ResultSet rs = statement.executeQuery("SELECT * FROM clients");
            while (rs.next()) {
                Client client = new Client();
                client.setId(rs.getInt("id"));
                client.setFirst_name(rs.getString("first_name"));
                client.setLast_name(rs.getString("last_name"));
                client.setMiddle_name(rs.getString("middle_name"));
                client.setBirthday_date(rs.getDate("birthday_date"));

                // TODO: add the rest fields
                
                clients.add(client);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return clients;
    }

    public Client getById(int clientId) {
    	Client client = new Client();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("SELECT * FROM clients WHERE id=?");
            
            preparedStatement.setInt(1, clientId);
            
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                client.setId(rs.getInt("id"));
                client.setFirst_name(rs.getString("first_name"));
                client.setLast_name(rs.getString("last_name"));
                client.setMiddle_name(rs.getString("middle_name"));
                client.setBirthday_date(rs.getDate("birthday_date"));
                
                // TODO: add the rest fields
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return client;
    }

}
