package com.clizo.dao;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.traheader2Model;
public abstract class traheader2DaoImpl implements traheader2Dao {
 
	@Override
	 public traheader2Model findById(Long id) {
	        return null;
     }
	
	@Override
	public ArrayList<traheader2Model> findByTraheaderid(int id){
		return null;
	}
	
	 @Override
	 @Transactional
	 public int deleteById(Long Id){
		 return 0;
	 }	
	 
	 @Override
	 @Transactional
	 public int deleteByTraheaderid(int Traheaderid){
		 return 0;
	 }
}
