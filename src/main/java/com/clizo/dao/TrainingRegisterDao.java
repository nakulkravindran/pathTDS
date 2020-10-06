package com.clizo.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.TrainingRegstrationModel;
import java.util.ArrayList;
import java.util.List;

@Repository
public interface TrainingRegisterDao extends JpaRepository<TrainingRegstrationModel, Long> {
	TrainingRegstrationModel findById(Long id);
	List<TrainingRegstrationModel> findByTrainingid(String trainingid );
	List<TrainingRegstrationModel> findByIdAndTrainingid(Long id,String trainingid );
	
	 @Modifying
	    @Transactional
	    @Query("update TrainingRegstrationModel arm set arm.approvalStatus = ?1 where arm.id = ?2")
	    int setStatusForApplicant(String status, Long id);
	
}
