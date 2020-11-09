package org.iesalixar.jmanuellopezh.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.iesalixar.jmanuellopezh.helper.ConnectionDB;

public class ReportDAOImpl implements ReportDAO{
	
	@Override
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
	
			public static List<Report> readReports() {
				
				List<Report> reports = null;
				try {
					Connection con = ConnectionDB.conectarMySQL();
					Statement s = con.createStatement();
					ResultSet rs = s.executeQuery("select * from report"); 
					reports = new ArrayList<Report>();

					while (rs.next()) {
						Report r = new Report(rs.getString("id"),  UserDAOImpl.getEmailById(rs.getString("owner")) ,UserDAOImpl.getEmailById(rs.getString("reported")),rs.getString("reported"),rs.getString("motive"),rs.getString("date"));
						reports.add(r);
					}
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return reports;
			}
			
			@Override
			public void deleteReport(String id) {
				try{
					Connection con = ConnectionDB.conectarMySQL();
					Statement stmt = con.createStatement();
					
					boolean borrado = stmt.execute("DELETE FROM report WHERE id ="+id);
					
					if (borrado){
						System.out.println("Report gestionado por un admin.");
					}
					stmt.close();
				}catch (SQLException ex){
					System.out.println(ex);
					
				}
			}

}
