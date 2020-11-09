package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iesalixar.jmanuellopezh.model.MessageDAOImpl;
import org.iesalixar.jmanuellopezh.model.ReportDAOImpl;
import org.iesalixar.jmanuellopezh.model.User;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class Report
 */
@WebServlet("/Report")
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher rd=request.getRequestDispatcher("user/report.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReportDAOImpl u =new ReportDAOImpl();
		//doGet(request, response);
		HttpSession session = request.getSession();
		String owner = (String)session.getAttribute("Id");
		User reportedobj = (User) session.getAttribute("visit");
		String reported = reportedobj.getId();
		String motive=request.getParameter("motive");
		
		if (!motive.isEmpty()) {//los reportes vacíos no se registran
		u.report(owner, reported, motive);
		}
		response.sendRedirect("user/report.jsp");
			
	}

}
