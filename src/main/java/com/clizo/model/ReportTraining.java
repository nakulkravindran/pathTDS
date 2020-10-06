package com.clizo.model;

import java.io.Serializable;

public class ReportTraining implements Serializable {
	private Long id;
	private String trainingtype;
	private String startdt;
	private String period;
	private String candidate_name;
	private String job_title;
	private String company_name;
	private String department;
	private String location;
	private String remarks;
	private String attended;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTrainingtype() {
		return trainingtype;
	}
	public void setTrainingtype(String trainingtype) {
		this.trainingtype = trainingtype;
	}
	public String getStartdt() {
		return startdt;
	}
	public void setStartdt(String startdt) {
		this.startdt = startdt;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getCandidate_name() {
		return candidate_name;
	}
	public void setCandidate_name(String candidate_name) {
		this.candidate_name = candidate_name;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getAttended() {
		return attended;
	}
	public void setAttended(String attended) {
		this.attended = attended;
	}
	
}
