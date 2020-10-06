package com.clizo.dao;

import com.clizo.model.ExamModel;

import java.util.ArrayList;

public abstract class ExamDaoImpl implements ExamDao{

    @Override
    public ExamModel findByExamName(String examName) {
        return null;
    }

    @Override
    public ExamModel findByExamId(String examId){
        return null;
    }
    
    @Override
    public ArrayList<ExamModel> findAllByQuestionPaperNumber(String questionPaperNumber) {
        return null;
    }

    @Override
    public ArrayList<ExamModel> findAllByExamId(String examId) {
        return null;
    }
}
