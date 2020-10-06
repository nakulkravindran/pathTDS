package com.clizo.model;
import javax.persistence.*;
@Entity
@Table(name = "trainingregister")
public class TrainingRegstrationModel {
	 @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	    private String pathEmployee;
	    private String candidateName;
	    private String companyName;
	    private String location;
	    private String department;
	    private String jobTitle;
	    private String Email;
	    private String phoneNumber;
	    private String remarks;
	    private String lineManager;
	    private String lineManagerEmail;
	    private String serviceDuration;
	    private String approvedByLineManager;
	    private String RegId;
	    private String trainingid;
	   
		private String approvalStatus = "Pending";
	    private String applicantPassword;
	    private String employeid;
	    private String attendance="No";
	    private String currentdate;
	    private String cadremarks;
	    public String getCurrentdate() {
			return currentdate;
		}

		public void setCurrentdate(String currentdate) {
			this.currentdate = currentdate;
		}
	    
		public String getAttendance() {
			return attendance;
		}
		public void setAttendance(String attendance) {
			this.attendance = attendance;
		}
		public String getTrainingid() {
			return trainingid;
		}
		public void setTrainingid(String trainingid) {
			this.trainingid = trainingid;
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
		
	
		public String getEmail() {
			return Email;
		}
		public void setEmail(String email) {
			Email = email;
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
		public String getRegId() {
			return RegId;
		}
		public void setRegId(String regId) {
			RegId = regId;
		}
		public String getApprovalStatus() {
			return approvalStatus;
		}
		public void setApprovalStatus(String approvalStatus) {
			this.approvalStatus = approvalStatus;
		}
		public String getApplicantPassword() {
			return applicantPassword;
		}
		public void setApplicantPassword(String applicantPassword) {
			this.applicantPassword = applicantPassword;
		}
		public String getEmployeid() {
			return employeid;
		}
		public void setEmployeid(String employeid) {
			this.employeid = employeid;
		}

		public String getCadremarks() {
			return cadremarks;
		}

		public void setCadremarks(String cadremarks) {
			this.cadremarks = cadremarks;
		}
	    
	    
	    
	    
	    
}
