package com.clizo.dao;

import com.clizo.model.AdduserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface AddnewDao  extends JpaRepository<AdduserModel, Long> {

	AdduserModel findByEmailid(String emailid);
	AdduserModel findByid(Long id);
	AdduserModel findByEmployeid(String employeid);

    ArrayList<AdduserModel> findAllByEmployeid(String employeid);

	AdduserModel findByUsername(String userName);
}