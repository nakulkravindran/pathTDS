package com.clizo.dao;

import com.clizo.model.FinalResultsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FinalResultsDao extends JpaRepository<FinalResultsModel, Long> {
    List<FinalResultsModel> findByExamId(String examId);

    FinalResultsModel findByApplicantId(long l);
}
