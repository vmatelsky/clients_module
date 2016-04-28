package com.module.clients;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsuir.dao.ClientDao;
import com.model.Client;

/**
 * Servlet implementation class ClientsController
 */
@WebServlet("/ClientsController")
public class ClientsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static String INSERT_OR_EDIT = "/client.jsp";
	private static String CLIENTS = "/clients.jsp";
	
	
	private ClientDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientsController() {
        super();
        dao = new ClientDao();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("clients")) {
			forward = CLIENTS;
			List<Client> clients = dao.getClients();
			request.setAttribute("clients", clients);
		} if (action.equalsIgnoreCase("insert")) {
			forward = INSERT_OR_EDIT;
		} if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			Client client = dao.getById(clientId);
			request.setAttribute("client", client);
		} else if (action.equalsIgnoreCase("delete")) {
			forward = CLIENTS;
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			dao.deleteClient(clientId);
			List<Client> clients = dao.getClients();
			request.setAttribute("clients", clients);
		} else {
			forward = CLIENTS;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
