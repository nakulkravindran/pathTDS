package com.clizo.dao;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader3Model;
@Repository
public interface traheader3Dao extends JpaRepository<traheader3Model, Long> {
	traheader3Model findById(Long id);
	
	ArrayList<traheader3Model> findByTra2id(int id);
	
	@Transactional
	int deleteByTra2id(int Tra2id);	
	
	@Transactional
	int deleteById(Long Id);	
		
}
