package com.clizo.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


public class ReportExam implements Serializable  {
	
	private Long id;
	private String classname;
    private String exam_id;    
    private String exam_date;
    private String candidate_name;
    private String job_title;
    private String company_name;
    private String department;
    private String location;
    private String Pass_percentage;
    private String Maximum_score;
    private String remarks;
    private String resultid;
    private String applicantid;
    private String score_type;    
    private String scorepercent;
    private String status;
    private String total_score;
    private String rn;
    private String applid;
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getExam_id() {
		return exam_id;
	}
	public void setExam_id(String exam_id) {
		this.exam_id = exam_id;
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
	public String getPass_percentage() {
		return Pass_percentage;
	}
	public void setPass_percentage(String pass_percentage) {
		Pass_percentage = pass_percentage;
	}
	public String getMaximum_score() {
		return Maximum_score;
	}
	public void setMaximum_score(String maximum_score) {
		Maximum_score = maximum_score;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getResultid() {
		return resultid;
	}
	public void setResultid(String resultid) {
		this.resultid = resultid;
	}
	public String getApplicantid() {
		return applicantid;
	}
	public void setApplicantid(String applicantid) {
		this.applicantid = applicantid;
	}
	public String getScore_type() {
		return score_type;
	}
	public void setScore_type(String score_type) {
		this.score_type = score_type;
	}
	public String getScorepercent() {
		return scorepercent;
	}
	public void setScorepercent(String scorepercent) {
		this.scorepercent = scorepercent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTotal_score() {
		return total_score;
	}
	public void setTotal_score(String total_score) {
		this.total_score = total_score;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getApplid() {
		return applid;
	}
	public void setApplid(String applid) {
		this.applid = applid;
	}
	
    public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
    
}
