package com.clizo.dao;

import com.clizo.model.ExamModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ExamDao  extends JpaRepository<ExamModel, Long> {

    ExamModel findByExamName(String examName);

    ExamModel findByExamId(String examId);
    
    ArrayList<ExamModel> findAllByQuestionPaperNumber(String questionPaperNumber);

    ArrayList<ExamModel> findAllByExamId(String examId);
}
