package com.clizo.dao;

import com.clizo.model.QuestionHeaderModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuestionHeaderDao extends JpaRepository<QuestionHeaderModel, Long> {
    QuestionHeaderModel findByQuestionPaperNumber(String questionHeader);
}
