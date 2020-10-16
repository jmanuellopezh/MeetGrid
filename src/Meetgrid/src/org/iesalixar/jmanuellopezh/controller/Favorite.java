package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.iesalixar.jmanuellopezh.model.Message;
import org.iesalixar.jmanuellopezh.model.MessageDAOImpl;
import org.iesalixar.jmanuellopezh.model.User;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class Favorite
 */
@WebServlet("/Favorite")
public class Favorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Register.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Favorite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'Favorite' has been invoked!");
		
		HttpSession session = request.getSession();
		String owner = (String)session.getAttribute("Id");
		
		
		UserDAOImpl user = new UserDAOImpl();
		List<User> lista = user.readFavorites(owner);
		
		
		session.setAttribute("favorites", lista);
	    
	    RequestDispatcher rd=request.getRequestDispatcher("user/favorites.jsp");  
		  
		rd.forward(request, response);//method may be include or forward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAOImpl us =new UserDAOImpl();
	
		doGet(request, response);
		HttpSession session = request.getSession();
		String owner = (String)session.getAttribute("Id");
		User favoritedobj = (User) session.getAttribute("visit");
		String favorited = favoritedobj.getId();
		
		if ((us.checkExistingFavorite(owner, favorited))==false) {
		
		us.makeFavorite(owner, favorited);
		logger.info("El usuario id "+ owner + " hizo favorito al usuario "+favorited);
		response.sendRedirect("Favorite");
		}else {
			logger.info("No se puede hacer favorito al mismo usuario dos veces");
			response.sendRedirect("Favorite");
		}
		
	}

}
