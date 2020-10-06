package com.clizo.dao;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader1Model;

public abstract class traheader1DaoImpl implements traheader1Dao{
	 @Override
	 public traheader1Model findById(Long id) {
	        return null;
	    }
	 
	 @Override
	 @Transactional
	 public int deleteById(Long Id){
		 return 0;
	 }
}
