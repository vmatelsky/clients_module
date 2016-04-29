package com.module.clients;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	private static String ACTION_CLIENTS = "clients";
	private static String ACTION_VIEW = "view";
	private static String ACTION_EDIT = "edit";
	private static String ACTION_INSERT = "insert";
	private static String ACTION_DELETE = "delete";
	
	
	private static String INSERT_OR_EDIT = "/client.jsp";
	private static String VIEW = "/view_client.jsp";
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
		
		if (ACTION_CLIENTS.equalsIgnoreCase(action)) {
			forward = CLIENTS;
			List<Client> clients = dao.getClients();
			request.setAttribute("clients", clients);
			
		} else if (ACTION_INSERT.equalsIgnoreCase(action)) {
			forward = INSERT_OR_EDIT;
			request.setAttribute("cities", dao.getCities());
			request.setAttribute("nationalities", dao.getNationalities());
			request.setAttribute("marital_status", dao.getMartialStatusList());
			request.setAttribute("disabilities", dao.getDisabilities());
			
		} else if (ACTION_EDIT.equalsIgnoreCase(action)) {
			forward = INSERT_OR_EDIT;
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			Client client = dao.getById(clientId);
			request.setAttribute("client", client);
			request.setAttribute("cities", dao.getCities());
			request.setAttribute("nationalities", dao.getNationalities());
			request.setAttribute("marital_status", dao.getMartialStatusList());
			request.setAttribute("disabilities", dao.getDisabilities());
			
		} else if (ACTION_DELETE.equalsIgnoreCase(action)) {
			forward = CLIENTS;
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			dao.deleteClient(clientId);
			List<Client> clients = dao.getClients();
			request.setAttribute("clients", clients);
			
		} else if (ACTION_VIEW.equalsIgnoreCase(action)) {
			forward = VIEW;
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			Client client = dao.getById(clientId);
			request.setAttribute("client", client);
			request.setAttribute("cities", dao.getCities());
			request.setAttribute("nationalities", dao.getNationalities());
			request.setAttribute("marital_status", dao.getMartialStatusList());
			request.setAttribute("disabilities", dao.getDisabilities());
			
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
		Client client = clientFromRequest(request);
		
		String clientId = request.getParameter("id");
		
		if (clientId == null || clientId.isEmpty()) {
			dao.addClient(client);
		} else {
			client.setId(Integer.parseInt(clientId));
			dao.updateClient(client);
		}
		
		doGet(request, response);
	}
	
	private Client clientFromRequest(HttpServletRequest request) {
		Client client = new Client();
		
		try {
			request.setCharacterEncoding("cp1251");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		client.setFirst_name(request.getParameter("first_name"));
		client.setLast_name(request.getParameter("last_name"));
		client.setMiddle_name(request.getParameter("middle_name"));
		client.setBirthday_date(dateFromRequest(request, "birthday_date"));
		
		client.setGender(request.getParameter("gender"));
		client.setPassport_series(request.getParameter("passport_series"));
		client.setPassport_number(request.getParameter("passport_number"));
		client.setPassport_authority(request.getParameter("passport_authority"));
		client.setPassport_issue_date(dateFromRequest(request, "passport_issue_date"));
		client.setPassport_identification_number(request.getParameter("passport_identification_number"));
		client.setBirthday_place(request.getParameter("birthday_place"));
		client.setActual_residential_city_id(Integer.parseInt(request.getParameter("actual_residential_city_id")));
		client.setActual_address(request.getParameter("actual_address"));
		client.setHome_phone_number(request.getParameter("home_phone_number"));
		client.setCellular_phone_number(request.getParameter("cellular_phone_number"));
		client.setEmail(request.getParameter("email"));
		client.setPlace_of_work(request.getParameter("place_of_work"));
		client.setJob_title(request.getParameter("job_title"));
		client.setResirential_city_id(Integer.parseInt(request.getParameter("resirential_city_id")));
		client.setResidential_address(request.getParameter("residential_address"));
		client.setMartial_status_id(Integer.parseInt(request.getParameter("martial_status_id")));
		client.setNationality_id(Integer.parseInt(request.getParameter("nationality_id")));
		client.setDisability_id(Integer.parseInt(request.getParameter("disability_id")));
		client.setIs_retired(Boolean.parseBoolean(request.getParameter("is_retired")));
		client.setMonthly_income(Double.parseDouble(request.getParameter("monthly_income")));
		client.setIs_reservist(Boolean.parseBoolean(request.getParameter("is_reservist")));
		
		client.setActual_residential_city(request.getParameter("actual_city"));
		client.setResirential_city(request.getParameter("residential_city"));
		client.setMartial_status(request.getParameter("martial_status"));
		client.setNationality(request.getParameter("nationality"));
		client.setDisability(request.getParameter("disability_name"));
		
		return client;
	}
	
	private Date dateFromRequest(HttpServletRequest request, String parameterName) {
		Date date = null;
		try {
			date = new SimpleDateFormat("MM/dd/yyyy").parse(request.getParameter(parameterName));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return date;
	}

}
