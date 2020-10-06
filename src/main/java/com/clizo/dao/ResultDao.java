
package com.clizo.dao;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.clizo.model.ApplicantRegisterModel;
import com.clizo.model.ResultModel;

public interface ResultDao extends JpaRepository<ResultModel,Long>{
	
	List<ResultModel> findByExamId(String examId);	
	ResultModel findById(int id);
	List<ResultModel> findByApplicantId(Long applicantId);
	
	@Query("from ResultModel arm WHERE arm.applicantId = ?1 and arm.examId = ?2")
	ResultModel findByApplicantIdAndExamId(Long applicantId, String examId);
		
}