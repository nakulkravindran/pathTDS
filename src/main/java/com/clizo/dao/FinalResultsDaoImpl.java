package com.clizo.dao;

import com.clizo.model.FinalResultsModel;

import java.util.List;

public abstract class FinalResultsDaoImpl implements FinalResultsDao {
    @Override
    public List<FinalResultsModel> findByExamId(String examId) {
        return null;
    }

    @Override
    public FinalResultsModel findByApplicantId(long l) {
        return null;
    }
}
