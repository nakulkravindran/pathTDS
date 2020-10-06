package com.clizo.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "traheader4")
public class traheader4Model {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	private int tra2id;
	private String item;
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
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
}
