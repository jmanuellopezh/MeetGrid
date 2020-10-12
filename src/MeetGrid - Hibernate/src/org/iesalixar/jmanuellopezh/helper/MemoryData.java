package org.iesalixar.jmanuellopezh.helper;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.iesalixar.jmanuellopezh.model.Message;
import org.iesalixar.jmanuellopezh.model.Role;
import org.iesalixar.jmanuellopezh.model.User;

public class MemoryData {
	
	public static User 		admin1 ,user1, user2;
	public static Message 	message1, message2, message3, message4;
	public static Role      admin, user;
	public static boolean isLoaded = false;
	
	//creo objeto date con fecha actual, esto será modificado más adelante
	static Date date = new Date();
	
	public static void load() {
		
		admin = new Role();
		admin.setType(RoleType.ADMIN);
		
		user = new Role();
		user.setType(RoleType.USER);
		
		admin1 = new User();
		admin1.setEmail("chema@meetgrid.com");
		admin1.setPassword("Silverhand");
		admin1.setName("Chema");
		admin1.setRole(admin);
		
		user1 = new User();
		user1.setEmail("cloud@meetgrid.com");
		user1.setPassword("SOLDADO1997");
		user1.setName("Cloud");
		user1.setRole(user);
		user1.setAge(21);
		user1.setGender("H");
		user1.setArea("Sevilla");
		user1.setPic("https://static1-www.millenium.gg/articles/3/11/01/3/@/124281-cloud-avatar3-article_4_t-1.jpg");
		user1.setDescription("Nuevo en Midgar");
		
		user2 = new User();
		user2.setEmail("tifa@meetgrid.com");
		user2.setPassword("7Cielo");
		user2.setName("Tifa");
		user2.setRole(user);
		user2.setAge(22);
		user2.setGender("M");
		user2.setArea("Cadiz");
		user2.setPic("https://static1-www.millenium.gg/articles/3/11/01/3/@/124311-tifa-avatar1-article_4_t-1.jpg");
		user2.setDescription("Ven al Bar 7th Heaven en el Sector 7!");
		
		message1 = new Message();
		message1.setSender(user1);
		message1.setReceiver(user2);
		message1.setContent("Hey Tifa!");
		message1.setDate((java.sql.Date) date);
		
		message2 = new Message();
		message2.setSender(user2);
		message2.setReceiver(user1);
		message2.setContent("Hey Cloud!");
		message2.setDate((java.sql.Date) date);
		
		message3 = new Message();
		message3.setSender(user1);
		message3.setReceiver(user2);
		message3.setContent("Cuanto tiempo.");
		message3.setDate((java.sql.Date) date);
		
		message4 = new Message();
		message4.setSender(user2);
		message4.setReceiver(user1);
		message4.setContent("Pues sí.");
		message4.setDate((java.sql.Date) date);
		
		
		isLoaded = true;
	}

}
