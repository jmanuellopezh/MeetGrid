package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.iesalixar.jmanuellopezh.model.User;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class ReadAll
 */
@WebServlet("/ReadAll")
public class ReadAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Register.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'ReadAll' has been invoked!");
		
		HttpSession session = request.getSession();

		UserDAOImpl user = new UserDAOImpl();
		List<User> lista = user.readUser();
		
		
		session.setAttribute("allprofiles", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("admin/readall.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
