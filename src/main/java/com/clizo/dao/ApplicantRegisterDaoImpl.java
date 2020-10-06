package com.clizo.dao;

import com.clizo.model.ApplicantRegisterModel;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public abstract class ApplicantRegisterDaoImpl implements ApplicantRegisterDao {
    @Override
    public List<ApplicantRegisterModel> findByExamId(String examId) {
        return null;
    }
    
    @Override
    public ApplicantRegisterModel findById(Long id) {
        return null;
    }

    @Override
    @Transactional
    public int setStatusForApplicant(String status, Long id) {
        return 0;
    }

    @Override
    public int updateExamAttendedStatus(String aTrue, Long applicantId) {
        return 0;
    }

    @Override
    public ApplicantRegisterModel validateApplicantDetails(String emailId, String examId) {
        return null;
    }
    
    @Override
    public ApplicantRegisterModel findByIdAndExamId(Long id, String examId){
    	return null;
    }
}
