
package com.clizo.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


import com.clizo.model.ResultDetailsModel;


public interface ResultDetailsDao extends JpaRepository<ResultDetailsModel,Long>{
	
	List<ResultDetailsModel> findByApplicantId(Long s);
	List<ResultDetailsModel> findByExamId(String examId);
	
	@Modifying
    @Transactional
    @Query("update ResultDetailsModel arm set arm.newScore = ?1,arm.totalScore = ?1 where arm.id = ?2")
    int setNewscoreForApplicant(int score, Long id);
}