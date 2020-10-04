package org.iesalixar.jmanuellopezh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpRequest;
import org.iesalixar.jmanuellopezh.helper.ConnectionDB;

public class UserDAOImpl implements UserDAO {
	
	//REVISA SI EL USUARIO CUYO EMAIL Y PASS SE DA EN LOGIN EXISTE O NO EN LA BD
	@Override
	public boolean checkUser(String email, String password) {

		boolean found = false;
		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("select email, password from user where email=? and password=?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			found = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return found;
	}
	
	//DEVUELVE EL VALOR DE LA ID PARA EL USUARIO QUE HA INICIADO SESION. PUEDE SER VALIOSO PARA GUARDARLO EN SESSION
	@Override
	public String checkId(String email, String password) {
		Connection c = ConnectionDB.conectarMySQL();
		String id = null;
		try {
			PreparedStatement stmt = c.prepareStatement("select id from user where email=? and password=?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
				id = rs.getString(1);

			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("El id del usuario que ha iniciado sesión es "+id);
		return id;
	}

	//VERIFICA EL ROL DEL USUARIO Y DEVUELVE EL VALOR DE ESTE
	@Override
	public String checkRole(String email, String password) {
		Connection c = ConnectionDB.conectarMySQL();
		String role = null;
		try {
			PreparedStatement stmt = c.prepareStatement("select role.type from role inner join user on user.role = role.id where user.email=? and user.password=?");
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			while (rs.next())
				role = rs.getString(1);

			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("El rol del usuario que ha iniciado sesión es "+role);
		return role;
	}
	
	//LEE LOS USUARIOS CON ROL USER DE NUESTRA BD (UTIL PARA EL GRID, NO LO USO EN ESTA VERSIÓN)
	public static List<User> readUser() {

		List<User> users = null;
		try {
			Connection con = ConnectionDB.conectarMySQL();
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("select * from user where role = 2"); //UTIL REVISAR SIN INNER JOIN?
			
			users = new ArrayList<User>();

			while (rs.next()) {
				User u = new User(rs.getString("id"), rs.getString("email"),rs.getString("password"),rs.getString("name"),rs.getString("role"),rs.getString("age"),rs.getString("gender"),rs.getString("area"),rs.getString("pic"),rs.getString("description"));
				users.add(u);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

		return users;
	}
	
	
	//CREA USUARIO
	@Override
	public void create(String email, String password, String role, String name, String age, String gender, String area, String pic, String description) {
		try {
			Connection c = ConnectionDB.conectarMySQL();
			PreparedStatement stmt = c.prepareStatement(
					"INSERT INTO user (email, password, role, name, age, gender, area, pic, description) VALUES ('" + email + "','" + password + "','"+ role +"','"+ name + "','" + age + "','"+ gender+"','"+ area + "','"+ pic+"','"+ description + "')");

			stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	//DEVUELVE SI UN USUARIO YA EXISTE O NO, EVALUANDO EL EMAIL
	@Override
	public boolean checkExistingUser(String email) {

		boolean found = false;
		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("select email from user where email=?");
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			found = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return found;
	}

}
