package com.clizo.dao;

import com.clizo.model.ApplicantRegisterModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface ApplicantRegisterDao extends JpaRepository<ApplicantRegisterModel, Long> {

    List<ApplicantRegisterModel> findByExamId(String examId);
    
    ApplicantRegisterModel findById(Long id);

    @Modifying
    @Transactional
    @Query("update ApplicantRegisterModel arm set arm.approvalStatus = ?1 where arm.id = ?2")
    int setStatusForApplicant(String status, Long id);

    ArrayList<ApplicantRegisterModel> findByEmailId(String emailId);

    @Modifying
    @Transactional
    @Query("update ApplicantRegisterModel arm set arm.examAttended = ?1 where arm.id = ?2")
    int updateExamAttendedStatus(String aTrue, Long applicantId);

    @Transactional
    @Query("from ApplicantRegisterModel arm where arm.emailId = ?1 and arm.examId = ?2")
    ApplicantRegisterModel validateApplicantDetails(String emailId, String examId);
    
    @Query("from ApplicantRegisterModel arm WHERE arm.id = ?1 and arm.examId = ?2")
    ApplicantRegisterModel findByIdAndExamId(Long id, String examId);
}
