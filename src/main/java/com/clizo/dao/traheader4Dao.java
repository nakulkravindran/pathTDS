package com.clizo.dao;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader4Model;
@Repository
public interface traheader4Dao extends JpaRepository<traheader4Model, Long> {
	traheader4Model findById(Long id);
	
	ArrayList<traheader4Model> findByTra2id(int tra2id);
	
	@Transactional
	int deleteByTra2id(int Tra2id);	
}
