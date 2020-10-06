package com.clizo.dao;

import com.clizo.model.ScreenAccessModel;

import java.util.List;

public abstract class ScreenAccessDaoImpl implements ScreenAccessDao{

    @Override
    public ScreenAccessModel findByUserId(Long id) {
        return null;
    }

    @Override
    public List<ScreenAccessModel> findAllByUserId(int id) {
        return null;
    }

    @Override
    public void updatePrivilage(String i, Long i1) {

    }
    
   
}
