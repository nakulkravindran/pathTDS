package com.clizo.model;

import java.io.Serializable;

public class ReportMonitor implements Serializable {
	private Long id;
	private String exam_id;
	private String exam_name;
    private String exam_time;    
    private String question_paper_number;
    private String category;
    private String accessible_time_from;
    private String accessibletime_to;
    private String exam_date;
    private String candidate_name;    
    private String company_name;
    private String department;
    private String location;
    private String email_id;  
    private String exam_attended;
    private String job_title;
    private String examstatus;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
	}
	public String getExam_name() {
		return exam_name;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public String getExam_time() {
		return exam_time;
	}
	public void setExam_time(String exam_time) {
		this.exam_time = exam_time;
	}
	public String getQuestion_paper_number() {
		return question_paper_number;
	}
	public void setQuestion_paper_number(String question_paper_number) {
		this.question_paper_number = question_paper_number;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAccessible_time_from() {
		return accessible_time_from;
	}
	public void setAccessible_time_from(String accessible_time_from) {
		this.accessible_time_from = accessible_time_from;
	}
	public String getAccessibletime_to() {
		return accessibletime_to;
	}
	public void setAccessibletime_to(String accessibletime_to) {
		this.accessibletime_to = accessibletime_to;
	}
	public String getExam_date() {
		return exam_date;
	}
	public void setExam_date(String exam_date) {
		this.exam_date = exam_date;
	}
	public String getCandidate_name() {
		return candidate_name;
	}
	public void setCandidate_name(String candidate_name) {
		this.candidate_name = candidate_name;
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
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getExam_attended() {
		return exam_attended;
	}
	public void setExam_attended(String exam_attended) {
		this.exam_attended = exam_attended;
	}
	public String getJob_title() {
		return job_title;
	}
	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	public String getExamstatus() {
		return examstatus;
	}
	public void setExamstatus(String examstatus) {
		this.examstatus = examstatus;
	} 
    
}
