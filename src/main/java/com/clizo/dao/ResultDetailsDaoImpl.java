
package com.clizo.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.ResultDetailsModel;

public abstract class ResultDetailsDaoImpl implements ResultDetailsDao {
	
	@Override
    public List<ResultDetailsModel> findByApplicantId(Long s) {
        return null;
    }
	
	@Override
    public List<ResultDetailsModel> findByExamId(String examId) {
        return null;
    }
	
	@Override
    @Transactional
    public int setNewscoreForApplicant(int score, Long id) {
        return 0;
    }
}
