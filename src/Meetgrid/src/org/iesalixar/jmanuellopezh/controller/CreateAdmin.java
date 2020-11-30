package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class CreateAdmin
 */
@WebServlet("/CreateAdmin")
public class CreateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Register.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd=request.getRequestDispatcher("admin/createadmin.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAOImpl us =new UserDAOImpl();

		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String repeatpassword=request.getParameter("repeatpassword");
		String name=request.getParameter("name");
		
		if(password.equals(repeatpassword)){//compruebo que los password sean iguales por segunda vez (solo por seguridad, el cliente lo hace por JS)
			//compruebo que el email no exista ya en la BD. El email es la clave candidata y es UNICO
			if(us.checkExistingUser(email)==false) {
				us.createAdmin(email, password, name);
				logger.info("Tenemos nuevo ADMINISTRADOR en la aplicación!");
				
			}
			
		}
		response.sendRedirect("ReadReports");
		
		
	
	}

}
