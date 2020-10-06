
package com.clizo.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.QuestionBankModel;
import com.clizo.model.QuestionPaperModel;

import org.springframework.data.jpa.repository.Query;


@Repository
public interface QuestionPaperDao extends JpaRepository<QuestionPaperModel,Long>{
	
	QuestionPaperModel findByQuestionpaperid(Long questionpaperid);
	
}