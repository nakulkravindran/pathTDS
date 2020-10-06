package com.clizo.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "trainingheader1")
public class traheader1Model {
	 @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	   private String formName;
	   private String Details;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public String getDetails() {
		return Details;
	}
	public void setDetails(String details) {
		Details = details;
	}
	   
	   
	   
	   
	   
	 
}
