
package com.clizo.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.QuestionPaperModel;

public abstract class QuestionPaperDaoImpl implements QuestionPaperDao{
	
	@Override
	public QuestionPaperModel findByQuestionpaperid(Long questionpaperid){
		return null;
	}
	
}