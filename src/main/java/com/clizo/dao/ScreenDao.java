package com.clizo.dao;

import com.clizo.model.ScreenModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScreenDao extends JpaRepository<ScreenModel, Long> {

    ScreenModel findById(int id);
}
