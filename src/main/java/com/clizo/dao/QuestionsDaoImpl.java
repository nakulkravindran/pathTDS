package com.clizo.dao;

import com.clizo.model.QuestionsModel;

import java.util.List;

public abstract class QuestionsDaoImpl implements QuestionsDao {

    @Override
    public List<QuestionsModel> findByQuestionPaperNumber(String questionPaperNumber) {
        return null;
    }

    @Override
    public QuestionsModel findByQuestionId(Long s) {
        return null;
    }

}
