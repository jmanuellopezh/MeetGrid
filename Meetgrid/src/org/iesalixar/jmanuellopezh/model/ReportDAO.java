package org.iesalixar.jmanuellopezh.model;

public interface ReportDAO {

	void deleteReport(String id);

	void report(String owner, String reported, String motive);

}
