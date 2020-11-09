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
 * Servlet implementation class ReadUsersByFilter
 */
@WebServlet("/ReadUsersByFilter")
public class ReadUsersByFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadUsersByFilter() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
		logger.info("'ReadUsersByFilter' has been invoked!");
		String min = request.getParameter("min");
		String max = request.getParameter("max");
		String area = request.getParameter("area");
		String gender = request.getParameter("gender");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("Id");
		
		UserDAOImpl user = new UserDAOImpl();
		List<User> lista = user.readByFilter(gender, area, min, max, id);
		
		session.setAttribute("lista", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("user/grid.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 

	    logger.info("Un usuario ha accedido al grid");

	} catch (ServletException e) {
		e.printStackTrace();
	}
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher rd=request.getRequestDispatcher("user/grid.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

}
