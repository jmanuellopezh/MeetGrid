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
			ResultSet rs = s.executeQuery("select * from user where role = 1"); //UTIL REVISAR SIN INNER JOIN?
			
			users = new ArrayList<User>();

			while (rs.next()) {
				User u = new User(rs.getString("id"), rs.getString("email"),rs.getString("password"),rs.getString("role"),rs.getString("name"),rs.getString("age"),rs.getString("gender"),rs.getString("area"),rs.getString("pic"),rs.getString("description"));
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
	
	//DEVUELVE SI UN USUARIO YA EXISTE O NO, EVALUANDO EL EMAIL

		public boolean checkExistingFavorite(String owner, String favorited) {

			boolean found = false;
			Connection c = ConnectionDB.conectarMySQL();
			try {
				PreparedStatement stmt = c
						.prepareStatement("select * from favorite where owner=? and favorited=?");
				stmt.setString(1, owner);
				stmt.setString(2, favorited);
				ResultSet rs = stmt.executeQuery();
				found = rs.next();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return found;
		}
	
	//LEE LOS USUARIOS SEGÚN EL FILTRO DEL GRID
		public List<User> readByFilter(String gender, String area, String min, String max, String id) {

			List<User> users = null;
			try {
				Connection con = ConnectionDB.conectarMySQL();
				Statement s = con.createStatement();
				//Query que aplica los filtros y devuelve todos los usuarios que coincidan MENOS EL MISMO USUARIO 
				ResultSet rs = s.executeQuery("select * from user WHERE age between "+min+" AND "+max+" AND lower(gender) like lower('"+gender+"') AND lower(area) like lower('"+area+"') AND role = 2 AND id != "+id+"");
				users = new ArrayList<User>();

				while (rs.next()) {
					User u = new User(rs.getString("id"), rs.getString("email"),rs.getString("password"),rs.getString("role"),rs.getString("name"),rs.getString("age"),rs.getString("gender"),rs.getString("area"),rs.getString("pic"),rs.getString("description"));
					users.add(u);
					System.out.println(u.toString());
				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			

			return users;
		}
		
				
				
				//LEE LOS DATOS DE UN USUARIO EN CONCRETO, EL QUE SE LE PASA EL id POR PARAMETRO
				public User readUserById(String id) {
					Connection c = ConnectionDB.conectarMySQL();
					User user = null;
					try {
						PreparedStatement stmt = c.prepareStatement("select * from user where id=?");
						stmt.setString(1, id);
						
						ResultSet rs = stmt.executeQuery();
						while (rs.next())
							user = new User(rs.getString("id"), rs.getString("email"),rs.getString("password"),rs.getString("role"),rs.getString("name"),rs.getString("age"),rs.getString("gender"),rs.getString("area"),rs.getString("pic"),rs.getString("description"));

						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					System.out.println(user.toString());
					return user;
				}
				
				public void makeFavorite(String owner, String favorited) {
					try {
						Connection c = ConnectionDB.conectarMySQL();
						PreparedStatement stmt = c.prepareStatement(
								"INSERT INTO favorite (owner, favorited) VALUES ('" + owner + "','" + favorited +"')");

						stmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
				
				public List<User> readFavorites(String owner) {

					List<User> users = null;
					try {
						Connection con = ConnectionDB.conectarMySQL();
						Statement s = con.createStatement(); 
						ResultSet rs = s.executeQuery("select * from user inner join favorite on user.id = favorite.favorited WHERE favorite.owner = '"+owner+"'");
						users = new ArrayList<User>();

						while (rs.next()) {
							User u = new User(rs.getString("id"), rs.getString("email"),rs.getString("password"),rs.getString("role"),rs.getString("name"),rs.getString("age"),rs.getString("gender"),rs.getString("area"),rs.getString("pic"),rs.getString("description"));
							users.add(u);
							System.out.println(u.toString());
						}
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					

					return users;
				}
				
				public void report(String owner, String reported, String motive) {
					try {
						Connection c = ConnectionDB.conectarMySQL();
						PreparedStatement stmt = c.prepareStatement(
								"INSERT INTO report (owner, reported, motive, date) VALUES ('" + owner + "','" + reported + "','"+ motive +"', LOCALTIMESTAMP())");

						stmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
				
				public boolean checkExistingBlocked(String owner, String blocked) {

					boolean found = false;
					Connection c = ConnectionDB.conectarMySQL();
					try {
						PreparedStatement stmt = c
								.prepareStatement("select * from block where owner=? and blocked=?");
						stmt.setString(1, owner);
						stmt.setString(2, blocked);
						ResultSet rs = stmt.executeQuery();
						found = rs.next();
					} catch (SQLException e) {
						e.printStackTrace();
					}

					return found;
				}
				
				public void block(String owner, String blocked) {
					try {
						Connection c = ConnectionDB.conectarMySQL();
						PreparedStatement stmt = c.prepareStatement(
								"INSERT INTO block (owner, blocked) VALUES ('" + owner + "','" + blocked + "')");

						stmt.executeUpdate();

					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
				
				public void deleteFavorite(String owner, String deleted) {
					try{
						Connection con = ConnectionDB.conectarMySQL();
						Statement stmt = con.createStatement();
						
						boolean borrado = stmt.execute("DELETE FROM favorite WHERE owner ="+owner+" and favorited ="+deleted);
						
						if (borrado){
							System.out.println("Favorito eliminado");
						}
						stmt.close();
					}catch (SQLException ex){
						System.out.println(ex);
						
					}
					
				}

}
