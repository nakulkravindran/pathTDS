package com.clizo.dao;

import com.clizo.model.QuestionsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface QuestionsDao extends JpaRepository<QuestionsModel, Long> {

    List<QuestionsModel> findByQuestionPaperNumber(String questionPaperNumber);

    QuestionsModel findByQuestionId(Long s);
}
