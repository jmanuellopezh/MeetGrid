package org.iesalixar.jmanuellopezh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.log4j.Logger;
import org.iesalixar.jmanuellopezh.model.UserDAOImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(Login.class);
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		rs.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("'Login' has been invoked!");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		Cookie ck = null;
		session.setAttribute("Authorized", null);
		
		UserDAOImpl user = new UserDAOImpl();
		session.setAttribute("userDAOImpl", user);
		
		if (user.checkUser(email, password)) {
			ck = new Cookie("user", email);
			ck.setMaxAge(3*60);
			response.addCookie(ck);
			session.setAttribute("Authorized", "yes");
			session.setAttribute("username", email);
			if (user.checkRole(email, password).equals("admin")) {
				session.setAttribute("admin", email);
				session.setAttribute("Id", user.checkId(email, password));//con esto saco la id del user para poder hacer visionado de solo sus juegos
				logger.info("An admin has logged in");
				response.sendRedirect("ReadGamesAdmin");
			}else if (user.checkRole(email, password).equals("user")) {
				session.setAttribute("user", email);
				session.setAttribute("Id", user.checkId(email, password));//con esto saco la id del user para poder hacer visionado de solo sus juegos
				logger.info("A user has logged in");
				response.sendRedirect("user/grid.jsp");
			}else {
				session.setAttribute("visitor", email);
				logger.info("We have a visitor");
				response.sendRedirect("register.jsp");
			}
			
		} else {
			
			session.invalidate();
            request.setAttribute("errorMessage", "Usuario y/o contrase�a inv�lido.");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);  
			
		}
	}

}