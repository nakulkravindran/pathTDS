package com.clizo.dao;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.clizo.model.TrainingModel;
@Repository
public interface TrainingDao extends JpaRepository<TrainingModel, Long> {
   
	TrainingModel findById(Long id);
	
	ArrayList<TrainingModel> findByEvalformno(String evalNo);
}
