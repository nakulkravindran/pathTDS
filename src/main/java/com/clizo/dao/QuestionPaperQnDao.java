
package com.clizo.dao;

import java.util.List;

import com.clizo.model.QuestionPaperQnModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface QuestionPaperQnDao extends JpaRepository<QuestionPaperQnModel, Long> {
	
	List<QuestionPaperQnModel> findByquestionpaperid(int questionpaperid);
	
		
	@Transactional
	int deleteByquestionpaperqnid(Long questionpaperqnid);	
	
}