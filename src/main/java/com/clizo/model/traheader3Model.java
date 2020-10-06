package com.clizo.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "traheader3")
public class traheader3Model {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	private int tra2id;
	private String question;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getTra2id() {
		return tra2id;
	}
	public void setTra2id(int tra2id) {
		this.tra2id = tra2id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	
}
