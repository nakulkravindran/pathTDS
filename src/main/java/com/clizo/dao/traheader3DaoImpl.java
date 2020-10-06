package com.clizo.dao;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader3Model;
public abstract class traheader3DaoImpl implements traheader3Dao {
 
	  @Override
	  public traheader3Model findById(Long id) {
	        return null;
	  }
	
	 @Override
	 public ArrayList<traheader3Model> findByTra2id(int id) {
	        return null;
	 }
	 
	 @Override
	 @Transactional
	 public int deleteByTra2id(int Tra2id){
		 return 0;
	 }
	 
	 @Override
	 @Transactional
	 public int deleteById(Long Id){
		 return 0;
	 }
	
	
	
	
}
