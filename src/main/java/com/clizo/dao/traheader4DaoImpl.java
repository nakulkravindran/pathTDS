package com.clizo.dao;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader3Model;
import com.clizo.model.traheader4Model;
public abstract class traheader4DaoImpl implements traheader4Dao {
	@Override
	 public traheader4Model findById(Long id) {
	        return null;
	    }
	
	@Override
	 public ArrayList<traheader4Model> findByTra2id(int tra2id) {
	        return null;
	 }
	 
	 @Override
	 @Transactional
	 public int deleteByTra2id(int Tra2id){
		 return 0;
	 }
}
