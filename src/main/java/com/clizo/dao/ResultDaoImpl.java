
package com.clizo.dao;

import java.util.List;

import com.clizo.model.ApplicantRegisterModel;
import com.clizo.model.ResultModel;


public abstract class ResultDaoImpl implements ResultDao {
	@Override
    public List<ResultModel> findByExamId(String examId) {
        return null;
    }
	
	@Override
    public ResultModel findById(int id){
		return null;
	}
	
	@Override
    public List<ResultModel> findByApplicantId(Long applicantId) {
        return null;
    }
	
	@Override
    public ResultModel findByApplicantIdAndExamId(Long applicantId, String examId){
    	return null;
    }
	
}
