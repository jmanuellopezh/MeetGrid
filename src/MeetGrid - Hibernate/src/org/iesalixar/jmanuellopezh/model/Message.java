package org.iesalixar.jmanuellopezh.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;

public class Message implements Serializable {
	
	private long message_id;
	private User sender;
	private User receiver;
	private String content;
	private Date date;
	
	//parte many to one para guardar lista de mensajes pertenecientes a cada usuario
	@ManyToOne
	@JoinColumn (name="user_id")
	Message message;

	public Message(long message_id, User sender, User receiver, String content, Date date, Message message) {
		super();
		this.message_id = message_id;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.date = date;
		this.message = message;
	}

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Message(User sender, User receiver, String content, Date date) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.date = date;
	}

	public long getMessage_id() {
		return message_id;
	}

	public void setMessage_id(long message_id) {
		this.message_id = message_id;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
	
	
	

}
