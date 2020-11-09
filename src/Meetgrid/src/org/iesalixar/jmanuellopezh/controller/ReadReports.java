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
import org.iesalixar.jmanuellopezh.model.Report;
import org.iesalixar.jmanuellopezh.model.ReportDAOImpl;

/**
 * Servlet implementation class ReadReports
 */
@WebServlet("/ReadReports")
public class ReadReports extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReadReports() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'ReadReports' has been invoked!");
		
		List<Report> lista = ReportDAOImpl.readReports();
		
		HttpSession session = request.getSession();
		session.setAttribute("reports", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("admin/reports.jsp");  
		  
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
