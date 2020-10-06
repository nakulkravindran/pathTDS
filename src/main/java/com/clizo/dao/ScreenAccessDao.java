package com.clizo.dao;

import com.clizo.model.ScreenAccessModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ScreenAccessDao extends JpaRepository<ScreenAccessModel, Long> {

    ScreenAccessModel findByUserId(Long id);

    List<ScreenAccessModel> findAllByUserId(int id);

    @Modifying
    @Transactional
    @Query("update ScreenAccessModel sam set sam.screenAccess = ?1 where sam.id = ?2")
    void updatePrivilage(String i, Long i1);

	
   
}
