package com.clizo.model;


import javax.persistence.*;

@Entity
@Table(name = "applicantRegister")
public class ApplicantRegisterModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String pathEmployee;
    private String candidateName;
    private String companyName;
    private String location;
    private String department;
    private String jobTitle;
    private String emailId;
    private String phoneNumber;
    private String remarks;
    private String lineManager;
    private String lineManagerEmail;
    private String serviceDuration;
    private String approvedByLineManager;
    private String examId;
    private String approvalStatus = "Pending";
    private String applicantPassword;
    private String examAttended = "false";
    private String employeid;
    private String currentdate;
    private String cadremarks;
    public String getCurrentdate() {
		return currentdate;
	}

	public void setCurrentdate(String currentdate) {
		this.currentdate = currentdate;
	}

	public String getEmployeid() {
		return employeid;
	}

	public void setEmployeid(String employeid) {
		this.employeid = employeid;
	}

	public String getApplicantPassword() {
        return applicantPassword;
    }

    public void setApplicantPassword(String applicantPassword) {
        this.applicantPassword = applicantPassword;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPathEmployee() {
        return pathEmployee;
    }

    public void setPathEmployee(String pathEmployee) {
        this.pathEmployee = pathEmployee;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getLineManager() {
        return lineManager;
    }

    public void setLineManager(String lineManager) {
        this.lineManager = lineManager;
    }

    public String getLineManagerEmail() {
        return lineManagerEmail;
    }

    public void setLineManagerEmail(String lineManagerEmail) {
        this.lineManagerEmail = lineManagerEmail;
    }

    public String getServiceDuration() {
        return serviceDuration;
    }

    public void setServiceDuration(String serviceDuration) {
        this.serviceDuration = serviceDuration;
    }

    public String getApprovedByLineManager() {
        return approvedByLineManager;
    }

    public void setApprovedByLineManager(String approvedByLineManager) {
        this.approvedByLineManager = approvedByLineManager;
    }

    public String getExamAttended() {
        return examAttended;
    }

    public void setExamAttended(String examAttended) {
        this.examAttended = examAttended;
    }

	public String getCadremarks() {
		return cadremarks;
	}

	public void setCadremarks(String cadremarks) {
		this.cadremarks = cadremarks;
	}
    
}
