package com.module.clients;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientsController
 */
@WebServlet("/ClientsController")
public class ClientsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static String CLIETN = "/client.jsp";
	private static String CLIETNS = "/clients.jsp";
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientsController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		
		if (action.equalsIgnoreCase("clients")) {
			forward = CLIETNS;
//			request.setAttribute("users", dao.getAllUsers());
		} if (action.equalsIgnoreCase("insert")) {
			forward = CLIETN;
//			request.setAttribute("users", dao.getAllUsers());
		} else {
			forward = CLIETNS;
		}
		
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
//		response.setContentType("text/html");
//        PrintWriter printWriter = response.getWriter();
//        printWriter.println("<h1>Hello World!</h1>");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
