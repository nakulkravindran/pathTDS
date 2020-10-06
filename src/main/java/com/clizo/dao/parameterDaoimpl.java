package com.clizo.dao;
import java.util.ArrayList;

import com.clizo.model.parameterModel;
public abstract class parameterDaoimpl implements parameterDao {

	public parameterModel findById(Long id) {
		return null;
	}
	
	
    @Override
    public parameterModel findById(String prmName){
    	return null;
    }
    
    /*@Override
    public parameterModel findById(String prmName,String prmType){
    	return null;
    }
    
    @Override
    public parameterModel findById(String prmName,String prmShortName,String prmType){
    	return null;
    }*/
}
