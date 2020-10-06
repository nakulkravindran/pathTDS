package com.clizo.dao;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.clizo.model.EvaluationModel;

public abstract class EvaluationDaoImpl implements EvaluationDao {
	
	@Override
	public ArrayList<EvaluationModel> findByTrainingIdAndTrainingRegistrationId(int trainingId,int trainingRegistrationId){
	  return null;
	}
	
	@Override
	public ArrayList<EvaluationModel> findByTrainingId(int trainingId){
	  return null;
	}
	
}