package org.iesalixar.jmanuellopezh.model;

public class Report {
	
	String id, ownerName, reportedName, reportedId, content, date;

	public Report(String id, String ownerName, String reportedName, String reportedId, String content, String date) {
		super();
		this.id = id;
		this.ownerName = ownerName;
		this.reportedName = reportedName;
		this.reportedId = reportedId;
		this.content = content;
		this.date = date;
		
	}

	public Report() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public String getReportedName() {
		return reportedName;
	}

	public void setReportedName(String reportedName) {
		this.reportedName = reportedName;
	}

	public String getReportedId() {
		return reportedId;
	}

	public void setReportedId(String reportedId) {
		this.reportedId = reportedId;
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
