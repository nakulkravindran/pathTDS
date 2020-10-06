package com.clizo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.clizo.model.ExamResultModel;

import java.util.List;

@Repository
public interface ExamResultDao extends JpaRepository<ExamResultModel, Long>  {


    List<ExamResultModel> findByApplicantId(Long s);
}
