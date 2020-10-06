package com.clizo.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "trainingheader2")
public class traheader2Model {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	private int traheaderid;
	private String answertype;
	private String section;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getTraheaderid() {
		return traheaderid;
	}
	public void setTraheaderid(int traheaderid) {
		this.traheaderid = traheaderid;
	}
	public String getAnswertype() {
		return answertype;
	}
	public void setAnswertype(String answertype) {
		this.answertype = answertype;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	
	
	
}
