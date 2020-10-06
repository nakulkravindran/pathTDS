package com.clizo.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.ScreenModel;
import com.clizo.model.traheader1Model;
@Repository
public interface traheader1Dao extends JpaRepository<traheader1Model, Long>{
	traheader1Model findById(Long id);
	
	@Transactional
	int deleteById(Long Id);	
}
