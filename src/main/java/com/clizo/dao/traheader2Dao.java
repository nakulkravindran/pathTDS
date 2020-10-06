package com.clizo.dao;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader2Model;
@Repository
public interface traheader2Dao extends JpaRepository<traheader2Model, Long> {
	traheader2Model findById(Long id);
	ArrayList<traheader2Model> findByTraheaderid(int id);
	
	@Transactional
	int deleteById(Long Id);	
	
	@Transactional
	int deleteByTraheaderid(int Traheaderid);	
}
