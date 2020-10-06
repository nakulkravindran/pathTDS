package com.clizo.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "trainingannouncement")
public class TrainingModel {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	  private Long id;
	  private String trainingtype;
	  private String name;
	  private String period;
	  private String location;
	  private String language;
	  private String details;
	  private String Regfinal;
	  private String startdt;
	  private String whocan;
	  private String otherdeatils;
	  private String category;
	  private String timefrom;
	  private String timeto;
	  private String datefrom;
	  private String evalformno;
	  private String trainername;
	  private String department;
	  private String timezone;
	  private String submitdate;
	  private String agenda;
	 
	  
	 public String getTimezone() {
		return timezone;
	}
	public void setTimezone(String timezone) {
		this.timezone = timezone;
	}
	public String getSubmitdate() {
		return submitdate;
	}
	public void setSubmitdate(String submitdate) {
		this.submitdate = submitdate;
	}
	public String getAgenda() {
		return agenda;
	}
	public void setAgenda(String agenda) {
		this.agenda = agenda;
	}
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTrainername() {
		return trainername;
	}
	public void setTrainername(String trainername) {
		this.trainername = trainername;
	}
	
	public String getEvalformno() {
		return evalformno;
	}
	public void setEvalformno(String evalformno) {
		this.evalformno = evalformno;
	}
	public String getTimefrom() {
		return timefrom;
	}
	public void setTimefrom(String timefrom) {
		this.timefrom = timefrom;
	}
	public String getTimeto() {
		return timeto;
	}
	public void setTimeto(String timeto) {
		this.timeto = timeto;
	}
	public String getDatefrom() {
		return datefrom;
	}
	public void setDatefrom(String datefrom) {
		this.datefrom = datefrom;
	}
	public String getDateto() {
		return dateto;
	}
	public void setDateto(String dateto) {
		this.dateto = dateto;
	}
	private String dateto;
	  
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getRegfinal() {
		return Regfinal;
	}
	public void setRegfinal(String regfinal) {
		Regfinal = regfinal;
	}
	public String getStartdt() {
		return startdt;
	}
	public void setStartdt(String startDt) {
		startdt = startDt;
	}
	
	public String getWhocan() {
		return whocan;
	}
	public void setWhocan(String whocan) {
		this.whocan = whocan;
	}
	public String getOtherdeatils() {
		return otherdeatils;
	}
	public void setOtherdeatils(String otherdeatils) {
		this.otherdeatils = otherdeatils;
	}
	
}
