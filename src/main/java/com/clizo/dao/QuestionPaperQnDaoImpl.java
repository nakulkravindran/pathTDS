
package com.clizo.dao;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.clizo.model.QuestionPaperQnModel;

public abstract class QuestionPaperQnDaoImpl implements QuestionPaperQnDao{
	
	
	@Override
	public List<QuestionPaperQnModel> findByquestionpaperid(int questionpaperid){
		return null;
	}
	
	
	@Override
	@Transactional
	public int deleteByquestionpaperqnid(Long questionpaperqnid){
	 return 0;
	}	
	
}