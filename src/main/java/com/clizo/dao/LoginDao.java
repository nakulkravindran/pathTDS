package com.clizo.dao;

import com.clizo.model.LoginModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoginDao extends JpaRepository<LoginModel, Long> {

    LoginModel findByUserName(String userName);
}
