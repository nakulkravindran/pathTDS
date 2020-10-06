package com.clizo.dao;

import com.clizo.model.ExamIdModel;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface ExamIdDao  extends JpaRepository<ExamIdModel, Long> {

    
}
