package com.clizo.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.clizo.model.QuestionBankModel;

public interface QustnBankDao extends JpaRepository<QuestionBankModel, Long>  {

	QuestionBankModel findByQuestionId(Long id);
}
