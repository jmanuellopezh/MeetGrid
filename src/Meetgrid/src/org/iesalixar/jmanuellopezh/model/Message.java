package org.iesalixar.jmanuellopezh.model;

public class Message {
	
	String id, sender, receiver, content, date;

	public Message(String id, String sender, String receiver, String content, String date) {
		super();
		this.id = id;
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.date = date;
	}

	public Message(String sender, String receiver, String content, String date) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.content = content;
		this.date = date;
	}

	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	

}
