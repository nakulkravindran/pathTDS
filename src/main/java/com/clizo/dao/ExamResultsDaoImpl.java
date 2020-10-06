package com.clizo.dao;

import com.clizo.model.ExamResultModel;

import java.util.List;

public abstract class ExamResultsDaoImpl implements ExamResultDao{

    @Override
    public List<ExamResultModel> findByApplicantId(Long s) {
        return null;
    }
}
