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
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Register.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd=request.getRequestDispatcher("admin/createuser.jsp");  
		  
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
		String role="2";
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String area=request.getParameter("area");
		String pic=request.getParameter("pic");
		String description=request.getParameter("description");
		
		
		if(password.equals(repeatpassword)){//compruebo que los password sean iguales por segunda vez (solo por seguridad, el cliente lo hace por JS)
			//compruebo que el email no exista ya en la BD. El email es la clave candidata y es UNICO
			if(us.checkExistingUser(email)==false) {
				us.create(email, password, role, name, age, gender, area, pic, description);
					logger.info("Tenemos nuevo usuario creado por administracion en la aplicación!");
				
			}
			
		}
		response.sendRedirect("ReadAll");
		
	}


}
