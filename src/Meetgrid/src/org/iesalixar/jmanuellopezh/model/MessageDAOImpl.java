package org.iesalixar.jmanuellopezh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.iesalixar.jmanuellopezh.helper.ConnectionDB;

public class MessageDAOImpl implements MessageDAO{
	
	//LEE LOS MENSAJES ENTRE EL USUARIO Y UN USUARIO VISITADO
		public static List<Message> readMessages(String sender, String receiver) {

			List<Message> messages = null;
			try {
				Connection con = ConnectionDB.conectarMySQL();
				Statement s = con.createStatement();
				ResultSet rs = s.executeQuery("select * from message where (sender = "+sender+" OR sender ="+receiver+") AND (receiver = "+receiver+" OR receiver="+sender+") ORDER BY date desc"); 
				messages = new ArrayList<Message>();

				while (rs.next()) {
					Message m = new Message(rs.getString("id"), rs.getString("sender"),rs.getString("receiver"),rs.getString("content"), rs.getString("pic"),rs.getString("date"));
					messages.add(m);
				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return messages;
		}
		
		@Override
		public void create(String sender, String receiver, String content, String pic) {
			
			try {
				
				//metodo para que no se envie mensajes a usuarios que te han bloqueado
				if(!UserDAOImpl.checkBlocked(receiver, sender)) {
				Connection c = ConnectionDB.conectarMySQL();
				PreparedStatement stmt = c.prepareStatement(
						"INSERT INTO message (sender, receiver, content, pic, date) VALUES ('" + sender + "','" + receiver + "','"+ content +"','"+pic+"', LOCALTIMESTAMP())");
				

				stmt.executeUpdate();
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			

		}
		
		//devolver mensajes recientes, 48h
		public static List<Message> readLastMessages(String receiver) {

			List<Message> messages = null;
			try {
				Connection con = ConnectionDB.conectarMySQL();
				Statement s = con.createStatement();
				ResultSet rs = s.executeQuery("select * from message where receiver = "+receiver+" && date > DATE_SUB(CURDATE(), INTERVAL 2 DAY)"); 
				messages = new ArrayList<Message>();

				while (rs.next()) {
					Message m = new Message(rs.getString("id"), rs.getString("sender"),rs.getString("receiver"),rs.getString("content"), rs.getString("pic"),rs.getString("date"));
					messages.add(m);

				}
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return messages;
		}
		
				public static String readSenderName(String sender) {
					
					String name = null;

					try {
						Connection con = ConnectionDB.conectarMySQL();
						PreparedStatement stmt = con.prepareStatement("select user.name from user inner join message on message.sender = user.id where message.sender=?"); 
						stmt.setString(1, sender);
						ResultSet rs = stmt.executeQuery();
						while (rs.next())
							name = rs.getString(1);

						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return name;
				}

}
