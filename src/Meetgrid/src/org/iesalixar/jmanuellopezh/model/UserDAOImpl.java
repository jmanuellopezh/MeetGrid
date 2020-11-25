package org.iesalixar.jmanuellopezh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.iesalixar.jmanuellopezh.helper.ConnectionDB;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAOImpl implements UserDAO {
	
	//REVISA SI EL USUARIO CUYO EMAIL Y PASS SE DA EN LOGIN EXISTE O NO EN LA BD
	@Override
	public boolean checkUser(String email, String password) {
		UserDAOImpl userdao = new UserDAOImpl();
		String hashed = null;

		boolean found = false;
		Connection c = ConnectionDB.conectarMySQL();
		try {
			//localizo el usuario por su clave candidata email y cojo su password
			PreparedStatement stmt = c
					.prepareStatement("select password from user where email=?");
			stmt.setString(1, email);

			ResultSet rs = stmt.executeQuery();
			while (rs.next())
				//guardo la contraseña encriptada
				hashed = rs.getString(1);

			rs.close();
			//compruebo que el password introducido coincida con el encriptado, desencriptandolo
			
			if (userdao.checkExistingUser(email)) {
				found = (BCrypt.checkpw(password, hashed));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return found;
	}
	
	//DEVUELVE EL VALOR DE LA ID PARA EL USUARIO QUE HA INICIADO SESION. PUEDE SER VALIOSO PARA GUARDARLO EN SESSION
	@Override
	public String checkId(String email) {
		

		Connection c = ConnectionDB.conectarMySQL();
		String id = null;
		try {
			PreparedStatement stmt = c.prepareStatement("select id from user where email=?");
			stmt.setString(1, email);

			ResultSet rs = stmt.executeQuery();
			while (rs.next())
				id = rs.getString(1);

			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

			return id;
	
	}

	//VERIFICA EL ROL DEL USUARIO Y DEVUELVE EL VALOR DE ESTE
	@Override
	public String checkRole(String email) {
		

		
		Connection c = ConnectionDB.conectarMySQL();
		String role = null;
		try {
			PreparedStatement stmt = c.prepareStatement("select role.type from role inner join user on user.role = role.id where user.email=?");
			stmt.setString(1, email);

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
		
		//encripto la contraseña
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
		
		try {
			Connection c = ConnectionDB.conectarMySQL();
			PreparedStatement stmt = c.prepareStatement(
					"INSERT INTO user (email, password, role, name, age, gender, area, pic, description) VALUES ('" + email + "','" + hashed + "','"+ role +"','"+ name + "','" + age + "','"+ gender+"','"+ area + "','"+ pic+"','"+ description + "')");

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
	
	//DEVUELVE SI UN favorito YA EXISTE O NO, EVALUANDO EL EMAIL
	@Override
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
		@Override
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
				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			

			return users;
		}
		
				
				
				//LEE LOS DATOS DE UN USUARIO EN CONCRETO, EL QUE SE LE PASA EL id POR PARAMETRO
			@Override
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
				return user;
				}
				
				@Override
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
				
				@Override
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
						}
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					

					return users;
				}
				
				@Override
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
				
				@Override
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
				
				@Override
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
				
				public static String getEmailById(String id) {
					Connection c = ConnectionDB.conectarMySQL();
					String email = null;
					try {
						PreparedStatement stmt = c.prepareStatement("select name from user where id=?");
						stmt.setString(1, id);
						
						ResultSet rs = stmt.executeQuery();
						while (rs.next())
							email = rs.getString(1);

						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return email;
					
				}
				
				@Override
				public void deleteUser(String id) {
					try{
						Connection con = ConnectionDB.conectarMySQL();
						Statement stmt = con.createStatement();
						
						boolean borrado = stmt.execute("DELETE FROM user WHERE id ="+id);
						System.out.println("DELETE FROM user WHERE id ="+id);
						
						if (borrado){
							System.out.println("Usuario eliminado");
						}
						stmt.close();
					}catch (SQLException ex){
						System.out.println(ex);
						
					}
					
				}
				
				//en owner se mete el id del usuario visitado y en blocked el del que haya iniciado sesion
				public static boolean checkBlocked(String owner, String blocked) {

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
				
				@Override
				public List<User> readBlocks(String owner) {

					List<User> users = null;
					try {
						Connection con = ConnectionDB.conectarMySQL();
						Statement s = con.createStatement(); 
						ResultSet rs = s.executeQuery("select * from user inner join block on user.id = block.blocked WHERE block.owner = '"+owner+"'");
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
				
				@Override
				public void deleteBlock(String owner, String deleted) {
					try{
						Connection con = ConnectionDB.conectarMySQL();
						Statement stmt = con.createStatement();
						
						boolean borrado = stmt.execute("DELETE FROM block WHERE owner ="+owner+" and blocked ="+deleted);
						
						if (borrado){
							System.out.println("Usuario desbloqueado");
						}
						stmt.close();
					}catch (SQLException ex){
						System.out.println(ex);
						
					}
					
				}
				
				@Override
				public void update(String password, String name, String age, String gender, String area, String pic, String description, String id) {
					try{
						Connection con = ConnectionDB.conectarMySQL();
						Statement stmt = con.createStatement();
						
						if (password != null && !password.isEmpty()) {
							
							//encripto la contraseña
							String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
							
							stmt.execute(	"UPDATE user SET password = '" +hashed+ "' WHERE id = "+id+"");

						}
						if (name != null && !name.isEmpty()) {
							stmt.execute(	"UPDATE user SET name = '" +name+ "' WHERE id = "+id+"");
						}
						if (age != null && !age.isEmpty()) {
							stmt.execute(	"UPDATE user SET age = " +age+ " WHERE id = "+id+"");
						}
						if (gender != null && !gender.isEmpty()) {
							stmt.execute(	"UPDATE user SET gender = '" +gender+ "' WHERE id = "+id+"");
						}
						if (area != null && !area.isEmpty()) {
							stmt.execute(	"UPDATE user SET area = '" +area+ "' WHERE id = "+id+"");
						}
						if (pic != null && !pic.isEmpty()) {
							stmt.execute(	"UPDATE user SET pic = '" +pic+ "' WHERE id = "+id+"");
						}
						if (description != null && !description.isEmpty()) {
							stmt.execute(	"UPDATE user SET description = '" +description+ "' WHERE id = "+id+"");
						}

						stmt.close();
					}catch (SQLException ex){
						System.out.println(ex);
						
					}
					
				}
				
				

}
