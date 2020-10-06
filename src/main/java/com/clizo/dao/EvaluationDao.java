package com.clizo.dao;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.clizo.model.EvaluationModel;

@Repository
public interface EvaluationDao extends JpaRepository<EvaluationModel,Long> {
	
	ArrayList<EvaluationModel> findByTrainingIdAndTrainingRegistrationId(int trainingId,int trainingRegistrationId);

	ArrayList<EvaluationModel> findByTrainingId(int trainingId);
}