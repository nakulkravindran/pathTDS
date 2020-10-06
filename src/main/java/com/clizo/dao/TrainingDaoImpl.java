package com.clizo.dao;
import java.util.ArrayList;
import java.util.List;

import com.clizo.model.ApplicantRegisterModel;
import com.clizo.model.TrainingModel;
public abstract class  TrainingDaoImpl implements TrainingDao {
 
	public TrainingModel findById(Long id) {
	 return null;
    }
	@Override
    public ArrayList<TrainingModel> findByEvalformno(String evalNo) {
        return null;
    }
}
