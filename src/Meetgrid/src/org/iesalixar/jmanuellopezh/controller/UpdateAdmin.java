package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;

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
 * Servlet implementation class UpdateAdmin
 */
@WebServlet("/UpdateAdmin")
public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	
			UserDAOImpl user = new UserDAOImpl();	    
			User u = user.readUserById(request.getParameter("visit"));
			HttpSession session = request.getSession();
			session.setAttribute("visit", u);
		    RequestDispatcher rd=request.getRequestDispatcher("admin/update.jsp");  
			  
			rd.forward(request, response);//method may be include or forward 

			 logger.info("Un admin ha accedido al un perfil con intención de modificarlo");

		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/// primero selecciona el tipo de contenidos y otros campos de cabecera de la respuesta
	    response.setContentType("text/html");

	    String password=(request.getParameter("password"));
	    String name=(request.getParameter("name"));
	    String age=request.getParameter("age");
	    String gender=request.getParameter("gender");
	    String area=request.getParameter("area");
	    String pic=request.getParameter("pic");
	    String description=request.getParameter("description");
	    String id=request.getParameter("id");
	    
	    UserDAOImpl user = new UserDAOImpl();
	    user.update(password, name, age, gender, area, pic, description, id);
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("visit", user.readUserById(id));//guardo los nuevos datos actualizados en el perfil guardado en la sesion
	    
	    logger.info("Un usuario ha modificado su perfil.");
	    response.sendRedirect("ReadReports");
	}

}
