package com.clizo.dao;
import java.util.ArrayList;

import com.clizo.model.AdduserModel;

public abstract class AddnewDaoImpl implements AddnewDao{

    @Override
    public AdduserModel findByEmailid(String emailid) {
        return null;
    }
    
    @Override
    public AdduserModel findByid(Long id) {
        return null;
    }

    @Override
    public AdduserModel findByEmployeid(String employeid){
        return null;
    }

    @Override
    public ArrayList<AdduserModel> findAllByEmployeid(String employeid) {
        return null;
    }

    @Override
    public AdduserModel findByUsername(String userName) {
        return null;
    }
}
