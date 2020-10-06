package com.clizo.dao;



import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.TrainingRegstrationModel;
public abstract class TrainingRegisterDaoImpl  implements TrainingRegisterDao{

	public TrainingRegstrationModel findById(Long id) {
		 return null;
	 }
	
	public List<TrainingRegstrationModel> findByIdAndTrainingid(Long id,String trainingid ){
		return null;
	}
	 @Override
	public List<TrainingRegstrationModel> findByTrainingid(String trainingid ) {
		return null;
	}
	 
	 @Override
	    @Transactional
	    public int setStatusForApplicant(String status, Long id) {
	        return 0;
	    }
}
