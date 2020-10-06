package com.clizo.dao;
import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;




import com.clizo.model.parameterModel;
@Repository
public interface parameterDao extends JpaRepository<parameterModel, Long>{

	parameterModel findById(Long id);
	
		
	@Query("from parameterModel t where t.prm_name = ?1 and t.prm_type='Trainingtype'")
	parameterModel findById(String prmName);
	
	/*@Query("from parameterModel t where t.prm_name = ?1 and t.prm_type=?2")
	parameterModel findById(String prmName,String prmType);
	
	@Query("from parameterModel t where t.prm_shortname = ?2 and t.prm_type=?3")
	parameterModel findById(String prmName,String prmShortName,String prmType);*/
	
	
	
}
