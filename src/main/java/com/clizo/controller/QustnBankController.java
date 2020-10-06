package com.clizo.controller;
import com.clizo.Util.HibernateUtil;
import com.clizo.dao.AddnewDao;
import com.clizo.dao.ApplicantRegisterDao;
import com.clizo.dao.QuestionPaperDao;
import com.clizo.dao.QuestionPaperQnDao;
import com.clizo.dao.ExamDao;
import com.clizo.dao.ExamResultDao;
import com.clizo.dao.FinalResultsDao;
import com.clizo.dao.LoginDao;
import com.clizo.dao.QuestionHeaderDao;
import com.clizo.dao.QuestionsDao;
import com.clizo.dao.QustnBankDao;
import com.clizo.dao.ScreenAccessDao;
import com.clizo.dao.ScreenDao;
import com.clizo.dao.parameterDao;
import com.clizo.model.*;
import com.clizo.service.QuestionBankBuilder;
import com.clizo.service.QuestionsModelBuilder;
import com.poiji.bind.Poiji;









import net.bytebuddy.utility.privilege.GetSystemPropertyAction;

import org.apache.commons.lang3.RandomStringUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;









import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.http.HttpSession;









import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
@Controller
public class QustnBankController {
	 @Autowired
	    HttpSession httpSession;
	   @Autowired
	    QuestionsDao questionsDao;
	    @Autowired
	    QuestionHeaderDao questionHeaderDao;
	    @Autowired
	    LoginDao loginDao;
	    @Autowired
	    ExamDao examDao;
	    @Autowired
	    AddnewDao addnewuserDao;
	    @Autowired
	    ApplicantRegisterDao applicantRegisterDao;
	    @Autowired
	    ExamResultDao examResultDao;
	    @Autowired
	    FinalResultsDao finalResultsDao;
	    @Autowired
	    ViewController viewController;
	   
	    @Autowired
	    ScreenDao  screenDao;
	    @Autowired
	    ScreenAccessDao screenAccessDao;
	    @Autowired
	    parameterDao parameterDao;
	    @Autowired
	    QuestionPaperDao questionPaperDao;
	    @Autowired
	    QustnBankDao qustnBankDao;
	   @Autowired
       QuestionPaperQnDao questionpaperqndao; 
	   @Autowired
	    QuestionPaperDao QuestionPaperDao;
	   
	   
	 
	    private String workingDir = System.getProperty("user.dir");

	    @RequestMapping(value = "/setuppara", method = RequestMethod.GET)//for view paramerter view page
	    public String parameterview(Model model){

	    return "setuppara";
	    }
	    
	    @RequestMapping(value = "/Ratingcode", method = RequestMethod.GET)//for view rating code view page
	    public String Ratingcode(Model model){

	    return "Ratingcode";
	    }
	    
	    
	    
	    @RequestMapping(value = "/deletepara", method = RequestMethod.GET)//for delete paramerter  page
	    public @ResponseBody String deletepara(@RequestParam(value = "userId", required = false) Long userId) {
	    	 try{
	             if(userId != null){
	            	 parameterDao.delete(Long.valueOf(userId));
	             }

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    return "sucess";
	    }
	    
	    @RequestMapping(value = "/editclasspara", method = RequestMethod.GET)//for edit class paramerter  page
	    public String editclasspara(@RequestParam(value = "userid", required = false) Long userId,Model model) {
	    	 try{
	             
	            parameterModel paramList = parameterDao.findById(userId);
	            //System.out.println(paramList);
	                 model.addAttribute("paramList",paramList);
	                 
	             

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    	 return "editclasspara";
	    }
	    
	    @RequestMapping(value = "/editsectionpara", method = RequestMethod.GET)//for edit section paramerter  page
	    public String editsectionpara(@RequestParam(value = "userid", required = false) Long userId,Model model) {
	    	 try{
	             
	            parameterModel paramList = parameterDao.findById(userId);
	            //System.out.println(paramList);
	                 model.addAttribute("paramList",paramList);
	                 
	             

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    	 return "editsectionpara";
	    }
	    
	    @RequestMapping(value = "/Diffcultyedit", method = RequestMethod.GET)//for edit class paramerter  page
	    public String Diffcultyedit(@RequestParam(value = "userid", required = false) Long userId,Model model) {
	    	 try{
	             
	            parameterModel paramList = parameterDao.findById(userId);
	            //System.out.println(paramList);
	                 model.addAttribute("paramList",paramList);
	                 
	             

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    	 return "Diffcultyedit";
	    }
	    
	    @RequestMapping(value = "/editTraining", method = RequestMethod.GET)//for edit class paramerter  page
	    public String editTraining(@RequestParam(value = "userid", required = false) Long userId,Model model) {
	    	 try{
	             
	            parameterModel paramList = parameterDao.findById(userId);
	            //System.out.println(paramList);
	                 model.addAttribute("paramList",paramList);
	                 
	             

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    	 return "editTraining";
	    }
	    
	    @RequestMapping(value = "/editsatisfact", method = RequestMethod.GET)//for edit class paramerter  page
	    public String editsatisfact(@RequestParam(value = "userid", required = false) Long userId,Model model) {
	    	 try{
	             
	            parameterModel paramList = parameterDao.findById(userId);
	            //System.out.println(paramList);
	                 model.addAttribute("paramList",paramList);
	                 
	             

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    	 return "editsatisfact";
	    }
	    
	    
	    
	    
	    @RequestMapping(value = "/setparameter", method = RequestMethod.POST)//for setting parameters
	    public @ResponseBody String setupparameter(@RequestParam(value = "userId", required = false) Long userId,Model model,parameterModel paramsModel){
	    	 try{
	       	  if(!StringUtils.isEmpty(userId)){
	       		parameterModel updateaddModel = parameterDao.getOne(Long.valueOf(userId));
	       		updateaddModel.setPrm_name(paramsModel.getPrm_name());
	       		updateaddModel.setPrm_shortname(paramsModel.getPrm_shortname());
	       		parameterDao.save(updateaddModel);
	       		  
	       	  }
	       	  else{
	       		 parameterDao.save(paramsModel);
	       		return "sucess";
	       	  }
	       	  }
	       	 catch (Exception e){
	         }
	    	
	    
	     return "sucess";
	    }
	    
	    @RequestMapping(value = "/setdiffculty", method = RequestMethod.POST)//for setting parameters
	    public @ResponseBody String setdiffculty(@RequestParam(value = "userId", required = false) Long userId,Model model,parameterModel paramsModel){
	    	 try{
	       	  if(!StringUtils.isEmpty(userId)){
	       		parameterModel updateaddModel = parameterDao.getOne(Long.valueOf(userId));
	       		updateaddModel.setPrm_name(paramsModel.getPrm_name());
	       		updateaddModel.setPrm_sort(paramsModel.getPrm_sort());
	       		parameterDao.save(updateaddModel);
	       		  
	       	  }
	       	  else{
	       	
	       		 parameterDao.save(paramsModel);
	       		return "sucess";
	       	  }
	       	  }
	       	 catch (Exception e){
	         }
	    	
	    
	     return "sucess";
	    }
	    
	    /*@RequestMapping(value = "/settraining", method = RequestMethod.POST)//for setting  training parameters add and edit
	    public @ResponseBody String settraining(@RequestParam(value = "userId", required = false) Long userId,Model model,parameterModel paramsModel){
	    	 try{
	       	  if(!StringUtils.isEmpty(userId)){
	       		parameterModel updateaddModel = parameterDao.getOne(Long.valueOf(userId));
	       		updateaddModel.setPrm_shortname(paramsModel.getPrm_shortname());
	       		updateaddModel.setPrm_sort(paramsModel.getPrm_sort());
	       		parameterDao.save(updateaddModel);
	       		  
	       	  }
	       	  else{
	       	
	       		 parameterDao.save(paramsModel);
	       		return "sucess";
	       	  }
	       	  }
	       	 catch (Exception e){
	         }
	    	
	    
	     return "sucess";
	    }*/
	    
	    @RequestMapping(value = "/settraining", method = RequestMethod.POST)//for setting  training parameters add and edit
	    public @ResponseBody String settraining(@RequestParam(value = "userId", required = false) Long userId,Model model,parameterModel paramsModel){
	    	String message="";
	    try{	    		 
	       	 if(!StringUtils.isEmpty(userId)){
	       		List<parameterModel> parameterModel= parameterDao.findAll();//.stream().filter(x->{return x.getPrm_shortname().equalsIgnoreCase(paramsModel.getPrm_shortname()) && x.getPrm_sort().equalsIgnoreCase(paramsModel.getPrm_sort());}).collect(Collectors.toList());
	       		parameterModel= parameterModel.stream().filter(x->{return x.getPrm_type().equalsIgnoreCase("Training Evaluation") ;}).collect(Collectors.toList());
	       		parameterModel= parameterModel.stream().filter(x->{return x.getPrm_shortname().equalsIgnoreCase(paramsModel.getPrm_shortname()) && x.getPrm_sort().equalsIgnoreCase(paramsModel.getPrm_sort());}).collect(Collectors.toList());	       		
	       		if((parameterModel.size()==1 && parameterModel.get(0).getId()==userId)||parameterModel.size()==0){
	       			parameterModel updateaddModel = parameterDao.getOne(Long.valueOf(userId));
		       		updateaddModel.setPrm_shortname(paramsModel.getPrm_shortname());
		       		updateaddModel.setPrm_sort(paramsModel.getPrm_sort());
		       		parameterDao.save(updateaddModel);
		       		message= "sucess";
	       		}else{
	       			message= "duplicate";
	       		}
	       		  
	       	 }else{
	       		List<parameterModel> parameterModell=parameterDao.findAll();
	       		parameterModell= parameterModell.stream().filter(x->{return x.getPrm_type().equalsIgnoreCase("Training Evaluation") ;}).collect(Collectors.toList());	       		
	       		parameterModell= parameterModell.stream().filter(x->{return x.getPrm_shortname().equalsIgnoreCase(paramsModel.getPrm_shortname()) && x.getPrm_sort().equalsIgnoreCase(paramsModel.getPrm_sort());}).collect(Collectors.toList());
	       		if(parameterModell.size()>0){
	       			message= "duplicate";
	       		}else{
	       			parameterDao.save(paramsModel);
	       			message= "sucess";
	       		}
	       	  }
	       }catch (Exception e){
	       }
	    	
	    return message;
	     //return "sucess";
	    }
	    
	    @RequestMapping(value = "/settsatisfact", method = RequestMethod.POST)//for setting  training parameters add and edit
	    public @ResponseBody String setsatisfact(@RequestParam(value = "userId", required = false) Long userId,Model model,parameterModel paramsModel){
	    	 try{
	       	  if(!StringUtils.isEmpty(userId)){
	       		parameterModel updateaddModel = parameterDao.getOne(Long.valueOf(userId));
	       		updateaddModel.setPrm_shortname(paramsModel.getPrm_shortname());
	       		updateaddModel.setPrm_sort(paramsModel.getPrm_sort());
	       		parameterDao.save(updateaddModel);
	       		  
	       	  }
	       	  else{
	       	
	       		 parameterDao.save(paramsModel);
	       		return "sucess";
	       	  }
	       	  }
	       	 catch (Exception e){
	         }
	    	
	    
	     return "sucess";
	    }
	    
	    
	    @RequestMapping(value = "/Trainingtypesetup", method = RequestMethod.POST)//for setting  training parameters add and edit
	    public @ResponseBody String Trainingtypesetup(@RequestParam(value = "userId", required = false) Long userId,Model model,parameterModel paramsModel){
	    	 try{
	       	  if(!StringUtils.isEmpty(userId)){
	       		parameterModel updateaddModel = parameterDao.getOne(Long.valueOf(userId));
	       		updateaddModel.setPrm_name(paramsModel.getPrm_name());
	       		
	       		parameterDao.save(updateaddModel);
	       		  
	       	  }
	       	  else{
	       	     parameterModel prm = parameterDao.findById(paramsModel.getPrm_name());
	       	     if(prm==null){
	       	    	 parameterDao.save(paramsModel);
	       	    	 return "sucess";
	       	     }else{
	       	    	return "duplicate";
	       	     }
	       	  }
	       	}
	       	 catch (Exception e){
	        }
	    	
	    
	     return "sucess";
	    }
	    
	    
	  
	    
	    @RequestMapping(value = "/parameter", method = RequestMethod.GET)//for view class paramerter page
	    public String parameter(Model model){

	    	
	    	List<parameterModel> paramList =parameterDao.findAll();
	    	 Collections.reverse(paramList);
	    	model.addAttribute("paramList", paramList);
	    	//parameterDao.save(paramsModel);
	    	
	    	
	    	
	    	if(viewController.validatePageAccess("/parameter"))
	        {
	    		
 	  
	    		 return "parameter";
	        }
	        else {
	            return "no_access";
	        }
	   
	    }
	    
	    @RequestMapping(value = "/difficulylevel", method = RequestMethod.GET)//for view class paramerter page
	    public String difficultylevel(Model model){

	    	
	    	List<parameterModel> paramList =parameterDao.findAll();
	    	// Collections.reverse(paramList);
	    	model.addAttribute("paramList", paramList);
	    	//parameterDao.save(paramsModel);
	    return "difficulylevel";
	    }
	    
	    
	    
	    
	    @RequestMapping(value = "/sectionpara", method = RequestMethod.GET)//for view section paramerter page
	    public String sectionpara(Model model){

	    	
	    	List<parameterModel> paramList =parameterDao.findAll();
	    	 //Collections.reverse(paramList);
	    	model.addAttribute("paramList", paramList);
	    
	   
	    
	    if(viewController.validatePageAccess("/sectionpara"))
        {
    		
	  
	    	 return "sectionpara";
        }
        else {
            return "no_access";
        }
	    }
	    
	    
	    @RequestMapping(value = "/trainingEval", method = RequestMethod.GET)//for view training evaluvation paramerter page
	    public String trainingEval(Model model){

	    	
	    	List<parameterModel> paramList =parameterDao.findAll();
	    	
	    	model.addAttribute("paramList", paramList);
	    
	   
	    
	    
	    
	    
	    if(viewController.validatePageAccess("/trainingEval"))
        {
    		
	  
	    	 return "trainingEval";
        }
        else {
            return "no_access";
        }
	    }
	    @RequestMapping(value = "/satisfaction", method = RequestMethod.GET)//for view satisafction paramerter page
	    public String satisfaction(Model model){

	    	
	    	List<parameterModel> paramList =parameterDao.findAll();
	    	
	    	model.addAttribute("paramList", paramList);
	    
	   
	    
	    
	    if(viewController.validatePageAccess("/satisfaction"))
        {
    		
	  
	    	 return "satisfaction";
        }
        else {
            return "no_access";
        }
	    }
	    
	    @RequestMapping(value = "/TrainingType", method = RequestMethod.GET)   //TrainingType  page
	    public String TrainingType(Model model){
	    	List<parameterModel> paramList =parameterDao.findAll();
	    	// Collections.reverse(paramList);
	    	model.addAttribute("paramList", paramList);
	              
	   		//return "TrainingType";
	    	if(viewController.validatePageAccess("/trainingEval"))
	        {
	    		
		  
		    	 return "TrainingType";
	        }
	        else {
	            return "no_access";
	        }
	           
	     }
	    
	    
	    @RequestMapping(value = "/EditTrainingType", method = RequestMethod.GET)//for edit class paramerter  page
	    public String EditTrainingType(@RequestParam(value = "userid", required = false) Long userId,Model model) {
	    	 try{
	             
	            parameterModel paramList = parameterDao.findById(userId);
	            //System.out.println(paramList);
	                 model.addAttribute("paramList",paramList);
	                 
	             

	         }
	         catch (Exception e){
	             e.printStackTrace();
	         }
	    	 return "EditTrainingType";
	    }
	    
	 
	 
	 @RequestMapping(value = "/Questionsbank", method = RequestMethod.GET)   //Question bank menu page
   public String Questionsbank(){
          
             
  		return "Questionsbank";
          
      }
	 
	 
	 
	 @RequestMapping(value = "/QuestionBankExcel", method = RequestMethod.GET)   //Question bank menu page
	   public String QuestionBankExcel(Model model){
		 List<parameterModel> paramList =parameterDao.findAll();
    	 //Collections.reverse(paramList);
    	model.addAttribute("paramList", paramList);
		 
	             
	  		
	  		
	  		
	  		if(viewController.validatePageAccess("/QuestionBankExcel"))
	        {
	    		
 	  
	  			return "QuestionBankExcel";
	        }
	        else {
	            return "no_access";
	        }
	          
	      }
	  
	 @RequestMapping(value = "/CreateQuestions", method = RequestMethod.GET)   //create Question bank 
	   public String CreateQuestions(Model model){
	          
		 List<parameterModel> paramList =parameterDao.findAll();
    	 //Collections.reverse(paramList);
    	model.addAttribute("paramList", paramList);
		 
		 
    	if(viewController.validatePageAccess("/CreateQuestions"))
        {
    		
	  
    		return "CreateQuestions";
        }
        else {
            return "no_access";
        }
	             
	  		
	          
	      }
	  
	 @RequestMapping(value = "/BankQuestions", method = RequestMethod.POST)
	    public @ResponseBody
	    String uploadQuestions(@RequestParam(value = "questionPaperNumber", required = false) String questionPaperNumber,
	                           @RequestParam(value = "editQuestion", required = false) String editQuestion,
	                           @RequestParam(value = "editQuestionId", required = false) String editQuestionId,
	                           UploadQustnBankModel uploadQuestionsModel,Model model) {

	        
		 QuestionBankModel questionsModel = new  QuestionBankModel();
	        QuestionBankBuilder questionsModelBuilder = new QuestionBankBuilder();

	        QuestionsModel oldQuestionsModel = null;

	        if (!StringUtils.isEmpty(editQuestion) && editQuestion.equals("true")){
	            uploadQuestionsModel.setEditQuestion(true);
	            

	            if (!StringUtils.isEmpty(editQuestionId)){
	                oldQuestionsModel = questionsDao.findByQuestionId(Long.valueOf(editQuestionId));
	            }
	        }
	        else {
	            uploadQuestionsModel.setEditQuestion(false);
	        }

	        try {
	            Path tempPath;
	            //String newPath = workingDir + "/examImages";
	            String newPath = System.getProperty("catalina.base") + "/webapps/examImages/";
	            String pathInDb = "/examImages/";
	            if (httpSession.getAttribute("questionImg") != null){

	                tempPath = Paths.get((String) httpSession.getAttribute("questionImg"));
	                Path questionImg = Files.move(tempPath, Paths.get(newPath + "/" + tempPath.getFileName()), StandardCopyOption.REPLACE_EXISTING);

	                uploadQuestionsModel.setQuestionImg(pathInDb + questionImg.getFileName());
	            }
	            else {
	                if (uploadQuestionsModel.isEditQuestion()){
	                    uploadQuestionsModel.setQuestionImg(oldQuestionsModel.getQuestionImg());
	                }
	            }

	            if(httpSession.getAttribute("option1Img") != null){

	                tempPath = Paths.get((String) httpSession.getAttribute("option1Img"));
	                Path option1Img = Files.move(tempPath, Paths.get(newPath + "/" +  tempPath.getFileName()), StandardCopyOption.REPLACE_EXISTING);
	                uploadQuestionsModel.setOption1Img(pathInDb + option1Img.getFileName());
	            }
	            else {
	                if (uploadQuestionsModel.isEditQuestion()){
	                    uploadQuestionsModel.setOption1Img(oldQuestionsModel.getOptionImg1());
	                }
	            }

	            if(httpSession.getAttribute("option2Img") != null){

	                tempPath = Paths.get((String) httpSession.getAttribute("option2Img"));
	                Path option2Img = Files.move(tempPath, Paths.get(newPath + "/" +  tempPath.getFileName()), StandardCopyOption.REPLACE_EXISTING);
	                uploadQuestionsModel.setOption2Img(pathInDb + option2Img.getFileName());
	            }
	            else {
	                if (uploadQuestionsModel.isEditQuestion()){
	                    uploadQuestionsModel.setOption2Img(oldQuestionsModel.getOptionImg2());
	                }
	            }

	            if(httpSession.getAttribute("option3Img") != null){

	                tempPath = Paths.get((String) httpSession.getAttribute("option3Img"));
	                Path option3Img = Files.move(tempPath, Paths.get(newPath + "/" +  tempPath.getFileName()), StandardCopyOption.REPLACE_EXISTING);
	                uploadQuestionsModel.setOption3Img(pathInDb + option3Img.getFileName());
	            }
	            else {
	                if (uploadQuestionsModel.isEditQuestion()){
	                    uploadQuestionsModel.setOption3Img(oldQuestionsModel.getOptionImg3());
	                }
	            }

	            if(httpSession.getAttribute("option4Img") != null){

	                tempPath = Paths.get((String) httpSession.getAttribute("option4Img"));
	                Path option4Img = Files.move(tempPath, Paths.get(newPath + "/" +  tempPath.getFileName()), StandardCopyOption.REPLACE_EXISTING);
	                uploadQuestionsModel.setOption4Img(pathInDb + option4Img.getFileName());
	            }
	            else {
	                if (uploadQuestionsModel.isEditQuestion()){
	                    uploadQuestionsModel.setOption4Img(oldQuestionsModel.getOptionImg4());
	                }
	            }

	        }
	        catch (Exception e){
	            e.printStackTrace();
	        }

	        try{
	            if (!uploadQuestionsModel.isEditQuestion()){
	                
	            }

	        }
	        catch (Exception e){
	            e.printStackTrace();
	        }
	        finally {
	            if (uploadQuestionsModel.isEditQuestion()){
	                QuestionBankModel editQuestionModel = questionsModelBuilder.buildQuestionsbankDao(uploadQuestionsModel);
	                if (editQuestionModel != null){

	                    editQuestionModel.setQuestionId(Long.valueOf(editQuestionId));
	                    qustnBankDao.save(editQuestionModel);
	                }
	            }
	            else {
	            	qustnBankDao.save(questionsModelBuilder.buildQuestionsbankDao(uploadQuestionsModel));
	               // update parameter table status
	            	try {
	            	 List<parameterModel> paramList = parameterDao.findAll();  
	            	 paramList.forEach(ResultPaper -> {
	            		 String str=null;
	            		 
	                 	if(ResultPaper.getPrm_type().equalsIgnoreCase("section")) {
	                 		 
	                 		  str=uploadQuestionsModel.getSection();
	                 		
	                 		  if(ResultPaper.getPrm_name().equalsIgnoreCase(str)) {
	                 			//System.out.println(ResultPaper.getId());
	                 			parameterModel paramLists = parameterDao.findById(ResultPaper.getId());
	                 			
	                 			
	                 			paramLists.setPrm_status("Active");
	                 			parameterDao.save(paramLists);
	                 			
	                 			
	                 		}
	                 		
	                 	}
	                 	
	            	 });
	                 	
	            	 paramList.forEach(classPaper -> {
	            		 String string=null;
	            		 
	                 	if(classPaper.getPrm_type().equalsIgnoreCase("class")) {
	                 		 
	                 		  string=uploadQuestionsModel.getClassName();
	                 		
	                 		  if(classPaper.getPrm_shortname().equalsIgnoreCase(string)) {
	                 			//System.out.println(ResultPaper.getId());
	                 			parameterModel paramLists = parameterDao.findById(classPaper.getId());
	                 			
	                 			
	                 			paramLists.setPrm_status("Active");
	                 			parameterDao.save(paramLists);
	                 			
	                 			
	                 		}
	                 		
	                 	}
	                 	
	            	 });
	            	 
	            	 paramList.forEach(diffcultylvl -> {
	            		 String strings=null;
	            		 
	                 	if(diffcultylvl.getPrm_type().equalsIgnoreCase("Difficulty level")) {
	                 		 
	                 		strings=uploadQuestionsModel.getDifficultylevel();
	                 		
	                 		  if(diffcultylvl.getPrm_sort().equalsIgnoreCase(strings)) {
	                 			//System.out.println(ResultPaper.getId());
	                 			parameterModel paramLists = parameterDao.findById(diffcultylvl.getId());
	                 			
	                 			
	                 			paramLists.setPrm_status("Active");
	                 			parameterDao.save(paramLists);
	                 			
	                 			
	                 		}
	                 		
	                 	}
	                 	
	            	 });
	                 	
	                 	
	                
	            
	            }
	            
	            catch (Exception e){
	                return "failed";
	            }
	            	//  parameter table status updation  completed
	                
	        }
	        }

	        
	        
	        return "success";
	    }
	  
	 @RequestMapping(value = "/uploadFiles", method = RequestMethod.POST)
	    @ResponseBody
	    public String uploadFile(
	            @RequestParam(value = "questionImg", required = false) MultipartFile questionImg,
	            @RequestParam(value = "option1Img", required = false) MultipartFile option1Img,
	            @RequestParam(value = "option2Img", required = false) MultipartFile option2Img,
	            @RequestParam(value = "option3Img", required = false) MultipartFile option3Img,
	            @RequestParam(value = "option4Img", required = false) MultipartFile option4Img) {


	        MultipartFile fileToUpload = null;
	        String fileUploaded;

	        try {

	            if (questionImg != null && !StringUtils.isEmpty(questionImg.getOriginalFilename())){
	                fileToUpload = questionImg;
	                fileUploaded = "questionImg";
	            }
	            else if(option1Img != null && !StringUtils.isEmpty(option1Img.getOriginalFilename())){
	                fileToUpload = option1Img;
	                fileUploaded = "option1Img";
	            }
	            else if(option2Img !=null && !StringUtils.isEmpty(option2Img.getOriginalFilename())){
	                fileToUpload = option2Img;
	                fileUploaded = "option2Img";
	            }
	            else if(option3Img !=null && !StringUtils.isEmpty(option3Img.getOriginalFilename())){
	                fileToUpload = option3Img;
	                fileUploaded = "option3Img";
	            }
	            else if(option4Img !=null && !StringUtils.isEmpty(option4Img.getOriginalFilename())){
	                fileToUpload = option4Img;
	                fileUploaded = "option4Img";
	            }
	            else {
	                throw new Exception();
	            }


	            // Get the filename and build the local file path
	            String filename = fileToUpload.getOriginalFilename();

	            String directory = System.getProperty("catalina.base") + "/webapps/uploadTemp/";
	            //String directory = ServletContext.TEMPDIR;
	            String filepath = Paths.get(directory, filename).toString();

	            httpSession.setAttribute(fileToUpload.getName(), filepath);

	            // Save the file locally
	            BufferedOutputStream stream =
	                    new BufferedOutputStream(new FileOutputStream(new File(filepath)));
	            stream.write(fileToUpload.getBytes());
	            stream.close();
	        }
	        catch (Exception e) {
	            System.out.println(e.getMessage());
	            return "failed";
	        }

	        return fileUploaded;
	    } // method uploadFile

	 //excel upload 
	 
	 @RequestMapping(value = "/uploadQuestionExcelUpload", method = RequestMethod.POST)
	    @ResponseBody
	    public String uploadQuestionExcelUpload(QuestionBankModel questionHeader){

	        httpSession.setAttribute("questionExcelUpload", questionHeader);

	        return "success";

	    }
	 
	 @RequestMapping(value = "/uploadQuestionBankFromExcel", method = RequestMethod.GET)
	    public String uploadQuestionBankFromExcel(){
	    	
	    		  return "uploadqustnExcel";
	   
	    }
	 @RequestMapping(value = "/uploadqustnExcel", method = RequestMethod.POST)
	    @ResponseBody
	    public String uploadqustnExcel(@RequestParam(value = "excelFile", required = false) MultipartFile excelFile){
		 Date todaysDate = new Date();
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        String str2 = df.format(todaysDate);

	        try{
	        	String message="";
	            // Get the filename and build the local file path
	            //String filename = excelFile.getOriginalFilename();

	            String filename = RandomStringUtils.random(10, true, true) + ".xls";

	            String directory = System.getProperty("catalina.base") + "/webapps/uploadTemp/";
	            //String directory = System.getProperty("user.dir");
	            String filepath = Paths.get(directory, filename).toString();

	            // Save the file locally
	            BufferedOutputStream stream =
	                    new BufferedOutputStream(new FileOutputStream(new File(filepath)));
	            stream.write(excelFile.getBytes());
	            stream.close();

	            List<parameterModel> paramList = parameterDao.findAll();
	            List<QuestionBankModel> questions = Poiji.fromExcel(new File(filepath), QuestionBankModel.class);
	            questions.remove(0);
	            questions.forEach(screen -> {
	            	screen.setStatus("unused");
	            	screen.setCreateddate(str2);
	            	List<parameterModel> p=null;
	            	p=paramList.stream().filter(x->{return x.getPrm_shortname()!=null && x.getPrm_shortname().equals(screen.getClass_name());}).collect(Collectors.toList());
	            	if(p!=null){p.get(0).setPrm_status("Active");parameterDao.save(p.get(0));}
	            	List<parameterModel> pp=null;
	            	pp=paramList.stream().filter(x->{return x.getPrm_name()!=null && x.getPrm_name().equals(screen.getSection());}).collect(Collectors.toList());
	            	if(pp!=null){pp.get(0).setPrm_status("Active");parameterDao.save(pp.get(0));}
  		        });
	          
	            

	          try {
	            	QuestionBankModel questionHeader = (QuestionBankModel) httpSession.getAttribute("questionExcelUpload");
	            	//qustnBankDao.save(questionHeader);
	            }
	            catch (Exception e){
	                e.getMessage();
	            }

	            try{
	            	
	            	qustnBankDao.save(questions);	            	
	            	
	            	
	            }
	            catch (Exception e){
	                e.getMessage();
	                return "failed";
	            }

	            return "success";
	        }
	        catch (Exception e){
	            e.printStackTrace();
	            return "failed";
	        }
	    }
	 
	 
	 
	
	 
	 
	 
	 @RequestMapping(value = "/ViewQuestionbank", method = RequestMethod.GET)   //Question bank menu page
	   public String ViewQuestionbank(@RequestParam(value = "Qn_type", required = false,defaultValue="") String Qn_type,
			   @RequestParam(value = "classname", required = false,defaultValue="") String classname,
			   @RequestParam(value = "qnstatus", required = false,defaultValue="") String qnstatus,
			   @RequestParam(value = "area", required = false,defaultValue="") String area,
			   @RequestParam(value = "frmdate", required = false,defaultValue="") String frmdate,
			   @RequestParam(value = "todate", required = false,defaultValue="") String todate,
			   @RequestParam(value = "frmqn", required = false,defaultValue="") String frmqn,
			   @RequestParam(value = "toqn", required = false,defaultValue="") String toqn,
			   Model model){
		                                                                                             
		 String chk="false"; 
		 List<QuestionBankModel> qnTypeList =qustnBankDao.findAll();
		 if(!StringUtils.isEmpty(Qn_type) ){ chk="true"; 
			 if(Qn_type.equalsIgnoreCase("both")){ qnTypeList= qnTypeList.stream().filter(str ->{return str.getQn_type().equalsIgnoreCase("multiple") || str.getQn_type().equalsIgnoreCase("descriptive");}).collect(Collectors.toList()); }
			 else{ qnTypeList= qnTypeList.stream().filter(str ->{return str.getQn_type().equalsIgnoreCase(Qn_type);}).collect(Collectors.toList()); }
		 }
		 if(!StringUtils.isEmpty(classname)){ chk="true";
			 qnTypeList= qnTypeList.stream().filter(str ->{return str.getClass_name().equalsIgnoreCase(classname);}).collect(Collectors.toList());
		 }
		 if(!StringUtils.isEmpty(qnstatus) ){ chk="true";
			 if(qnstatus.equalsIgnoreCase("both")){ qnTypeList= qnTypeList.stream().filter(str ->{return str.getStatus().equalsIgnoreCase("deleted") || str.getStatus().equalsIgnoreCase("active");}).collect(Collectors.toList()); }
			 else{ qnTypeList= qnTypeList.stream().filter(str ->{return str.getStatus().equalsIgnoreCase(qnstatus);}).collect(Collectors.toList()); }
		 }
		 if(!StringUtils.isEmpty(area)){ chk="true";
			 qnTypeList= qnTypeList.stream().filter(str ->{ return str.getArea()!=null && str.getArea().equalsIgnoreCase(area);}).collect(Collectors.toList());
		 }
		 if(!StringUtils.isEmpty(frmdate)){ chk="true";
			  qnTypeList= qnTypeList.stream().filter(str->{return checkDates(str.getCreateddate(),frmdate); }).collect(Collectors.toList());
			
		 }
		 if(!StringUtils.isEmpty(todate)){ chk="true";
			  qnTypeList= qnTypeList.stream().filter(str->{return checkDates(todate,str.getCreateddate()); }).collect(Collectors.toList());
			
		 }		 
		 if(!StringUtils.isEmpty(frmqn)){ chk="true";
			qnTypeList= qnTypeList.stream().filter(str -> {return checkQn(str.getQuestionId().toString(),frmqn);}).collect(Collectors.toList());
		 }
		 if(!StringUtils.isEmpty(toqn)){ chk="true";
			 qnTypeList= qnTypeList.stream().filter(str -> {return checkQn(toqn,str.getQuestionId().toString());}).collect(Collectors.toList());
		 }
		 		 
		if(chk=="false"){qnTypeList=null; }		 
		model.addAttribute("questionsList", qnTypeList);
		List<parameterModel> qnclass =parameterDao.findAll();
		model.addAttribute("qnclass", qnclass);
		List<QuestionBankModel> qnList =qustnBankDao.findAll();
		model.addAttribute("questionsAllList", qnList);         
	  		
	  		if(viewController.validatePageAccess("/ViewQuestionbank"))
	        {
	    		
 	  
	  			return "ViewQuestionbank";
	        }
	        else {
	            return "no_access";
	        }
	          
	 }
	 
	
	 
	 public boolean checkDates(String d1, String d2){
		 try{
			 //SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
			 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			 Date date1 =new Date();
			 Date date2=new Date();
			  
			  date2 = format.parse(d2);
			  date1 = format.parse(d1);
			 if(date2.before(date1) || date2.equals(date1)){ 
				 return true; 
			 }
		 }catch(Exception e){
			 return false;
		 }
		 	return false;
	 }
	 
	 public boolean checkQn(String Qn1,String Qn2){
		 try{
			 if(Integer.parseInt(Qn1)>=Integer.parseInt(Qn2)){ 
				 return true;
			  }
		 }catch(Exception e){
			 return false;
		 }
		 return false;
	 }

	 @RequestMapping(value = "/editQuestionBank", method = RequestMethod.GET)   //Question bank menu page
	   public String editQuestionBank(			  
			   @RequestParam(value = "Qn_type", required = false,defaultValue="") String Qn_type,
			   @RequestParam(value = "classname", required = false,defaultValue="") String classname,
			   @RequestParam(value = "qnstatus", required = false,defaultValue="") String qnstatus,
			   @RequestParam(value = "area", required = false,defaultValue="") String area,
			   @RequestParam(value = "frmdate", required = false,defaultValue="") String frmdate,
			   @RequestParam(value = "todate", required = false,defaultValue="") String todate,
			   @RequestParam(value = "frmqn", required = false,defaultValue="") String frmqn,
			   @RequestParam(value = "toqn", required = false,defaultValue="") String toqn,
			   Model model){
		                                                                                             
		 String chk="false"; 
		 List<QuestionBankModel> qnTypeList =qustnBankDao.findAll();
		 if(!StringUtils.isEmpty(Qn_type) ){ chk="true"; 
			 if(Qn_type.equalsIgnoreCase("both")){ qnTypeList= qnTypeList.stream().filter(str ->{return str.getQn_type().equalsIgnoreCase("multiple") || str.getQn_type().equalsIgnoreCase("descriptive");}).collect(Collectors.toList()); }
			 else{ qnTypeList= qnTypeList.stream().filter(str ->{return str.getQn_type().equalsIgnoreCase(Qn_type);}).collect(Collectors.toList()); }
		 }
		 if(!StringUtils.isEmpty(classname)){ chk="true";
			 qnTypeList= qnTypeList.stream().filter(str ->{return str.getClass_name().equalsIgnoreCase(classname);}).collect(Collectors.toList());
		 }
		 if(!StringUtils.isEmpty(qnstatus) ){ chk="true";
			 if(qnstatus.equalsIgnoreCase("both")){ qnTypeList= qnTypeList.stream().filter(str ->{return str.getStatus().equalsIgnoreCase("deleted") || str.getStatus().equalsIgnoreCase("active");}).collect(Collectors.toList()); }
			 else{ qnTypeList= qnTypeList.stream().filter(str ->{return str.getStatus().equalsIgnoreCase(qnstatus);}).collect(Collectors.toList()); }
		 }
		 if(!StringUtils.isEmpty(area)){ chk="true";
			 qnTypeList= qnTypeList.stream().filter(str ->{ return str.getArea()!=null && str.getArea().equalsIgnoreCase(area);}).collect(Collectors.toList());
		 }
		 if(!StringUtils.isEmpty(frmdate)){ chk="true";
			  qnTypeList= qnTypeList.stream().filter(str->{return checkDates(str.getCreateddate(),frmdate); }).collect(Collectors.toList());
			
		 }
		 if(!StringUtils.isEmpty(todate)){ chk="true";
			  qnTypeList= qnTypeList.stream().filter(str->{return checkDates(todate,str.getCreateddate()); }).collect(Collectors.toList());
			
		 }		 
		 if(!StringUtils.isEmpty(frmqn)){ chk="true";
			qnTypeList= qnTypeList.stream().filter(str -> {return checkQn(str.getQuestionId().toString(),frmqn);}).collect(Collectors.toList());
		 }
		 if(!StringUtils.isEmpty(toqn)){ chk="true";
			 qnTypeList= qnTypeList.stream().filter(str -> {return checkQn(toqn,str.getQuestionId().toString());}).collect(Collectors.toList());
		 }
		 		 
		if(chk=="false"){qnTypeList=null; }	
				
		model.addAttribute("questionsList", qnTypeList);
		List<parameterModel> qnclass =parameterDao.findAll();
		model.addAttribute("qnclass", qnclass);
		List<QuestionBankModel> qnList =qustnBankDao.findAll();
		model.addAttribute("questionsAllList", qnList);   
		
			  		
	  		if(viewController.validatePageAccess("/editQuestionBank"))
	        {
	    		
 	  
	  			return "editQuestionBank";
	        }
	        else {
	            return "no_access";
	        }
	          
	      }
	 
	 
	 
	 @RequestMapping(value = "/deleteQuestionBank", method = RequestMethod.GET)   //Question bank menu page
	   public String deleteQuestionBank(@RequestParam(value = "questionId", required = false) Long questionId,Model model){
		 if(questionId!=null) {
		 QuestionBankModel qnmodel=qustnBankDao.findByQuestionId(questionId);
		 qnmodel.setStatus("Deleted");
		 qustnBankDao.save(qnmodel);
		 
		// qustnBankDao.delete(Long.valueOf(questionId));
		 }
		 return "redirect:/editQuestionBank";
	 }
	 


@RequestMapping(value = "/ViewQustnPaper", method = RequestMethod.GET)   //Question bank menu page
	   public String ViewQustnPaper(@RequestParam(value = "questionId", required = false) Long questionId,Model model){

   List<QuestionPaperModel> QuestnpaperList=QuestionPaperDao.findAll();
    model.addAttribute("QuestnpaperList", QuestnpaperList); 


		 //return "ViewQustnPaper";
		 if(viewController.validatePageAccess("/CreateQuestions"))
			{
 			return "ViewQustnPaper";
			}
			else {
			
				return "no_access";
			}
	 }
     
	 

	 @RequestMapping(value = "/QuestionbankUpdate", method = RequestMethod.GET)   //Question bank menu page
	   public String QuestionbankUpdate(@RequestParam(value = "questionId", required = false) Long questionId,Model model){
		 if(questionId!=null) {
			 QuestionBankModel qnmodel=qustnBankDao.findByQuestionId(questionId);			 
			 model.addAttribute("qnmodel", qnmodel);
			
			 }
		 List<parameterModel> paramList =parameterDao.findAll();
    	
    	model.addAttribute("paramList", paramList);
		 return "QuestionbankUpdate";
	 }



 



	 
	 @RequestMapping(value = "/QuestionChange", method = RequestMethod.POST)   //Question bank menu page
	   public  @ResponseBody String QuestionChange(@RequestParam(value = "questionId", required = false) Long questionId,Model model,QuestionBankModel Questionparameter){
	
		 try{
	       	  if(questionId!=null){
	       		QuestionBankModel updateaddModel = qustnBankDao.getOne(Long.valueOf(questionId));
	       		updateaddModel.setQn_type(Questionparameter.getQn_type());
	       		updateaddModel.setClass_name(Questionparameter.getClass_name());
	       		updateaddModel.setSection(Questionparameter.getSection());
	       		updateaddModel.setDifficultylevel(Questionparameter.getDifficultylevel());
	       		updateaddModel.setTime_per_question(Questionparameter.getTime_per_question());
	       		updateaddModel.setQuestion(Questionparameter.getQuestion());
	       		updateaddModel.setOp1(Questionparameter.getOp1());
	       		updateaddModel.setOp2(Questionparameter.getOp2());
	       		updateaddModel.setOp3(Questionparameter.getOp3());
	       		updateaddModel.setOp4(Questionparameter.getOp4());
	       		updateaddModel.setOp5(Questionparameter.getOp5());
	       		updateaddModel.setAnswer_multiple(Questionparameter.getAnswer_multiple());
	       		updateaddModel.setAnswer_Descriptive(Questionparameter.getAnswer_Descriptive());
	       		updateaddModel.setArea(Questionparameter.getArea());
	       		qustnBankDao.save(updateaddModel);
	       		  
	       	  }
	       	  
	       	  }
	       	 catch (Exception e){
	         }
		 return "sucess";
	 }
	 
	 @RequestMapping(value = "/rptExam", method = RequestMethod.GET)   //Question bank menu page
	   public String rptExam(
			   @RequestParam(value = "classname", required = false,defaultValue="") String classname,
			   @RequestParam(value = "frmdate", required = false,defaultValue="") String frmdate,
			   @RequestParam(value = "todate", required = false,defaultValue="") String todate,			   
			   @RequestParam(value = "company", required = false,defaultValue="") String company,
			   @RequestParam(value = "country", required = false,defaultValue="") String country,
			   @RequestParam(value = "department", required = false,defaultValue="") String department,
			   @RequestParam(value = "name", required = false,defaultValue="") String name,
			   @RequestParam(value = "show", required = false,defaultValue="") String show,
			   @RequestParam(value = "registered", required = false,defaultValue="") String registered,
			   Model model){
		 
		 			     
	    		SessionFactory sf=HibernateUtil.getSessionFactory();
	    		List<ReportExam> rptexam;
	            try (Session session = sf.openSession()) {
	            String val;
	             StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_examreport");
//	             StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("testtds.sp_examreport");	             		   		
	             procedureQuery.execute();
	              
	              List<Object[]> res = procedureQuery.getResultList();
	              rptexam= new ArrayList<ReportExam>();	              

	              Iterator it = res.iterator();
	            if(!classname.equalsIgnoreCase("") || !frmdate.equalsIgnoreCase("") || !todate.equalsIgnoreCase("") || !company.equalsIgnoreCase("") || !country.equalsIgnoreCase("") || !department.equalsIgnoreCase("") ||!name.equalsIgnoreCase("") || !show.equalsIgnoreCase("")){ 
	              while(it.hasNext()){
	                   Object[] line = (Object[]) it.next();
	                   ReportExam rpt = new ReportExam();
	                   rpt.setClassname(line[1]==null?"":line[1].toString());	                   
	                   rpt.setExam_id(line[2]==null?"":line[2].toString());
	                   rpt.setExam_date(line[3]==null?"":line[3].toString());
	                   rpt.setCandidate_name(line[4]==null?"":line[4].toString());
	                   rpt.setJob_title(line[5]==null?"":line[5].toString());	                   
	                   rpt.setCompany_name(line[6]==null?"":line[6].toString());	                   
	                   rpt.setDepartment(line[7]==null?"":line[7].toString());
	                   rpt.setLocation(line[8]==null?"":line[8].toString());
	                   rpt.setPass_percentage(line[9]==null?"":line[9].toString());
	                   rpt.setMaximum_score(line[10]==null?"":line[10].toString());	                   
	                   rpt.setTotal_score(line[17]==null?"":line[17].toString());	                   
	                   rpt.setScorepercent(line[15]==null?"":line[15].toString());
	                   rpt.setStatus(line[16]==null?"":line[16].toString());
	                   rpt.setRemarks(line[11]==null?"":line[11].toString());
	                  

	                   rptexam.add(rpt);
	              }    
	             }
	            }    
	        	  if(!classname.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getClassname().equalsIgnoreCase(classname);}).collect(Collectors.toList());	
	        	  }
	        	  if(!frmdate.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str->{return checkDates(str.getExam_date(),frmdate); }).collect(Collectors.toList());
	        	  }
	        	  if(!todate.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str->{return checkDates(todate,str.getExam_date()); }).collect(Collectors.toList());
	        	  }
	        	  if(!company.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getCompany_name().equalsIgnoreCase(company);}).collect(Collectors.toList());	
	        	  }	        	  
	        	  if(!country.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getLocation().equalsIgnoreCase(country);}).collect(Collectors.toList());	
	        	  }	        	  
	        	  if(!department.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getDepartment().equalsIgnoreCase(department);}).collect(Collectors.toList());	
	        	  }	        	  
	        	  if(!name.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getCandidate_name().toLowerCase().contains(name.toLowerCase());}).collect(Collectors.toList());	
	        	  }
	        	  
	        	  /*if(!show.equalsIgnoreCase("Both") && !show.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getStatus().equalsIgnoreCase(show);}).collect(Collectors.toList());	
	        	  }
	        	  if(!registered.equalsIgnoreCase("yes") && !registered.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return str.getStatus().equalsIgnoreCase(null) || str.getStatus().equalsIgnoreCase("");}).collect(Collectors.toList());	
	        	  }
	        	  if(!registered.equalsIgnoreCase("no") && !registered.equalsIgnoreCase("")){
	        		  rptexam= rptexam.stream().filter(str ->{return !str.getStatus().equalsIgnoreCase(null) && !str.getStatus().equalsIgnoreCase("");}).collect(Collectors.toList());	
	        	  }*/
	        	  
	        	  if(!show.equalsIgnoreCase("")){
	        		  if(!show.equalsIgnoreCase("All") && !show.equalsIgnoreCase("Not Attended")){
	        			  rptexam= rptexam.stream().filter(str ->{return str.getStatus().equalsIgnoreCase(show);}).collect(Collectors.toList());
	      	   		  }
	        		  if(show.equalsIgnoreCase("Not Attended")){
	        			  rptexam= rptexam.stream().filter(str ->{return str.getStatus().equalsIgnoreCase(null) || str.getStatus().equalsIgnoreCase("");}).collect(Collectors.toList());
	      	   		  }
	        		  
	        	  }
	            
	        	   
	    	List<parameterModel> qnclass =parameterDao.findAll();
			model.addAttribute("qnclass", qnclass);
			model.addAttribute("classname", classname);
			model.addAttribute("frmdate", frmdate);
			model.addAttribute("todate", todate);
			model.addAttribute("company", company);
			model.addAttribute("country", country);
			model.addAttribute("department", department);
			model.addAttribute("name", name);
			model.addAttribute("show", show);
			model.addAttribute("registered", registered);
			model.addAttribute("rptexamList", rptexam);
			
		 if(viewController.validatePageAccess("/viewResults"))
	        {
	    		
	  
	  			return "rptExam";
	        }
	        else {
	            return "no_access";
	        }
	 }
	 
	 @RequestMapping(value = "/rptTraining", method = RequestMethod.GET)   //Question bank menu page
	   public String rptTraining(
			   @RequestParam(value = "category", required = false,defaultValue="") String category,
			   @RequestParam(value = "frmdate", required = false,defaultValue="") String frmdate,
			   @RequestParam(value = "todate", required = false,defaultValue="") String todate,			   
			   @RequestParam(value = "company", required = false,defaultValue="") String company,
			   @RequestParam(value = "country", required = false,defaultValue="") String country,
			   @RequestParam(value = "department", required = false,defaultValue="") String department,
			   @RequestParam(value = "name", required = false,defaultValue="") String name,
			   @RequestParam(value = "show", required = false,defaultValue="") String show,
			   Model model){
		 
		 
		 			List<parameterModel> paramList =parameterDao.findAll();
		 			SessionFactory sf=HibernateUtil.getSessionFactory();
		    		List<ReportTraining> rpttraining;
		            try (Session session = sf.openSession()) {
		            String val;
		             StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_trainingreport");
//		             StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("testtds.sp_trainingreport");	             		   		
		             procedureQuery.execute();
		              
		              List<Object[]> res = procedureQuery.getResultList();
		              rpttraining= new ArrayList<ReportTraining>();	              

		              Iterator it = res.iterator();
		              if(!category.equalsIgnoreCase("") || !frmdate.equalsIgnoreCase("") || !todate.equalsIgnoreCase("") || !company.equalsIgnoreCase("") || !country.equalsIgnoreCase("") || !department.equalsIgnoreCase("") || !name.equalsIgnoreCase("") ||  !show.equalsIgnoreCase("")){
		                while(it.hasNext()){
		                   Object[] line = (Object[]) it.next();
		                   ReportTraining rpt = new ReportTraining();
		                   rpt.setTrainingtype(line[1]==null?"":line[1].toString());	                   
		                   rpt.setId(line[0]==null?Long.valueOf("0"):Long.valueOf(line[0].toString()));
		                   rpt.setStartdt(line[2]==null?"":line[2].toString());
		                   rpt.setPeriod(line[3]==null?"":line[3].toString());
		                   rpt.setCandidate_name(line[4]==null?"":line[4].toString());	                   
		                   rpt.setJob_title(line[5]==null?"":line[5].toString());	
		                   rpt.setCompany_name(line[6]==null?"":line[6].toString());
		                   rpt.setDepartment(line[7]==null?"":line[7].toString());
		                   rpt.setLocation(line[8]==null?"":line[8].toString());		                   
		                   rpt.setAttended(line[11]==null?"":line[11].toString());	                 
		                   rpt.setRemarks(line[9]==null?"":line[9].toString());
		                  

		                   rpttraining.add(rpt);
		               }
		              }
		            }    
		 			 if(!category.equalsIgnoreCase("")){
		 				rpttraining= rpttraining.stream().filter(str ->{return str.getTrainingtype().equalsIgnoreCase(category);}).collect(Collectors.toList());	
		        	  }
		        	  if(!frmdate.equalsIgnoreCase("")){
		        		  rpttraining= rpttraining.stream().filter(str->{return checkDates(str.getStartdt(),frmdate); }).collect(Collectors.toList());
		        	  }
		        	  if(!todate.equalsIgnoreCase("")){
		        		  rpttraining= rpttraining.stream().filter(str->{return checkDates(todate,str.getStartdt()); }).collect(Collectors.toList());
		        	  }
		        	  if(!company.equalsIgnoreCase("")){
		        		  rpttraining= rpttraining.stream().filter(str ->{return str.getCompany_name().equalsIgnoreCase(company);}).collect(Collectors.toList());	
		        	  }	        	  
		        	  if(!country.equalsIgnoreCase("")){
		        		  rpttraining= rpttraining.stream().filter(str ->{return str.getLocation().equalsIgnoreCase(country);}).collect(Collectors.toList());	
		        	  }	        	  
		        	  if(!department.equalsIgnoreCase("")){
		        		  rpttraining= rpttraining.stream().filter(str ->{return str.getDepartment().equalsIgnoreCase(department);}).collect(Collectors.toList());	
		        	  }	        	  
		        	  if(!name.equalsIgnoreCase("")){
		        		  //rpttraining= rpttraining.stream().filter(str ->{return str.getCandidate_name().equalsIgnoreCase(name);}).collect(Collectors.toList());	
		        		  rpttraining= rpttraining.stream().filter(str ->{return str.getCandidate_name().toLowerCase().contains(name.toLowerCase());}).collect(Collectors.toList());	
				        	 
		        	  }
		        	  
		        	  if(!show.equalsIgnoreCase("Both") && !show.equalsIgnoreCase("")){
		        		  rpttraining= rpttraining.stream().filter(str ->{return str.getAttended().equalsIgnoreCase(show);}).collect(Collectors.toList());	
		        	  }
		        	  
		 			
		 			
		 			model.addAttribute("paramList", paramList);
		 			model.addAttribute("rpttraining", rpttraining);
	    	
			   if(viewController.validatePageAccess("/viewResults"))
		        {
		    		
		  
		  			return "rptTraining";
		        }
		        else {
		            return "no_access";
		        }
		 }
	 @RequestMapping(value = "/rptMonitor", method = RequestMethod.GET)   //Question bank menu page
	   public String rptMonitor(
			   @RequestParam(value = "examid", required = false,defaultValue="") String examid,
			      Model model){
		 
		 
		 			List<ExamModel> examList =examDao.findAll();
		 			ExamModel examdlts=new ExamModel();
		 			List<ReportMonitor> rptmonitor=new ArrayList<ReportMonitor>();
		 		 if(!examid.equalsIgnoreCase("")){	
		 			examdlts=examDao.findByExamId(examid);
		 			SessionFactory sf=HibernateUtil.getSessionFactory();
		    		
		            try (Session session = sf.openSession()) {
		            String val;
		             StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_monitorreport");
//		             StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("testtds.sp_monitorreport");	             		   		
		             procedureQuery.execute();
		              
		              List<Object[]> res = procedureQuery.getResultList();
		              rptmonitor= new ArrayList<ReportMonitor>();	              

		              Iterator it = res.iterator();
		              while(it.hasNext()){
		                   Object[] line = (Object[]) it.next();
		                   ReportMonitor rpt = new ReportMonitor();
		                   rpt.setId(line[0]==null?Long.valueOf("0"):Long.valueOf(line[0].toString()));
		                   rpt.setExam_id(line[1]==null?"":line[1].toString());                
		                   rpt.setExam_name(line[2]==null?"":line[2].toString());
		                   rpt.setExam_time(line[3]==null?"":line[3].toString());
		                   rpt.setQuestion_paper_number(line[4]==null?"":line[4].toString());	                   
		                   rpt.setCategory(line[5]==null?"":line[5].toString());	
		                   rpt.setAccessible_time_from(line[6]==null?"":line[6].toString());
		                   rpt.setAccessibletime_to(line[7]==null?"":line[7].toString());
		                   rpt.setExam_date(line[8]==null?"":line[8].toString());	
		                   rpt.setCandidate_name(line[9]==null?"":line[9].toString());
		                   rpt.setCompany_name(line[10]==null?"":line[10].toString());	             
		                   rpt.setDepartment(line[11]==null?"":line[11].toString());
		                   rpt.setLocation(line[12]==null?"":line[12].toString());                
		                   rpt.setEmail_id(line[13]==null?"":line[13].toString());
		                   rpt.setExam_attended(line[14]==null?"":line[14].toString());
		                   rpt.setJob_title(line[15]==null?"":line[15].toString());	                   
		                   rpt.setExamstatus(line[16]==null?"":line[16].toString());	
		                   
		                  

		                   rptmonitor.add(rpt);
		              }
		            }    
		 			 if(!examid.equalsIgnoreCase("")){
		 				rptmonitor= rptmonitor.stream().filter(str ->{return str.getExam_id().equalsIgnoreCase(examid);}).collect(Collectors.toList());	
		        	  }
		        	  
		 			
		 			
		 		 }
		 			model.addAttribute("examdlts",examdlts);
		 			model.addAttribute("rptmonitor", rptmonitor);		 		 
		 		 	model.addAttribute("examList", examList);
			   if(viewController.validatePageAccess("/viewResults"))
		        {
		    		
		  
		  			return "rptMonitor";
		        }
		        else {
		            return "no_access";
		        }
		 }
}