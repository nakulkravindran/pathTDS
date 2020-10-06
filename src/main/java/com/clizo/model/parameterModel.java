package com.clizo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "parameter")
public class parameterModel {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	 private String prm_type; 
	 private String prm_name;
	 private String prm_function;
	 private String prm_shortname;
	
	 private String prm_sort;
	 private String prm_status;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getPrm_type() {
		return prm_type;
	}
	public void setPrm_type(String prm_type) {
		this.prm_type = prm_type;
	}
	public String getPrm_name() {
		return prm_name;
	}
	public void setPrm_name(String prm_name) {
		this.prm_name = prm_name;
	}
	public String getPrm_function() {
		return prm_function;
	}
	public void setPrm_function(String prm_function) {
		this.prm_function = prm_function;
	}
	public String getPrm_shortname() {
		return prm_shortname;
	}
	public void setPrm_shortname(String prm_shortname) {
		this.prm_shortname = prm_shortname;
	}
	public String getPrm_sort() {
		return prm_sort;
	}
	public void setPrm_sort(String prm_sort) {
		this.prm_sort = prm_sort;
	}
	public String getPrm_status() {
		return prm_status;
	}
	public void setPrm_status(String prm_status) {
		this.prm_status = prm_status;
	}
	 
	
	 
}
