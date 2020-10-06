package com.clizo.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;









import com.clizo.dao.*;
import com.clizo.model.*;
import com.clizo.service.QuestionsModelBuilder;
import com.clizo.Util.HibernateUtil;
import com.poiji.bind.Poiji;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.apache.poi.ss.formula.functions.Now;
import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class PathTDSController {

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
    QustnBankController qustnBankController;
    @Autowired
    TrainingController  TrainingController;    
    
    @Autowired
    HttpSession httpSession;
     private String workingDir = System.getProperty("user.dir");
    
     @Autowired
     ResultDetailsDao resultDetailsDao;
     @Autowired
     ResultDao resultDao;
     
    @Autowired 
    QuestionPaperDao questionPaperDao;
    @Autowired 
    parameterDao parameterDao;
    @Autowired
    QustnBankDao qustnbankdao;
    @Autowired
    QuestionPaperQnDao questionpaperqndao;  
    @Autowired
    QuestionPaperDao QuestionPaperDao;
    
    @Autowired
    ResultDao resultdao;      
    @Autowired 
    ExamIdDao examIdDao;
    
      
    
    @RequestMapping(value = "/saveNewScore", method = RequestMethod.POST)
    public @ResponseBody String saveNewScore(ResultModel resultModel,Model model){
    	
    	try{
    	resultModel.setTotalScore(resultModel.getSection1()+resultModel.getSection2()+resultModel.getSection3()+resultModel.getSection4());
    	QuestionPaperModel questionPaper=QuestionPaperDao.findByQuestionpaperid(Long.valueOf(resultModel.getQuestionPaperId()));
    	
    	 if (resultModel.getTotalScore() >= questionPaper.getMaximum_score()){
    		 resultModel.setTotalScore( questionPaper.getMaximum_score());
         }
    	
    	if(questionPaper.getPass_percentage() <= ((resultModel.getTotalScore()/questionPaper.getMaximum_score()))*100){
    		resultModel.setStatus("Passed");
        }
        else {
        	resultModel.setStatus("Failed");
        }
    	if( ((double)((double)resultModel.getTotalScore()/(double)questionPaper.getMaximum_score())*100)>=questionPaper.getPass_percentage()) {
    		resultModel.setStatus("Passed");
        }
        else {
        	resultModel.setStatus("Failed");
        }
    	resultdao.save(resultModel);
    	return "success_"+resultModel.getExamId();
    	
     }catch(Exception e){
    	 return  e.toString();
     }
    }
    
    @RequestMapping(value="/UpgradedResultEdit",method=RequestMethod.GET)
    public String UpgradedResultEdit(@RequestParam(value = "examId", required = false) String examId, Model model){
      try{
        List<ExamModel> examList;      
        List<ResultModel> resultModels = null;
       
        HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
        final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
        HashMap<String, Integer> sectionData = new HashMap<>();
        ArrayList<String> sectionNames = new ArrayList<>();

        /*sectionData.put("Default", 0);
        sectionNames.add("Default");*/           

        final long[] totalTimeTakenByCandidates = new long[1];
        final int[] candidatesPassed = {0};
        final int[] candidatesPassedNew = {0};

        examList = examDao.findAll();  

        if(examId != null){
            examList.forEach(exam -> {
                if (exam.getExamId() != null && exam.getExamId().equals(examId)){
                	QuestionPaperModel questionPaper=QuestionPaperDao.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
                    if (!StringUtils.isEmpty(questionPaper.getSection1()) || !StringUtils.isEmpty(questionPaper.getSection2()) ||  !StringUtils.isEmpty(questionPaper.getSection3())|| !StringUtils.isEmpty(questionPaper.getSection4())){

                        sectionData.put(questionPaper.getSection1(), 0);
                        sectionData.put(questionPaper.getSection2(), 0);
                        sectionData.put(questionPaper.getSection3(), 0);
                        sectionData.put(questionPaper.getSection4(), 0);

                        sectionNames.add(questionPaper.getSection1());
                        sectionNames.add(questionPaper.getSection2());
                        sectionNames.add(questionPaper.getSection3());
                        sectionNames.add(questionPaper.getSection4());

                      //  sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

                        model.addAttribute("sectionNames", sectionNames);
                    }                    
                    
                    model.addAttribute("examName", exam.getExamName());
                    model.addAttribute("examId", examId);
                    model.addAttribute("examDate", exam.getExamDate());
                    model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

                    List<QuestionBankModel> questionBank=new ArrayList();
                    List<QuestionPaperQnModel> questionPaperQn=new ArrayList();
                    questionPaperQn=questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()));
                    questionPaperQn.forEach(questionpaperqn->{
                    	questionBank.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
                	}); 
                    
                    
                    model.addAttribute("totalExamDuration", questionPaper.getTotal_time_allowed());
                    model.addAttribute("maximumScore", questionPaper.getMaximum_score());
                    model.addAttribute("passpercentage", questionPaper.getPass_percentage());
                                       
                    
                    if(!CollectionUtils.isEmpty(sectionData)) {
                    	questionBank.forEach(question -> {
                            if(!StringUtils.isEmpty(question.getSection())){
                            	int qnScore=((questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()))).stream().filter(x->{return x.getQuestionbankid()==(question.getQuestionId()).intValue();}).collect(Collectors.toList())).get(0).getScoreperquestion();                            	
                                sectionData.replace(question.getSection(), sectionData.get(question.getSection()) + qnScore);                            
                            }
                        });
                        model.addAttribute("sectionData", sectionData);                       
                    }                   
                }
            });
            
            
            resultModels=resultdao.findByExamId(examId);
            Collections.sort(resultModels, new ResultComparatorUpgrade());
            /*List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return x.getFinalResult().equalsIgnoreCase("no");}).collect(Collectors.toList());
            List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return x.getFinalResult().equalsIgnoreCase("yes");}).collect(Collectors.toList());*/
    
            List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return x.getScoreType().equalsIgnoreCase("obtained");}).collect(Collectors.toList());
            List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return x.getScoreType().equalsIgnoreCase("new");}).collect(Collectors.toList());
   
            resultModelsOld.forEach(( finalResult) -> {
                totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassed[0] = candidatesPassed[0] + 1;
                }

                //applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                //applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });
            resultModelsNew.forEach(( finalResult) -> {
                //totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassedNew[0] = candidatesPassedNew[0] + 1;
                }

                applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });
            
            /*resultModels.forEach((ResultModel finalResult) -> {
                totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassed[0] = candidatesPassed[0] + 1;
                }

                applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });*/

         
            double passPercentageOld = ((double)candidatesPassed[0]/(double)resultModelsOld.size())*100;
            model.addAttribute("candidatePassPercentageOld", passPercentageOld);
            double passPercentageNew = ((double)candidatesPassedNew[0]/(double)resultModelsNew.size())*100;
            model.addAttribute("candidatePassPercentageNew", passPercentageNew);

            long averageTimeTaken = 0;
            if(resultModels.size() > 0){
                //averageTimeTaken = totalTimeTakenByCandidates[0] / resultModels.size();
            	averageTimeTaken = totalTimeTakenByCandidates[0] / resultModelsOld.size();
            }

            TimeZone tz = TimeZone.getTimeZone("UTC");
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
            df.setTimeZone(tz);

            model.addAttribute("averageTimeTaken", df.format(new Date(averageTimeTaken*1000)));
            model.addAttribute("candidatesPassedOld", candidatesPassed[0]);
            model.addAttribute("candidatesFailedOld", resultModelsOld.size() - candidatesPassed[0]);
            model.addAttribute("candidatesPassedNew", candidatesPassedNew[0]);
            model.addAttribute("candidatesFailedNew", resultModelsNew.size() - candidatesPassedNew[0]);

           
            int i = 0;
            int rank = 0;
            if(resultModelsOld.size() > 0){
            	resultModelsOld.get(0).setRank(1);
                while (i < (resultModelsOld.size()-1)){

                    if (resultModelsOld.get(i).getTotalScore() == resultModelsOld.get(i+1).getTotalScore()){
                    	resultModelsOld.get(i+1).setRank(resultModelsOld.get(i).getRank());
                    }
                    else {

                    	resultModelsOld.get(i+1).setRank(resultModelsOld.get(i).getRank() + 1);
                    }
                    i = i + 1;
                }
            }
            i = 0;
            rank = 0;
            if(resultModelsNew.size() > 0){
            	resultModelsNew.get(0).setRank(1);
                while (i < (resultModelsNew.size()-1)){

                    if (resultModelsNew.get(i).getTotalScore() == resultModelsNew.get(i+1).getTotalScore()){
                    	resultModelsNew.get(i+1).setRank(resultModelsNew.get(i).getRank());
                    }
                    else {

                    	resultModelsNew.get(i+1).setRank(resultModelsNew.get(i).getRank() + 1);
                    }
                    i = i + 1;
                }
            }


            model.addAttribute("applicantDetails", applicantDetails);
            model.addAttribute("resultsOld", resultModelsOld);
            model.addAttribute("resultsNew", resultModelsNew);
            model.addAttribute("noOfCandidatesOld", resultModelsOld.size());
            model.addAttribute("noOfCandidatesNew", resultModelsNew.size());
        }
        

        //model.addAttribute("examList", examList);  //// Filter ExamId as the NEW System does not support old exam/result        
        List<ResultModel> resultExm = resultdao.findAll();
        HashSet<Object> seen=new HashSet<>();
        resultExm.removeIf(e->!seen.add(e.getExamId()));
        List<ExamModel> examResLst=new ArrayList<ExamModel>();
        for(ResultModel f:resultExm){
        	examResLst.add(examDao.findByExamId(f.getExamId()));
        }
        examList=examResLst;
        model.addAttribute("examList", examList);
        /////////////////////////////////////////////////
        
        if(viewController.validatePageAccess("/viewResults")){
      	  return "UpgradedResultEdit";
        } else {     
      	 return "no_access"; 
        }
    	
      }catch (Exception e){           	
    	  return e.toString();
      }
      
       
    }
    
    @RequestMapping(value="/UpgradeScoreResult",method=RequestMethod.GET)
    public String UpgradeScoreResult(Model model){
            
    	return "UpgradeScoreResult";    	
    }
    
    @RequestMapping(value="/UpgradedResultIndv",method=RequestMethod.GET)
    public String UpgradedResultIndv(@RequestParam(value = "examId", required = false) String examId,@RequestParam(value = "resultId", required = false) String resultId, Model model){
    	try{
    		List<ExamModel> examList;      
            //List<ResultModel> resultModels = null;
           
            HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
            final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
            HashMap<String, Integer> sectionData = new HashMap<>();
            ArrayList<String> sectionNames = new ArrayList<>();

            /*sectionData.put("Default", 0);
            sectionNames.add("Default");*/           

            final long[] totalTimeTakenByCandidates = new long[1];
            final int[] candidatesPassed = {0};
            final int[] candidatesPassedNew = {0};

            examList = examDao.findAll();  
         
            if(examId != null){
                examList.forEach(exam -> {
                    if (exam.getExamId() != null && exam.getExamId().equals(examId)){
                    	QuestionPaperModel questionPaper=QuestionPaperDao.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));         
                    	if (!StringUtils.isEmpty(questionPaper.getSection1()) || !StringUtils.isEmpty(questionPaper.getSection2()) ||  !StringUtils.isEmpty(questionPaper.getSection3())|| !StringUtils.isEmpty(questionPaper.getSection4())){

                            sectionData.put(questionPaper.getSection1(), 0);
                            sectionData.put(questionPaper.getSection2(), 0);
                            sectionData.put(questionPaper.getSection3(), 0);
                            sectionData.put(questionPaper.getSection4(), 0);

                            sectionNames.add(questionPaper.getSection1());
                            sectionNames.add(questionPaper.getSection2());
                            sectionNames.add(questionPaper.getSection3());
                            sectionNames.add(questionPaper.getSection4());

                          //  sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

                            model.addAttribute("sectionNames", sectionNames);
                        }                    
                        
                        model.addAttribute("examName", exam.getExamName());
                        model.addAttribute("examId", examId);
                        model.addAttribute("examDate", exam.getExamDate());
                        model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

                        List<QuestionBankModel> questionBank=new ArrayList();
                        List<QuestionPaperQnModel> questionPaperQn=new ArrayList();
                        questionPaperQn=questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()));
                        questionPaperQn.forEach(questionpaperqn->{
                        	questionBank.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
                    	}); 
                        
                        
                        model.addAttribute("totalExamDuration", questionPaper.getTotal_time_allowed());
                        model.addAttribute("maximumScore", questionPaper.getMaximum_score());
                        model.addAttribute("passpercentage", questionPaper.getPass_percentage());
                                         
                        
                        if(!CollectionUtils.isEmpty(sectionData)) {
                        	questionBank.forEach(question -> {
                                if(!StringUtils.isEmpty(question.getSection())){
                                	int qnScore=((questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()))).stream().filter(x->{return x.getQuestionbankid()==(question.getQuestionId()).intValue();}).collect(Collectors.toList())).get(0).getScoreperquestion();                            	
                                    sectionData.replace(question.getSection(), sectionData.get(question.getSection()) + qnScore);                            
                                }
                            });
                            model.addAttribute("sectionData", sectionData);                       
                        }                   
                    }
                });
            }
            ResultModel resultModels=resultdao.findById(Integer.parseInt(resultId));
            resultModels.setStatus(resultModels.getStatus().toUpperCase());
            model.addAttribute("resultModels", resultModels);
            
            Integer maxSC=0;
            maxSC=sectionData.get(sectionNames.get(0))+ sectionData.get(sectionNames.get(1))+ sectionData.get(sectionNames.get(2))+ sectionData.get(sectionNames.get(3));
            model.addAttribute("maxSC", maxSC);
            Integer obtSc=0;
            obtSc=resultModels.getSection1()+resultModels.getSection2()+resultModels.getSection3()+resultModels.getSection4();
            model.addAttribute("obtSc", obtSc);
            
            if(viewController.validatePageAccess("/viewResults")){
    			return "UpgradedResultIndv";
    		} else {     
    			return "no_access"; 
    		}
      	
        }catch (Exception e){           	
      	  return e.toString();
        }
    }
    
    
    
    @RequestMapping(value="/UpgradedResultCons",method=RequestMethod.GET)
    public String UpgradedResultCons(@RequestParam(value = "examId", required = false) String examId, Model model){
      try{
        List<ExamModel> examList;      
        List<ResultModel> resultModels = null;
       
        HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
        final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
        HashMap<String, Integer> sectionData = new HashMap<>();
        ArrayList<String> sectionNames = new ArrayList<>();

        /*sectionData.put("Default", 0);
        sectionNames.add("Default");*/           

        final long[] totalTimeTakenByCandidates = new long[1];
        final int[] candidatesPassed = {0};
        final int[] candidatesPassedNew = {0};

        examList = examDao.findAll();  

        if(examId != null){
            examList.forEach(exam -> {
                if (exam.getExamId() != null && exam.getExamId().equals(examId)){
                	QuestionPaperModel questionPaper=QuestionPaperDao.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
                    if (!StringUtils.isEmpty(questionPaper.getSection1()) || !StringUtils.isEmpty(questionPaper.getSection2()) ||  !StringUtils.isEmpty(questionPaper.getSection3())|| !StringUtils.isEmpty(questionPaper.getSection4())){

                        sectionData.put(questionPaper.getSection1(), 0);
                        sectionData.put(questionPaper.getSection2(), 0);
                        sectionData.put(questionPaper.getSection3(), 0);
                        sectionData.put(questionPaper.getSection4(), 0);

                        sectionNames.add(questionPaper.getSection1());
                        sectionNames.add(questionPaper.getSection2());
                        sectionNames.add(questionPaper.getSection3());
                        sectionNames.add(questionPaper.getSection4());

                      //  sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

                        model.addAttribute("sectionNames", sectionNames);
                    }                    
                    
                    model.addAttribute("examName", exam.getExamName());
                    model.addAttribute("examId", examId);
                    model.addAttribute("examDate", exam.getExamDate());
                    model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

                    List<QuestionBankModel> questionBank=new ArrayList();
                    List<QuestionPaperQnModel> questionPaperQn=new ArrayList();
                    questionPaperQn=questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()));
                    questionPaperQn.forEach(questionpaperqn->{
                    	questionBank.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
                	}); 
                    
                    
                    model.addAttribute("totalExamDuration", questionPaper.getTotal_time_allowed());
                    model.addAttribute("maximumScore", questionPaper.getMaximum_score());
                    model.addAttribute("passpercentage", questionPaper.getPass_percentage());
                                       
                    
                    if(!CollectionUtils.isEmpty(sectionData)) {
                    	questionBank.forEach(question -> {
                            if(!StringUtils.isEmpty(question.getSection())){
                            	int qnScore=((questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()))).stream().filter(x->{return x.getQuestionbankid()==(question.getQuestionId()).intValue();}).collect(Collectors.toList())).get(0).getScoreperquestion();                            	
                                sectionData.replace(question.getSection(), sectionData.get(question.getSection()) + qnScore);                            
                            }
                        });
                        model.addAttribute("sectionData", sectionData);                       
                    }                   
                }
            });
            
            
            resultModels=resultdao.findByExamId(examId);
            Collections.sort(resultModels, new ResultComparatorUpgrade());
            /*List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return x.getFinalResult().equalsIgnoreCase("no");}).collect(Collectors.toList());
            List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return x.getFinalResult().equalsIgnoreCase("yes");}).collect(Collectors.toList());*/
            List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return x.getScoreType().equalsIgnoreCase("obtained");}).collect(Collectors.toList());
            List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return x.getScoreType().equalsIgnoreCase("new");}).collect(Collectors.toList());
   
    
            resultModelsOld.forEach(( finalResult) -> {
                totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassed[0] = candidatesPassed[0] + 1;
                }

                //applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                //applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });
            resultModelsNew.forEach(( finalResult) -> {
                //totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassedNew[0] = candidatesPassedNew[0] + 1;
                }

                applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });
            
            ////////////
            ArrayList<ResultModel> resultModelsNew1=new ArrayList<ResultModel>();
            Integer pass1=0;
            Integer fail1=0;
            Long avgTm=new Long(0);
            for(ResultModel r:resultModelsOld){
            	String chk="false";
            	for(ResultModel rN:resultModelsNew){
            		if(rN.getApplicantId().longValue()==r.getApplicantId().longValue()){
            			chk="true";
            			avgTm = avgTm + rN.getTimeTaken();                        
            			if (rN.getStatus().equals("Passed")){pass1=pass1+1;}
            			if (rN.getStatus().equals("Failed")){fail1=fail1+1;}
            			resultModelsNew1.add(rN);
            		}
            	}
            	if(chk=="false"){
            		avgTm = avgTm + r.getTimeTaken();
            		if (r.getStatus().equals("Passed")){pass1=pass1+1;}
            		if (r.getStatus().equals("Failed")){fail1=fail1+1;}
            		resultModelsNew1.add(r);
                }
            	
            }            
            
            double passPercentage = ((double)pass1/(double)resultModelsNew1.size())*100;
            model.addAttribute("candidatePassPercentage", passPercentage);      

            long averageTimeTaken = 0;
            if(resultModelsNew1.size() > 0){
                //averageTimeTaken = avgTm / resultModelsNew1.size();
                averageTimeTaken = avgTm / resultModelsOld.size();
            }
            TimeZone tz = TimeZone.getTimeZone("UTC");
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
            df.setTimeZone(tz);
            model.addAttribute("averageTimeTaken", df.format(new Date(averageTimeTaken*1000)));
            
            model.addAttribute("candidatesPassed", pass1);
            model.addAttribute("candidatesFailed", fail1);
            
           
            int i = 0;
            int rank = 0;
            
            if(resultModelsNew1.size() > 0){
            	resultModelsNew1.get(0).setRank(1);
                while (i < (resultModelsNew1.size()-1)){

                    if (resultModelsNew1.get(i).getTotalScore() == resultModelsNew1.get(i+1).getTotalScore()){
                    	resultModelsNew1.get(i+1).setRank(resultModelsNew1.get(i).getRank());
                    }
                    else {

                    	resultModelsNew1.get(i+1).setRank(resultModelsNew1.get(i).getRank() + 1);
                    }
                    i = i + 1;
                }
            }


            model.addAttribute("applicantDetails", applicantDetails);
            model.addAttribute("resultsOld", resultModelsOld);
            model.addAttribute("resultsNew", resultModelsNew);
            model.addAttribute("resultsNew1", resultModelsNew1);
            model.addAttribute("noOfCandidates", resultModelsNew1.size());
           
        }
        

        //model.addAttribute("examList", examList);   //// Filter ExamId as the NEW System does not support old exam/result        
        List<ResultModel> resultExm = resultdao.findAll();
        HashSet<Object> seen=new HashSet<>();
        resultExm.removeIf(e->!seen.add(e.getExamId()));
        List<ExamModel> examResLst=new ArrayList<ExamModel>();
        for(ResultModel f:resultExm){
        	examResLst.add(examDao.findByExamId(f.getExamId()));
        }
        examList=examResLst;
        model.addAttribute("examList", examList);
        /////////////////////////////////////////////////
        List<ApplicantRegisterModel> allApplicant=applicantRegisterDao.findAll();
        model.addAttribute("allApplicant", allApplicant);
        
        
        if(viewController.validatePageAccess("/viewResults")){
      	  return "UpgradedResultCons";
        } else {     
      	 return "no_access"; 
        }
    	
      }catch (Exception e){           	
    	  return e.toString();
      }
      
       
    }
    
    @RequestMapping(value="/UpgradedResult",method=RequestMethod.GET)
    public String UpgradedResult(@RequestParam(value = "examId", required = false) String examId, Model model){
      try{
        List<ExamModel> examList;      
        List<ResultModel> resultModels = null;
       
        HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
        final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
        HashMap<String, Integer> sectionData = new HashMap<>();
        ArrayList<String> sectionNames = new ArrayList<>();

        /*sectionData.put("Default", 0);
        sectionNames.add("Default");*/           

        final long[] totalTimeTakenByCandidates = new long[1];
        final int[] candidatesPassed = {0};
        final int[] candidatesPassedNew = {0};

        examList = examDao.findAll();  

        if(examId != null){
            examList.forEach(exam -> {
                if (exam.getExamId() != null && exam.getExamId().equals(examId)){
                	QuestionPaperModel questionPaper=QuestionPaperDao.findByQuestionpaperid(Long.valueOf(exam.getQuestionPaperNumber()));
                    if (!StringUtils.isEmpty(questionPaper.getSection1()) || !StringUtils.isEmpty(questionPaper.getSection2()) ||  !StringUtils.isEmpty(questionPaper.getSection3())|| !StringUtils.isEmpty(questionPaper.getSection4())){

                        sectionData.put(questionPaper.getSection1(), 0);
                        sectionData.put(questionPaper.getSection2(), 0);
                        sectionData.put(questionPaper.getSection3(), 0);
                        sectionData.put(questionPaper.getSection4(), 0);

                        sectionNames.add(questionPaper.getSection1());
                        sectionNames.add(questionPaper.getSection2());
                        sectionNames.add(questionPaper.getSection3());
                        sectionNames.add(questionPaper.getSection4());

                      //  sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

                        model.addAttribute("sectionNames", sectionNames);
                    }                    
                    
                    model.addAttribute("examName", exam.getExamName());
                    model.addAttribute("examId", examId);
                    model.addAttribute("examDate", exam.getExamDate());
                    model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

                    List<QuestionBankModel> questionBank=new ArrayList();
                    List<QuestionPaperQnModel> questionPaperQn=new ArrayList();
                    questionPaperQn=questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()));
                    questionPaperQn.forEach(questionpaperqn->{
                    	questionBank.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
                	}); 
                    
                    
                    model.addAttribute("totalExamDuration", questionPaper.getTotal_time_allowed());
                    model.addAttribute("maximumScore", questionPaper.getMaximum_score());
                    model.addAttribute("passpercentage", questionPaper.getPass_percentage());
                                       
                    
                    if(!CollectionUtils.isEmpty(sectionData)) {
                    	questionBank.forEach(question -> {
                            if(!StringUtils.isEmpty(question.getSection())){
                            	int qnScore=((questionpaperqndao.findByquestionpaperid(Integer.parseInt(exam.getQuestionPaperNumber()))).stream().filter(x->{return x.getQuestionbankid()==(question.getQuestionId()).intValue();}).collect(Collectors.toList())).get(0).getScoreperquestion();                            	
                                sectionData.replace(question.getSection(), sectionData.get(question.getSection()) + qnScore);                            
                            }
                        });
                        model.addAttribute("sectionData", sectionData);                       
                    }                   
                }
            });
            
            
            resultModels=resultdao.findByExamId(examId);
            Collections.sort(resultModels, new ResultComparatorUpgrade());
            /*List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return x.getFinalResult().equalsIgnoreCase("no");}).collect(Collectors.toList());
            List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return x.getFinalResult().equalsIgnoreCase("yes");}).collect(Collectors.toList());
    */
            List<ResultModel> resultModelsOld=resultModels.stream().filter(x->{return x.getScoreType().equalsIgnoreCase("obtained");}).collect(Collectors.toList());
            List<ResultModel> resultModelsNew=resultModels.stream().filter(x->{return x.getScoreType().equalsIgnoreCase("new");}).collect(Collectors.toList());
   
            resultModelsOld.forEach(( finalResult) -> {
                totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassed[0] = candidatesPassed[0] + 1;
                }

                //applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                //applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });
            resultModelsNew.forEach(( finalResult) -> {
                //totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassedNew[0] = candidatesPassedNew[0] + 1;
                }

                applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });
            
            /*resultModels.forEach((ResultModel finalResult) -> {
                totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassed[0] = candidatesPassed[0] + 1;
                }

                applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });*/

         
            double passPercentageOld = ((double)candidatesPassed[0]/(double)resultModelsOld.size())*100;
            model.addAttribute("candidatePassPercentageOld", passPercentageOld);
            double passPercentageNew = ((double)candidatesPassedNew[0]/(double)resultModelsNew.size())*100;
            model.addAttribute("candidatePassPercentageNew", passPercentageNew);

            long averageTimeTaken = 0;
            if(resultModels.size() > 0){
                //averageTimeTaken = totalTimeTakenByCandidates[0] / resultModels.size();
            	averageTimeTaken = totalTimeTakenByCandidates[0] / resultModelsOld.size();
            }

            TimeZone tz = TimeZone.getTimeZone("UTC");
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
            df.setTimeZone(tz);

            model.addAttribute("averageTimeTaken", df.format(new Date(averageTimeTaken*1000)));
            model.addAttribute("candidatesPassedOld", candidatesPassed[0]);
            model.addAttribute("candidatesFailedOld", resultModelsOld.size() - candidatesPassed[0]);
            model.addAttribute("candidatesPassedNew", candidatesPassedNew[0]);
            model.addAttribute("candidatesFailedNew", resultModelsNew.size() - candidatesPassedNew[0]);

           
            int i = 0;
            int rank = 0;
            if(resultModelsOld.size() > 0){
            	resultModelsOld.get(0).setRank(1);
                while (i < (resultModelsOld.size()-1)){

                    if (resultModelsOld.get(i).getTotalScore() == resultModelsOld.get(i+1).getTotalScore()){
                    	resultModelsOld.get(i+1).setRank(resultModelsOld.get(i).getRank());
                    }
                    else {

                    	resultModelsOld.get(i+1).setRank(resultModelsOld.get(i).getRank() + 1);
                    }
                    i = i + 1;
                }
            }
            i = 0;
            rank = 0;
            if(resultModelsNew.size() > 0){
            	resultModelsNew.get(0).setRank(1);
                while (i < (resultModelsNew.size()-1)){

                    if (resultModelsNew.get(i).getTotalScore() == resultModelsNew.get(i+1).getTotalScore()){
                    	resultModelsNew.get(i+1).setRank(resultModelsNew.get(i).getRank());
                    }
                    else {

                    	resultModelsNew.get(i+1).setRank(resultModelsNew.get(i).getRank() + 1);
                    }
                    i = i + 1;
                }
            }


            model.addAttribute("applicantDetails", applicantDetails);
            model.addAttribute("resultsOld", resultModelsOld);
            model.addAttribute("resultsNew", resultModelsNew);
            model.addAttribute("noOfCandidatesOld", resultModelsOld.size());
            model.addAttribute("noOfCandidatesNew", resultModelsNew.size());
        }
        

        //model.addAttribute("examList", examList);   //// Filter ExamId as the NEW System does not support old exam/result        
        List<ResultModel> resultExm = resultdao.findAll();
        HashSet<Object> seen=new HashSet<>();
        resultExm.removeIf(e->!seen.add(e.getExamId()));
        List<ExamModel> examResLst=new ArrayList<ExamModel>();
        for(ResultModel f:resultExm){
        	examResLst.add(examDao.findByExamId(f.getExamId()));
        }
        examList=examResLst;
        model.addAttribute("examList", examList);
        /////////////////////////////////////////////////
        List<ApplicantRegisterModel> allApplicant=applicantRegisterDao.findAll();
        model.addAttribute("allApplicant", allApplicant);
        
        if(viewController.validatePageAccess("/viewResults")){
      	  return "UpgradedResult";
        } else {     
      	 return "no_access"; 
        }
    	
      }catch (Exception e){           	
    	  return e.toString();
      }
      
       
    }
    
    @RequestMapping(value = "/UpgradedReportCard", method = RequestMethod.GET)
    public String UpgradedReportCard(@RequestParam( value = "examId", required = false) String examId,
                                 @RequestParam( value = "applicantId", required = false) String applicantId, 
                                 @RequestParam( value = "finalR", required = false) String finalR, 
                                 Model model){
    	try{
    	int scoretotal=0;
    	int scoreobtain=0;
    	int y=Integer.parseInt(finalR);
    	
    	List<ResultDetailsModel> resultDetails;       
        List<ResultModel> result;       
        ArrayList<Integer> scorearray = new ArrayList<Integer>();
        ExamModel exmvalue;
        result=resultdao.findByApplicantId(Long.parseLong(applicantId));       
        resultDetails=resultDetailsDao.findByApplicantId(Long.parseLong(applicantId));        
        exmvalue=examDao.findByExamId(examId);       
        
        String questionPaperNumber =String.valueOf(result.get(y).getQuestionPaperId());        
        ArrayList<Integer> scoreobtained = new ArrayList<Integer>();
        QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(Long.valueOf(questionPaperNumber));
		
        List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(Integer.parseInt(questionPaperNumber));
        List<QuestionBankModel> questionbankList=new ArrayList<QuestionBankModel>();
                	
        questionpaperQn.forEach(questionpaperqn->{
            		questionbankList.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
            		});
        
           questionpaperQn.forEach(questionscore -> {
			scorearray.add(questionscore.getScoreperquestion());
			
			});
        for(int i=0;i<scorearray.size();i++) {
			scoretotal+=scorearray.get(i);	
		}
        
        
        resultDetails.forEach(scores -> {
        	scoreobtained.add(scores.getTotalScore());
			
			});
        for(int p=0;p<scoreobtained.size();p++) {
        	scoreobtain+=scoreobtained.get(p);	
		}  

        questionbankList.sort((question1, question2) -> question1.getQuestionId().compareTo(question2.getQuestionId()));
        resultDetails.sort((result1,result2) -> Integer.compare(result1.getQuestionId(),result2.getQuestionId()));

        if(y==0){resultDetails.forEach(x->{if(x.getCorrectDesc()!=null){x.setTotalScore(0);}}); }
        //if(y==0){result.get(0).setStatus("Pending");}
        
        model.addAttribute("applicantName", (applicantRegisterDao.findOne(Long.valueOf(applicantId))).getCandidateName());
        model.addAttribute("examId",examId);
        model.addAttribute("scoretotal", scoretotal);
        model.addAttribute("scoreobtains", scoreobtain);
        model.addAttribute("result", result.get(y));  
        List<ResultDetailsModel> resultdetailsM=resultDetails;
        Collections.sort(resultdetailsM,new Comparator<ResultDetailsModel>() {
	        public int compare(ResultDetailsModel p1, ResultDetailsModel p2) {
	            return Long.valueOf(new Long(p1.getQuestionId())).compareTo(new Long(p2.getQuestionId()));
	         }
        });
        resultDetails=resultdetailsM;
        model.addAttribute("resultDetails", resultDetails);     
        model.addAttribute("questionHeader", questionpapermodel); 
        model.addAttribute("questionNo", questionpapermodel.getNo_of_question_for_evaluation()); 
        model.addAttribute("questionbankList", questionbankList);         
     
        model.addAttribute("percentage", (result.get(y).getTotalScore()/questionpapermodel.getMaximum_score())*100);
        model.addAttribute("exmname", exmvalue.getExamName());
        TimeZone tz = TimeZone.getTimeZone("UTC");
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        df.setTimeZone(tz);
        model.addAttribute("timeTaken", df.format(new Date(result.get(0).getTimeTaken()*1000)));
          
        if(viewController.validatePageAccess("/viewResults")){
        	return "UpgradedReportCard";
        } else {     
      	 return "no_access"; 
        }
     }catch (Exception e){           	
    	 return e.toString();
     }
      

    }   
    
    /*@RequestMapping(value="/UpgradeScoreSearch",method=RequestMethod.GET)
    public String getUpgradedScoreSearch(Model model){   	
    	try{
         List<ApplicantRegisterModel> applicantRegister=applicantRegisterDao.findAll();    	
    	List<ExamModel> examLst=examDao.findAll();
         model.addAttribute("applicantRegister", applicantRegister);		
         model.addAttribute("examLst", examLst);  
    		  
         if(viewController.validatePageAccess("/viewResults")){
        	 return "UpgradeScoreSearch";     
         } else {     
       	 return "no_access"; 
         }
    	}catch (Exception e){           	
    		return e.toString();
       }
        
    }  */ 
    
    @RequestMapping(value="/UpgradeScoreSearch",method=RequestMethod.GET)
    public String getUpgradedScoreSearch(
    		@RequestParam(value = "examID", required = false,defaultValue="nothing") String examID,
    		Model model){   	
    	try{
    	 List<ResultDetailsModel> resultDetails=new ArrayList();	
         List<ApplicantRegisterModel> applicantRegister=applicantRegisterDao.findAll();    	
    	 //List<ExamModel> examLst=examDao.findAll();
         List<ExamModel> examLst=new ArrayList();
         if(!examID.equalsIgnoreCase("nothing")){//examid selected
        	  	applicantRegister=applicantRegisterDao.findByExamId(examID);      	   
           	  	resultDetails= resultDetailsDao.findByExamId(examID);
           	  	//checking descriptive questions exists
           	  	resultDetails= resultDetails.stream().filter(x->{return x.getCorrectDesc()!=null;}).collect(Collectors.toList());
           	  	if(resultDetails.size()<1){
           	  		applicantRegister=null; 
           	  	}
      	     
         }else{  //initialize page
        	 resultDetails= resultDetailsDao.findAll();
        	 for(ResultDetailsModel rd:resultDetails){
        		 if(rd.getCorrectDesc()!=null){
        			if (!examLst.contains(examDao.findAllByExamId(rd.getExamId()))){
        				examLst.add(examDao.findByExamId(rd.getExamId()));
        			}
        		 }
        		 
        	 }
        	 applicantRegister=null;
         }
         
         if(examID.equalsIgnoreCase("nothing")){examID="";}
         System.out.print("examID: "+examID);
         model.addAttribute("applicantRegister", applicantRegister);		
         examLst=examLst.stream().distinct().collect(Collectors.toList());
         model.addAttribute("examLst", examLst);
         model.addAttribute("examLstsel", examID);
    		  
         if(viewController.validatePageAccess("/viewResults")){
        	 return "UpgradeScoreSearch";     
         } else {     
       	 return "no_access"; 
         }
    	}catch (Exception e){           	
    		return e.toString();
       }
        
    }     
       
   
    
    @RequestMapping(value="/checkValidUpgradeScores",method=RequestMethod.POST)
    public @ResponseBody String  checkValidUpgradeScores(
    		@RequestParam(value = "applicantID", required = false,defaultValue="0") String applicantID,
    		@RequestParam(value = "examID", required = false,defaultValue="nothing") String examID,    		
    		Model model){     	   
   	
    	final int[] chkvalidappl={0};
        chkvalidappl[0]=0;
    	List<ResultModel> resultLst=new ArrayList();
    	resultLst=resultdao.findByApplicantId(Long.valueOf(applicantID));    
    	resultLst=resultLst.stream().filter(x->{return x.getExamId().equalsIgnoreCase(examID);}).collect(Collectors.toList());    
    	//resultLst=resultdao.findAll().stream().filter(x->{return x.getApplicantId()==Long.valueOf(applicantID) && x.getExamId().equalsIgnoreCase(examID);}).collect(Collectors.toList());
    	
    	if(resultLst.size()>0){
    		//resultLst.forEach(x-> {if(x.getFinalResult().equalsIgnoreCase("yes")){chkvalidappl[0]=1;}}); 
    		resultLst.forEach(x-> {if(x.getScoreType().equalsIgnoreCase("new")){chkvalidappl[0]=1;}}); 
    	} 
    	else{chkvalidappl[0]=1;}
    	
    	if(chkvalidappl[0]==0){ 
    	 return "success";
        }else{
         return "fail";
        }
   }
    
    @RequestMapping(value = "/updateUpgradeScores", method = RequestMethod.POST)
    public @ResponseBody String updateUpgradeScores(@RequestBody ResultDetailsPOJO[] resultDetailsList){

        int i = 0;
        if(resultDetailsList != null){
            while(i < resultDetailsList.length){
               resultDetailsDao.setNewscoreForApplicant(resultDetailsList[i].getNewScore(), resultDetailsList[i].getId());
            	i++;
              }
        }
        computeFinalResult();
        return "success";
    }
    
    public void computeFinalResult(){

        try{          	 
            final double[] passPercentage = {0};
            final int[] totalScore = {0};
            final int[] correctAnswers = {0};
            final int[] questionsAttempted = {0};
            final int[] maximumScore = {0};
            HashMap<String, Integer> sectionScore = new HashMap<String, Integer>();
            
            ResultModel resultModel = new ResultModel();
            resultModel=resultdao.findByApplicantIdAndExamId((Long) httpSession.getAttribute("upgradeApplicantId"), httpSession.getAttribute("upgradeExamId").toString());
            
            List<ResultDetailsModel> resultDetailsModel = resultDetailsDao.findByApplicantId((Long) httpSession.getAttribute("upgradeApplicantId"));             
            if(resultDetailsModel.size()>0){            	 
            resultDetailsModel=(List<ResultDetailsModel>)resultDetailsModel.stream().filter(x->{return x.getExamId().equals((String)httpSession.getAttribute("upgradeExamId"));}).collect(Collectors.toList());    
                        
            resultDetailsModel.forEach(resultDetails -> {
            	questionsAttempted[0] = questionsAttempted[0] + 1;              
                QuestionPaperModel questionPaperModel=questionPaperDao.findByQuestionpaperid((Long)httpSession.getAttribute("upgradeQuestionPaperId"));
                passPercentage[0] = questionPaperModel.getPass_percentage();
                maximumScore[0] = questionPaperModel.getMaximum_score();                 
                if(resultDetails.getCorrectDesc()!=null){
                	if(resultDetails.getQnScore()==resultDetails.getTotalScore()){
                		correctAnswers[0] = correctAnswers[0] + 1;
                	}
                	totalScore[0] = totalScore[0] + resultDetails.getNewScore();
                	if(sectionScore.containsKey(resultDetails.getSection())){
                        sectionScore.replace(resultDetails.getSection(),  sectionScore.getOrDefault(resultDetails.getSection(), 0) + resultDetails.getNewScore());
                    }
                    else {
                        sectionScore.put(resultDetails.getSection(), sectionScore.getOrDefault(resultDetails.getSection(), 0) +resultDetails.getNewScore());
                    } 
                }               
           	 
           	   if(resultDetails.getCorrectOption()!=null && resultDetails.getMarkedOption()!=null){
                  if((resultDetails.getCorrectOption()).equalsIgnoreCase(resultDetails.getMarkedOption())){
                    correctAnswers[0] = correctAnswers[0] + 1;
                    totalScore[0] = totalScore[0] + resultDetails.getQnScore();

                    if(sectionScore.containsKey(resultDetails.getSection())){
                        sectionScore.replace(resultDetails.getSection(),  sectionScore.getOrDefault(resultDetails.getSection(), 0) + resultDetails.getQnScore());
                    }
                    else {
                        sectionScore.put(resultDetails.getSection(), sectionScore.getOrDefault(resultDetails.getSection(), 0) +resultDetails.getQnScore());
                    }                    
                   
                  }
           	  }           	         	 

            });
                        
            if (totalScore[0] >= maximumScore[0]){
                totalScore[0] = maximumScore[0];
            }

            ResultModel resultModell = new ResultModel();

            resultModell.setQuestionsAttempted(questionsAttempted[0]);
            resultModell.setApplicantId(resultModel.getApplicantId());
            resultModell.setTotalScore(totalScore[0]);
            resultModell.setCorrectAnswers(correctAnswers[0]);
            resultModell.setExamId(resultDetailsModel.get(0).getExamId());
            Long i=(Long)httpSession.getAttribute("upgradeQuestionPaperId");
            resultModell.setQuestionPaperId(Math.toIntExact(i));
            
            QuestionPaperModel questionPaperModell=questionPaperDao.findByQuestionpaperid((Long)httpSession.getAttribute("upgradeQuestionPaperId"));
            sectionScore.forEach((section, score) -> {
                if (section.equalsIgnoreCase(questionPaperModell.getSection1())){
                	resultModell.setSection1(score);
                }
                else if(section.equalsIgnoreCase(questionPaperModell.getSection2())){
                	resultModell.setSection2(score);
                }
                else if(section.equalsIgnoreCase(questionPaperModell.getSection3())){
                	resultModell.setSection3(score);
                }else if(section.equalsIgnoreCase(questionPaperModell.getSection4())){
                	resultModell.setSection4(score);
                }

            });
                		            
            resultModell.setFinalResult("yes");
            resultModell.setTimeTaken(resultModel.getTimeTaken());
            resultModell.setScoreType("new");            
            resultModell.setAttendedDate(resultModel.getAttendedDate());
            resultModell.setAttendedTime(resultModel.getAttendedTime());

            if(passPercentage[0] <= ((totalScore[0]/maximumScore[0]))*100){
            	resultModell.setStatus("Passed");
            }
            else {
            	resultModell.setStatus("Failed");
            }
            
            // status of the exam 
            
            if( ((double)((double)totalScore[0]/(double)maximumScore[0])*100)>=passPercentage[0]) {
            	resultModell.setStatus("Passed");
            }
            else {
            	resultModell.setStatus("Failed");
            }
            

            ApplicantRegisterModel applicantRegisterModel = applicantRegisterDao.findOne(Long.valueOf((Long) httpSession.getAttribute("upgradeApplicantId")));
            resultModell.setApplicantName(applicantRegisterModel.getCandidateName());

            //////////////////////////////////////
            ////// resultDao.save(resultModell);
            //////////// Combining multiple choice and descriptive scores and updating the table with status change
            resultModel.setQuestionsAttempted(resultModell.getQuestionsAttempted());
            resultModel.setApplicantId(resultModell.getApplicantId());
            resultModel.setSection1(resultModell.getSection1());
            resultModel.setSection2(resultModell.getSection2());
            resultModel.setSection3(resultModell.getSection3());
            resultModel.setSection4(resultModell.getSection4());
            resultModel.setTotalScore(resultModell.getTotalScore());
            resultModel.setCorrectAnswers(resultModell.getCorrectAnswers());
            resultModel.setExamId(resultModell.getExamId());           
            resultModel.setQuestionPaperId(resultModell.getQuestionPaperId());
            resultModel.setFinalResult("no");
            resultModel.setTimeTaken(resultModell.getTimeTaken());
            resultModel.setScoreType("obtained");            
            resultModel.setAttendedDate(resultModell.getAttendedDate());
            resultModel.setAttendedTime(resultModell.getAttendedTime());
            resultModel.setStatus(resultModell.getStatus());
            resultDao.save(resultModel);
            ////////////////////////////////////////////

            applicantRegisterModel.setExamAttended("true");
            applicantRegisterDao.updateExamAttendedStatus("true", resultModel.getApplicantId());

            //httpSession.invalidate();
            //httpSession.getAttribute("applicantId");
          }

            
        }
        catch (Exception e){           	
          
        }
    }
      
   
    @RequestMapping(value="/UpgradeScore",method=RequestMethod.GET)
    public String  getUpgradedScores(
    		@RequestParam(value = "applicantID", required = false,defaultValue="0") String applicantID,
    		@RequestParam(value = "examID", required = false,defaultValue="nothing") String examID,    		
    		Model model){  
     try
      {
    	final int[] totals={0};
    	List<QuestionBankModel> QnBankLst=qustnbankdao.findAll();
  	    List<ResultDetailsModel> resultDetails=new ArrayList();
  	    List<ResultDetailsModel> resultDetailsTot=new ArrayList();
 	      if (!applicantID.equalsIgnoreCase("0") && !examID.equalsIgnoreCase("nothing")){
 	        resultDetails= resultDetailsDao.findByApplicantId(Long.valueOf(applicantID));
 	        resultDetailsTot=resultDetails;
 	        resultDetailsTot.forEach(x->totals[0]=totals[0]+x.getTotalScore());
 	        resultDetails= resultDetails.stream().filter(x->{return x.getExamId().equalsIgnoreCase(examID)&&x.getCorrectDesc()!=null;}).collect(Collectors.toList());
 	       
 	      }
    	 
 	     QuestionPaperModel qnPaper=questionPaperDao.findByQuestionpaperid(Long.valueOf(String.valueOf(resultDetails.get(0).getQuestionpaperId())));
    	 ApplicantRegisterModel applicantRegister=applicantRegisterDao.findByIdAndExamId(Long.valueOf(applicantID), examID);
 	     
    	 ExamModel exam =examDao.findByExamId(examID);   	 
	    	    	 
    	 model.addAttribute("applicantRegister", applicantRegister);
    	 model.addAttribute("exam", exam);
    	 model.addAttribute("QnBankLst", QnBankLst); 
         model.addAttribute("resultDetails", resultDetails);    
         model.addAttribute("QnTotalScore",qnPaper.getTotal_score());
         model.addAttribute("QnPassPercent",qnPaper.getPass_percentage());
         model.addAttribute("ObtainedScore",String.valueOf(totals[0]));
         httpSession.setAttribute("upgradeApplicantId",Long.valueOf( applicantID));           
         httpSession.setAttribute("upgradeExamId", examID);           
         httpSession.setAttribute("upgradeQuestionPaperId", qnPaper.getQuestionpaperid());
         if(viewController.validatePageAccess("/viewResults")){
        	 return "UpgradeScore";       
         } else {     
       	 return "no_access"; 
         }
    
    }
    catch (Exception e){    
    	return e.toString();
      
    }
     
           
   }
    
    @RequestMapping(value = "/QuestionPaperView", method = RequestMethod.GET)
    public String getQuestionPaperView(
    		@RequestParam(value = "actionStr", required = false,defaultValue="nothing") String actionStr,
    		@RequestParam(value = "qnID", required = false,defaultValue="0") String qnID,
    		@RequestParam(value = "score", required = false,defaultValue="0") String score,
    		@RequestParam(value = "questionPaperNumber", required = false,defaultValue="0") String questionPaperNumber,
    		@RequestParam(value = "maxscore", required = false,defaultValue="0") String maxscore,
    		@RequestParam(value = "maxtm", required = false,defaultValue="0") String maxtm,   		
    		Model model){
    	try{
    		int i;
    		String classChk="false";
    		String chkScore="false";
    		String dup="false";
    		String exst="false";
    		Long qn=new Long(questionPaperNumber);
    		QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(qn);
    		
    		if(actionStr.equals("score")){
    			questionpapermodel.setMaximum_score(Integer.valueOf(maxscore));
    			questionpapermodel.setTotal_time_allowed(maxtm);
    			questionPaperDao.save(questionpapermodel);
    		}
    		if(actionStr.equals("delete")){
    		  i= questionpaperqndao.deleteByquestionpaperqnid(Long.parseLong(qnID));
    		  questionpapermodel.setNo_of_question_for_evaluation(questionpapermodel.getNo_of_question_for_evaluation()-1);
    		  questionpapermodel.setTotal_score(String.valueOf(Integer.parseInt(questionpapermodel.getTotal_score())-Integer.parseInt(score)));
    		  questionPaperDao.save(questionpapermodel);
    		}    		
    		if(actionStr.equals("add")){ 
    			List<QuestionPaperQnModel> qnlst=questionpaperqndao.findAll();
        		qnlst=(List<QuestionPaperQnModel>)qnlst.stream().filter(x->{return x.getquestionpaperid()==questionpapermodel.getQuestionpaperid()&&x.getQuestionbankid()==Integer.parseInt(qnID);}).collect(Collectors.toList());    		  
    		  if(qnlst.size()>0){
        		dup="true";
  				model.addAttribute("dup", dup);
    		  }else{
    			if(qustnbankdao.findByQuestionId(Long.parseLong(qnID))==null){
    				exst="true";
      				model.addAttribute("exst", exst);
    			}else{
    			if(qustnbankdao.findByQuestionId(Long.parseLong(qnID)).getClass_name().equals(questionpapermodel.getclassname())
    				&& (qustnbankdao.findByQuestionId(Long.parseLong(qnID)).getSection().equalsIgnoreCase(questionpapermodel.getSection1())
    					|| qustnbankdao.findByQuestionId(Long.parseLong(qnID)).getSection().equalsIgnoreCase(questionpapermodel.getSection2())
    					|| qustnbankdao.findByQuestionId(Long.parseLong(qnID)).getSection().equalsIgnoreCase(questionpapermodel.getSection3())
    					|| qustnbankdao.findByQuestionId(Long.parseLong(qnID)).getSection().equalsIgnoreCase(questionpapermodel.getSection4())
    				   ) 	
    			  ){    				
    			   /*Integer xx=Integer.parseInt(questionpapermodel.getTotal_score())+Integer.parseInt(score);    				
    			   if(xx>=questionpapermodel.getMaximum_score()){*/        	
    			   Integer xx=Integer.parseInt(questionpapermodel.getTotal_score())+Integer.parseInt(score);    				
    			   if(xx<questionpapermodel.getMaximum_score()){       
    					chkScore="true";
    			    	model.addAttribute("chkScore", chkScore);
    			    }else{
    			    	QuestionPaperQnModel questpaperQn=new QuestionPaperQnModel();
        				questpaperQn.setquestionpaperid(Integer.parseInt(questionpapermodel.getQuestionpaperid().toString()));
        			    questpaperQn.setQuestionbankid(Integer.parseInt(qnID));
        			    questpaperQn.setScoreperquestion(score==""?0:Integer.parseInt(score));
        			    questionpaperqndao.save(questpaperQn);
        			    QuestionBankModel qnbank=qustnbankdao.findByQuestionId(Long.parseLong(qnID));
        			    qnbank.setStatus("ACTIVE");    			    
        			    questionpapermodel.setNo_of_question_for_evaluation(questionpapermodel.getNo_of_question_for_evaluation()+1);
        			    questionpapermodel.setTotal_score(String.valueOf(Integer.parseInt(questionpapermodel.getTotal_score())+Integer.parseInt(score)));        			   
    			    	
    			    	qustnbankdao.save(qnbank);
    			    	questionPaperDao.save(questionpapermodel);
    			    }
    			}
    			else{
    				classChk="true";
    				model.addAttribute("classChk", classChk);
    			}
    		  }
    	  	 }
    	   }
    		
    		List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(Integer.parseInt(questionPaperNumber));
    		List<QuestionBankModel> questionbankList=new ArrayList<QuestionBankModel>();
        	
    		questionpaperQn.forEach(questionpaperqn->{
    		questionbankList.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
    		});  
    		
    		ArrayList<String> questionbankAddList = new ArrayList<>();
    		qustnbankdao.findAll().stream().filter(x->{return x.getClass_name().equals(questionpapermodel.getclassname());}).collect(Collectors.toList()).forEach(questionbank -> {
            	questionbankAddList.add(questionbank.getQuestionId().toString());
            });
    		
    		model.addAttribute("questionpapermodel",questionpapermodel);
    		model.addAttribute("questionpaperQn",questionpaperQn);
    		List<QuestionBankModel> questionBankM=questionbankList;
    		Collections.sort(questionBankM,new Comparator<QuestionBankModel>() {
    	        public int compare(QuestionBankModel p1, QuestionBankModel p2) {
    	            return Long.valueOf(new Long(p1.getQuestionId())).compareTo(new Long(p2.getQuestionId()));
    	         }
            });    		
    		//model.addAttribute("questionbankList",questionbankList);
    		model.addAttribute("questionbankList",questionBankM);
    		model.addAttribute("questionbankAddList", questionbankAddList); 	    		
    		
    		
    		if(viewController.validatePageAccess("/QuestionPaper"))
        	{
    			return "QuestionPaperView";
        	}
        	else{
        		return "no_access";
        	}
    		
    	}
    	catch(Exception e){
        	return e.toString();
        }
    }
    
    
    
    
    @RequestMapping(value = "/ViewQustns", method = RequestMethod.GET)
    public String ViewQustns(
    	
    		@RequestParam(value = "questionPaperNumber", required = false,defaultValue="0") String questionPaperNumber,Model model){
    	try{
    		int i;
    		String classChk="false";
    		String dup="false";
    		String exst="false";
    		Long qn=new Long(questionPaperNumber);
    		QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(qn);
    		
    		
    		
    		List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(Integer.parseInt(questionPaperNumber));
    		List<QuestionBankModel> questionbankList=new ArrayList<QuestionBankModel>();
        	
    		questionpaperQn.forEach(questionpaperqn->{
    		questionbankList.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
    		});  
    		
    		ArrayList<String> questionbankAddList = new ArrayList<>();
    		qustnbankdao.findAll().stream().filter(x->{return x.getClass_name().equals(questionpapermodel.getclassname());}).collect(Collectors.toList()).forEach(questionbank -> {
            	questionbankAddList.add(questionbank.getQuestionId().toString());
            });
    		
    		model.addAttribute("questionpapermodel",questionpapermodel);
    		model.addAttribute("questionpaperQn",questionpaperQn);
    		List<QuestionBankModel> questionBankM=questionbankList;
    		Collections.sort(questionBankM,new Comparator<QuestionBankModel>() {
    	        public int compare(QuestionBankModel p1, QuestionBankModel p2) {
    	            return Long.valueOf(new Long(p1.getQuestionId())).compareTo(new Long(p2.getQuestionId()));
    	         }
            });
    		//model.addAttribute("questionbankList",questionbankList);
    		model.addAttribute("questionbankList",questionBankM);
    		model.addAttribute("questionbankAddList", questionbankAddList);
    		List<QuestionPaperModel> QuestnpaperList=QuestionPaperDao.findAll();
    	    model.addAttribute("QuestnpaperList", QuestnpaperList); 
    	    
    	    List<ExamModel> exammodel=examDao.findAllByQuestionPaperNumber(questionPaperNumber);
    		String editquestionpaper="false";
    		if(exammodel.size()>0){
    			editquestionpaper="false";
    		}else{
    			editquestionpaper="true";
    		}
    		model.addAttribute("editquestionpaper",editquestionpaper);
    		
    		//return "ViewQustns";
    		if(viewController.validatePageAccess("/CreateQuestions"))
			{
    			return "ViewQustns";
			}
			else {
			
				return "no_access";
			}
    	}
    	catch(Exception e){
        	return e.toString();
        }
    }
    
    
    @RequestMapping(value = "/ViewQustnsExcel", method = RequestMethod.GET)
    public String ViewQustnsExcel(
    	
    		@RequestParam(value = "questionPaperNumber", required = false,defaultValue="0") String questionPaperNumber,Model model){
    	try{
    		int i;
    		String classChk="false";
    		String dup="false";
    		String exst="false";
    		Long qn=new Long(questionPaperNumber);
    		QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(qn);
    		
    		
    		
    		List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(Integer.parseInt(questionPaperNumber));
    		List<QuestionBankModel> questionbankList=new ArrayList<QuestionBankModel>();
        	
    		questionpaperQn.forEach(questionpaperqn->{
    		questionbankList.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
    		});  
    		
    		ArrayList<String> questionbankAddList = new ArrayList<>();
    		qustnbankdao.findAll().stream().filter(x->{return x.getClass_name().equals(questionpapermodel.getclassname());}).collect(Collectors.toList()).forEach(questionbank -> {
            	questionbankAddList.add(questionbank.getQuestionId().toString());
            });
    		
    		model.addAttribute("questionpapermodel",questionpapermodel);
    		model.addAttribute("questionpaperQn",questionpaperQn);
    		List<QuestionBankModel> questionBankM=questionbankList;
    		Collections.sort(questionBankM,new Comparator<QuestionBankModel>() {
    	        public int compare(QuestionBankModel p1, QuestionBankModel p2) {
    	            return Long.valueOf(new Long(p1.getQuestionId())).compareTo(new Long(p2.getQuestionId()));
    	         }
            });
    		//model.addAttribute("questionbankList",questionbankList);
    		model.addAttribute("questionbankList",questionBankM);
    		model.addAttribute("questionbankAddList", questionbankAddList);
    		List<QuestionPaperModel> QuestnpaperList=QuestionPaperDao.findAll();
    	    model.addAttribute("QuestnpaperList", QuestnpaperList); 
    	    
    	    List<ExamModel> exammodel=examDao.findAllByQuestionPaperNumber(questionPaperNumber);
    		String editquestionpaper="false";
    		if(exammodel.size()>0){
    			editquestionpaper="false";
    		}else{
    			editquestionpaper="true";
    		}
    		model.addAttribute("editquestionpaper",editquestionpaper);
    		
    		//return "ViewQustns";
    		if(viewController.validatePageAccess("/CreateQuestions"))
			{
    			return "ViewQustnsExcel";
			}
			else {
			
				return "no_access";
			}
    	}
    	catch(Exception e){
        	return e.toString();
        }
    }
    
    @RequestMapping(value="/QuestionPaper",method=RequestMethod.GET)
    public String loadQuestionPaper(Model model)
    {   	  
    	try{
    	/*ArrayList<String> questionPaperList = new ArrayList<>();
        questionPaperDao.findAll().forEach(questionPaper -> {
            questionPaperList.add(questionPaper.getQuestionpaperid().toString());
        });*/      
        List<QuestionPaperModel> questionPaperList=questionPaperDao.findAll();
    		
        List<parameterModel> parameterList=parameterDao.findAll();
        List<parameterModel> classnameList=(List<parameterModel>)parameterList.stream().filter(x->{return x.getPrm_type().equals("class");}).collect(Collectors.toList());
        List<parameterModel> sectionList=(List<parameterModel>)parameterList.stream().filter(x->{return x.getPrm_type().equals("section");}).collect(Collectors.toList());
        List<String> answerTypeList=new ArrayList<>();
        answerTypeList.add("multiple");
        answerTypeList.add("descriptive");       
        /*model.addAttribute("questionPaperList", questionPaperList);*/
        model.addAttribute("questionPaperList", questionPaperList);
        model.addAttribute("parameterList", parameterList);
        model.addAttribute("answerTypeList", answerTypeList);
        model.addAttribute("classnameList",classnameList);
        model.addAttribute("sectionList", sectionList);
        
    	if(viewController.validatePageAccess("/QuestionPaper"))
    	{
    		return "QuestionPaper";
    	}
    	else{
    		return "no_access";
    	}
    	}
    	catch(Exception e){
        	return e.toString();
        }
    
    } 
    
    @RequestMapping(value = "/generateQuestionPaper", method = RequestMethod.POST)
    public @ResponseBody  String generateQnPaper(@RequestParam(value = "questionPaperNumber1", required = false) String questionPaperNumber1,
    		@RequestParam(value = "classname1", required = false) String classname1, 
    		@RequestParam(value = "totalTimeAllowedForExam1", required = false) String totalTimeAllowedForExam1, 
    		@RequestParam(value = "noOfQuestionsForEvaluation1", required = false) String noOfQuestionsForEvaluation1,
    		@RequestParam(value = "maximumScore1", required = false) String maximumScore1,
    		@RequestParam(value = "passPercentage1", required = false) String passPercentage1,
    		@RequestParam(value = "TotalScore1", required = false) String TotalScore1,
    		@RequestParam(value = "section1", required = false) String section1,
    		@RequestParam(value = "answerTy1", required = false) String answerTy1,
    		@RequestParam(value = "scorePerQn1", required = false) String scorePerQn1,
    		@RequestParam(value = "easy1", required = false) String easy1,
    		@RequestParam(value = "average1", required = false) String average1,
    		@RequestParam(value = "difficult1", required = false) String difficult1,	            	  
    		@RequestParam(value = "section2", required = false) String section2,
    		@RequestParam(value = "answerTy2", required = false) String answerTy2,
    		@RequestParam(value = "scorePerQn2", required = false) String scorePerQn2,
    		@RequestParam(value = "easy2", required = false) String easy2,
    		@RequestParam(value = "average2", required = false) String average2,
    		@RequestParam(value = "difficult2", required = false) String difficult2,   		
    		@RequestParam(value = "section3", required = false) String section3,
    		@RequestParam(value = "answerTy3", required = false) String answerTy3,
    		@RequestParam(value = "scorePerQn3", required = false) String scorePerQn3,
    		@RequestParam(value = "easy3", required = false) String easy3,
    		@RequestParam(value = "average3", required = false) String average3,
    		@RequestParam(value = "difficult3", required = false) String difficult3, 		
    		@RequestParam(value = "section4", required = false) String section4,
    		@RequestParam(value = "answerTy4", required = false) String answerTy4,
    		@RequestParam(value = "scorePerQn4", required = false) String scorePerQn4,
    		@RequestParam(value = "easy4", required = false) String easy4,
    		@RequestParam(value = "average4", required = false) String average4,
    		@RequestParam(value = "difficult4", required = false) String difficult4   		
    		
    		) {
    	 	
    	
    	
    	SessionFactory sf=HibernateUtil.getSessionFactory();
        Session session =null;
        try{
        	
           session=sf.openSession();
           String val;
           if (!StringUtils.isEmpty(questionPaperNumber1)){
        	   //StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_generatePrevQn");
        	   StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_generatePrevQn");
//        	   StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("testtds.sp_generatePrevQn");
        	   procedureQuery.registerStoredProcedureParameter("prevQn", Integer.class, ParameterMode.IN);
        	   procedureQuery.registerStoredProcedureParameter("generatedQnId", String.class, ParameterMode.OUT);        	   
        	   procedureQuery.setParameter("prevQn",Integer.parseInt(questionPaperNumber1));
        	   procedureQuery.execute();
       	       val= (String)procedureQuery.getOutputParameterValue("generatedQnId");
             
           }else{
    	   //StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_generateQnPaper");
           StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("tds_prod.sp_generateQnPaper");
//           StoredProcedureQuery procedureQuery=session.createStoredProcedureQuery("testtds.sp_generateQnPaper");
    	   procedureQuery.registerStoredProcedureParameter("classname1", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("Total_time_allowed1", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("No_of_question_for_evaluation1", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("Maximum_score1", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("Pass_percentage1", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("Total_score1", int.class, ParameterMode.IN);
    	   
    	   procedureQuery.registerStoredProcedureParameter("Section1", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("answerTy1", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("ScorePerQn1", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("easy1", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("average1", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("difficult1", int.class, ParameterMode.IN);
    	   
    	   procedureQuery.registerStoredProcedureParameter("Section2", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("answerTy2", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("ScorePerQn2", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("easy2", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("average2", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("difficult2", int.class, ParameterMode.IN);
    	   
    	   procedureQuery.registerStoredProcedureParameter("Section3", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("answerTy3", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("ScorePerQn3", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("easy3", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("average3", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("difficult3", int.class, ParameterMode.IN);
    	   
    	   procedureQuery.registerStoredProcedureParameter("Section4", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("answerTy4", String.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("ScorePerQn4", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("easy4", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("average4", int.class, ParameterMode.IN);
    	   procedureQuery.registerStoredProcedureParameter("difficult4", int.class, ParameterMode.IN);    	   
    	   
    	   procedureQuery.registerStoredProcedureParameter("generatedQnId", String.class, ParameterMode.OUT);
    	   
    	   procedureQuery.setParameter("classname1", classname1);
    	   procedureQuery.setParameter("Total_time_allowed1", totalTimeAllowedForExam1);
    	   procedureQuery.setParameter("No_of_question_for_evaluation1",Integer.parseInt( noOfQuestionsForEvaluation1.equals("")?"0":noOfQuestionsForEvaluation1));
    	   procedureQuery.setParameter("Maximum_score1", Integer.parseInt(maximumScore1.equals("")?"0":maximumScore1));
    	   procedureQuery.setParameter("Pass_percentage1", Integer.parseInt(passPercentage1.equals("")?"0":passPercentage1));
    	   procedureQuery.setParameter("Total_score1",Integer.parseInt( TotalScore1.equals("")?"0":TotalScore1));
    	   
    	   procedureQuery.setParameter("Section1", section1);
    	   procedureQuery.setParameter("answerTy1", answerTy1);
    	   procedureQuery.setParameter("ScorePerQn1", Integer.parseInt(scorePerQn1.equals("")?"0":scorePerQn1));
    	   procedureQuery.setParameter("easy1", Integer.parseInt(easy1.equals("")?"0":easy1));
    	   procedureQuery.setParameter("average1", Integer.parseInt(average1.equals("")?"0":average1));
    	   procedureQuery.setParameter("difficult1", Integer.parseInt(difficult1.equals("")?"0":difficult1));
    	   
    	   procedureQuery.setParameter("Section2", section2);
    	   procedureQuery.setParameter("answerTy2", answerTy2);
    	   procedureQuery.setParameter("ScorePerQn2", Integer.parseInt(scorePerQn2.equals("")?"0":scorePerQn2));
    	   procedureQuery.setParameter("easy2", Integer.parseInt(easy2.equals("")?"0":easy2));
    	   procedureQuery.setParameter("average2", Integer.parseInt(average2.equals("")?"0":average2));
    	   procedureQuery.setParameter("difficult2",Integer.parseInt( difficult2.equals("")?"0":difficult2));
    	   
    	   procedureQuery.setParameter("Section3", section3);
    	   procedureQuery.setParameter("answerTy3", answerTy3);
    	   procedureQuery.setParameter("ScorePerQn3",Integer.parseInt( scorePerQn3.equals("")?"0":scorePerQn3));
    	   procedureQuery.setParameter("easy3", Integer.parseInt(easy3.equals("")?"0":easy3));
    	   procedureQuery.setParameter("average3",Integer.parseInt( average3.equals("")?"0":average3));
    	   procedureQuery.setParameter("difficult3", Integer.parseInt(difficult3.equals("")?"0":difficult3));
    	   
    	   procedureQuery.setParameter("Section4", section4);
    	   procedureQuery.setParameter("answerTy4", answerTy4);
    	   procedureQuery.setParameter("ScorePerQn4",Integer.parseInt( scorePerQn4.equals("")?"0":scorePerQn4));
    	   procedureQuery.setParameter("easy4",Integer.parseInt( easy4.equals("")?"0":easy4));
    	   procedureQuery.setParameter("average4", Integer.parseInt(average4.equals("")?"0":average4));
    	   procedureQuery.setParameter("difficult4",Integer.parseInt( difficult4.equals("")?"0":difficult4));
    	   
    	   procedureQuery.execute();
    	    val= (String)procedureQuery.getOutputParameterValue("generatedQnId");
           }
    	  
   	    return val.toString();
        }
        catch(Exception e){
        	return e.toString();
        }
        finally{
        	if(session!=null){
        		session.close();
        	}
        }   
    	
    }  
   
          /*Generate Question paper ends here*/
    

    @RequestMapping(value = "/questions", method = RequestMethod.POST)
    public @ResponseBody
    String uploadQuestions(@RequestParam(value = "questionPaperNumber", required = false) String questionPaperNumber,
                           @RequestParam(value = "editQuestion", required = false) String editQuestion,
                           @RequestParam(value = "editQuestionId", required = false) String editQuestionId,
                           UploadQuestionsModel uploadQuestionsModel,Model model) {

        QuestionsModel questionsModel = new QuestionsModel();
        QuestionsModelBuilder questionsModelBuilder = new QuestionsModelBuilder();

        QuestionsModel oldQuestionsModel = null;

        if (!StringUtils.isEmpty(editQuestion) && editQuestion.equals("true")){
            uploadQuestionsModel.setEditQuestion(true);
            uploadQuestionsModel.setQuestionPaperNumber(questionPaperNumber);

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
                questionHeaderDao.save(questionsModelBuilder.buildQuestionHeaderDao(uploadQuestionsModel));
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if (uploadQuestionsModel.isEditQuestion()){
                QuestionsModel editQuestionModel = questionsModelBuilder.buildQuestionsDao(uploadQuestionsModel);
                if (editQuestionModel != null){

                    editQuestionModel.setQuestionId(Long.valueOf(editQuestionId));
                    questionsDao.save(editQuestionModel);
                }
            }
            else {
                questionsDao.save(questionsModelBuilder.buildQuestionsDao(uploadQuestionsModel));
                
            }
                List<QuestionsModel> questionsList = null;
                questionsList=questionsDao.findByQuestionPaperNumber(questionPaperNumber);
              //  HashMap<String, Object> responseMap = new HashMap<>();
                model.addAttribute("questionsList", questionsList);
               // responseMap.put("questionsList", questionsList);
        }

        
        return "success";
    }

    @RequestMapping(value = "/announceExam", method = RequestMethod.POST)
    public @ResponseBody String announceExam(@RequestParam(value = "updateId", required = false) String updateId, ExamModel examModel,Model model) {

        String examId = null;  
		
        try{
        	ExamIdModel examidModel=new ExamIdModel();
    		examIdDao.save(examidModel);
    		QuestionPaperModel Questnpaper=QuestionPaperDao.getOne(Long.valueOf(examModel.getQuestionPaperNumber()));    	
    		examId= Questnpaper.getclassname()+"-"+examidModel.getId().toString();           

        	 if(!StringUtils.isEmpty(updateId)){

        		 ExamModel updateExamModel = examDao.getOne(Long.valueOf(updateId));
                 updateExamModel.setId(Long.valueOf(updateId));
                 updateExamModel.setExamId(examModel.getExamId());
                 updateExamModel.setAccessibleTimeFrom(examModel.getAccessibleTimeFrom());
                 updateExamModel.setAccessibletimeTo(examModel.getAccessibletimeTo());
                 //updateExamModel.setCategory(examModel.getCategory());
                 updateExamModel.setExamDate(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(examModel.getExamDate())));
                 updateExamModel.setExamName(examModel.getExamName());
                 updateExamModel.setExamTime(examModel.getExamTime());
                // updateExamModel.setExamSheduleDate(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(examModel.getExamDate())));
                 updateExamModel.setFinalExamDate(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(examModel.getFinalExamDate())));
                 updateExamModel.setOtherDetails(examModel.getOtherDetails());
                 updateExamModel.setQuestionPaperNumber(examModel.getQuestionPaperNumber());
                 updateExamModel.setWhoCanRegister(examModel.getWhoCanRegister());
                 
                 updateExamModel.setAdditionalInstructions1(examModel.getAdditionalInstructions1());
                 updateExamModel.setAdditionalInstructions2(examModel.getAdditionalInstructions2());
                 updateExamModel.setAdditionalInstructions3(examModel.getAdditionalInstructions3());
                 updateExamModel.setAdditionalInstructions4(examModel.getAdditionalInstructions4());
                 updateExamModel.setAdditionalInstructions5(examModel.getAdditionalInstructions5());
                 updateExamModel.setAdditionalInstructions6(examModel.getAdditionalInstructions6());
                 updateExamModel.setAdditionalInstructions7(examModel.getAdditionalInstructions7());
                 updateExamModel.setAdditionalInstructions8(examModel.getAdditionalInstructions8());
                 updateExamModel.setAdditionalInstructions9(examModel.getAdditionalInstructions9());
                 examDao.save(updateExamModel);
                
            }
            else{
                /*SecureRandom randomGenerator = new SecureRandom();
                examId = String.valueOf(randomGenerator.nextInt(99999));
                examId = examModel.getExamName().toUpperCase() + examId;*/

                //examModel.setExamId(examId);
            	examModel.setExamId(examId);
                examDao.save(examModel);
                //return "sucess";
            }
        	  
        	 return "sucess_"+examId;
            //return examModel.getExamId();
        }
        catch (Exception e){
            return "failed";
        }
       
    }

    @RequestMapping(value = "/registerApplicant", method = RequestMethod.POST)
    public @ResponseBody String registerApplicant(ApplicantRegisterModel applicantRegisterModel) {

        try{

            SecureRandom randomGenerator = new SecureRandom();
            applicantRegisterModel.setApplicantPassword(String.valueOf(randomGenerator.nextInt(9999999)));

            applicantRegisterModel.setCurrentdate((new Date()).toString());
            applicantRegisterDao.save(applicantRegisterModel);
            return "success";
        }
        catch (Exception e){
            return "failed";
        }

    }
    
    @RequestMapping(value = "/registereditApplicant", method = RequestMethod.POST)
    public @ResponseBody String registereditApplicant(ApplicantRegisterModel applicantRegisterModel) {

        try{
        	applicantRegisterModel.setApplicantPassword( applicantRegisterDao.findById(applicantRegisterModel.getId()).getApplicantPassword() );
        	applicantRegisterModel.setApprovalStatus(applicantRegisterDao.findById(applicantRegisterModel.getId()).getApprovalStatus());
        	applicantRegisterDao.save(applicantRegisterModel);
            //start- update applicant name in result table
        	List<ResultModel> result=resultdao.findByApplicantId(applicantRegisterModel.getId());
        	for(ResultModel r:result){
        		r.setApplicantName(applicantRegisterModel.getCandidateName());
        		resultdao.save(r);
        	}
        	//end-		
        	return applicantRegisterModel.getExamId();
        }
        catch (Exception e){
            return "failed";
        }

    }
    
    @RequestMapping(value = "/addnewuser", method = RequestMethod.POST)
    public @ResponseBody String addnewuser (@RequestParam(value = "userId", required = false) Long userId,@RequestParam(value = "ScreenId", required = false) String[] ScreenId,AdduserModel addnewModel,ScreenAccessModel ScrenAcess ,Model model) {
    	 String k="";
    	 List<ScreenModel> screenList = screenDao.findAll();
    	
    
	   	 model.addAttribute("screenList", screenList); 
	   
	     //List<ScreenAccessModel> screenAccessDetails = screenAccessDao.findAllByUserId(Integer.parseInt(userId.toString()));
	   
	   //screenacessListModel.setScreenId(ScrenAcess.getScreenId()); 
	   //screenAccessDao.save(ScrenAcess);
	   	 
        try{
        	  if(!StringUtils.isEmpty(userId)){
        	AdduserModel updateaddModel = addnewuserDao.getOne(Long.valueOf(userId));
        	updateaddModel.setId(Long.valueOf(userId));
        	
        	updateaddModel.setName(addnewModel.getName());
        	updateaddModel.setUsername(addnewModel.getUsername());
        	 updateaddModel.setPassword(addnewModel.getPassword());
        	updateaddModel.setJobtitle(addnewModel.getJobtitle());
        	updateaddModel.setDepartment(addnewModel.getDepartment());
        	updateaddModel.setEmployeid(addnewModel.getEmployeid());
        	updateaddModel.setEmailid(addnewModel.getEmailid());
        	
        	 addnewuserDao.save(updateaddModel);
        	
        	//
        	 
        	 
        	 
        	
        	 return String.valueOf(addnewModel.getName());
        		
        	  }
         
        	 else{
                  
        		
               if(ScreenId!=null) {
              addnewuserDao.save(addnewModel);
        		 
        		  
        		 // System.out.println(addnewModel.getId());
        		  long l=addnewModel.getId();
        		  int i=(int)l;
        		  
        		  ArrayList<Integer> arr = new ArrayList<Integer>();
    			  screenList.forEach(screen -> {
    		            arr.add(screen.getId());
    		            
    		        });
    			 
    			 
    			  

    			  
    			 
    			  ArrayList<Integer> arr2 = new ArrayList<Integer>();
        		 
        		  for(String str:ScreenId) {
        			  
                    int sid = Integer.parseInt(str);	
        			ScreenAccessModel ScrenAcesslist = new ScreenAccessModel();
                    
        			  ScrenAcesslist.setScreenId(sid);
        			
        		       
                        arr2.add( ScrenAcesslist.getScreenId());
        		
        	       }
        		 // System.out.println(arr);
        		  //System.out.println(arr2);
        		      
        		  for(int j= 0; j< arr.size(); j++){
                      if(arr2.contains(arr.get(j))){
                         // System.out.println("exit:"+arr.get(j));
                           
                         ScreenAccessModel Scracsslist = new ScreenAccessModel();
          	    		 Scracsslist.setScreenId(arr.get(j));
          	    		 Scracsslist.setUserId(i);
          	    		 Scracsslist.setScreenAccess("yes");
          	    		 screenAccessDao.save( Scracsslist);
                           
                           
                      }
                           else{
                              // System.out.println("No:"+arr.get(j));
                               ScreenAccessModel Scralist = new ScreenAccessModel();
              	    		 Scralist.setScreenId(arr.get(j));
              	    		 Scralist.setUserId(i);
              	    		 Scralist.setScreenAccess("no");
              	    		 screenAccessDao.save( Scralist); 
                           }}
        		  
               }
               else {
            	  
            	   addnewuserDao.save(addnewModel);
          		 
         		  
          		 // System.out.println(addnewModel.getId());
          		  long l=addnewModel.getId();
          		  int i=(int)l;
          		  
          		  ArrayList<Integer> arr = new ArrayList<Integer>();
      			  screenList.forEach(screen -> {
      		            arr.add(screen.getId());
      		            
      		        });
      			 for(int h=0;h<arr.size();h++) {
      				  ScreenAccessModel Scracsslist = new ScreenAccessModel();
     	    		 Scracsslist.setScreenId(arr.get(h));
     	    		 Scracsslist.setUserId(i);
     	    		 Scracsslist.setScreenAccess("no");
     	    		 screenAccessDao.save( Scracsslist); 
      			 }
      			  
      			 
               }
        	    	 
        	    	  
        	    		   
        	    	  
        	    	  
        	     
        	            
        		
        		 return "sucess";
        		 
             } 
        	  
        }
        
   	 
        catch (Exception e){
            return "failed";
        }
        
    	
    }

    @RequestMapping(value = "/uploadQuestions", method = RequestMethod.GET)
    public String uploadQuestions(Model model){
        ArrayList<String> questionPaperList = new ArrayList<>();
        questionHeaderDao.findAll().forEach(questionPaper -> {

            questionPaperList.add(questionPaper.getQuestionPaperNumber());
        });
        List<ExamResultModel> quespaperList = null;
        List<String> ResultPaperNumberList = new ArrayList<>();
        quespaperList=examResultDao.findAll();
        quespaperList.forEach(ResultPaper -> {
        	ResultPaperNumberList.add(ResultPaper.getQuestionPaperNumber());
        });
       
        questionPaperList.removeAll(ResultPaperNumberList);
         
        model.addAttribute("questionPaperList", questionPaperList);
        
        
        

        if(viewController.validatePageAccess("/uploadQuestions"))
        {
//            return "uploadques";
            return "uploadques_new";
        }
        else {
            return "no_access";
        }

    }

    @RequestMapping(value = "/viewExam", method = RequestMethod.GET)
    public String viewexam(Model model){

        List<ExamModel> examList = examDao.findAll();

        //examList.sort((exam1, exam2) -> exam1.getExamDate().compareTo(exam2.getExamDate()));
        Collections.reverse(examList); 
        
        List<ExamModel> ExamidList = null;
        List<String> ExamNumberList = new ArrayList<>();
        ExamidList = examDao.findAll();
       ExamidList.forEach(questionPaper -> {
        	ExamNumberList.add(questionPaper.getExamId());
		});
        model.addAttribute("examList", examList);
        model.addAttribute("ExamNumberList", ExamNumberList);
        
        if(viewController.validatePageAccess("/viewExam"))
	        {
	    		
        	return "viewexam";
	        }
	        else {
	            return "no_access";
	        }
        
        
    }

    @RequestMapping(value = "/examsingleview", method = RequestMethod.GET)
    public String examsingleview(@RequestParam(value = "examid", required = false) String examId,Model model){

    	ExamModel examList=null;
        
     if(examId!=null) {
    	 examList=examDao.findByExamId(examId);
        
       
     }
     List<ExamModel> ExamidList = null;
     List<String> ExamNumberList = new ArrayList<>();
     ExamidList = examDao.findAll();
    ExamidList.forEach(questionPaper -> {
     	ExamNumberList.add(questionPaper.getExamId());
		});
    model.addAttribute("ExamNumberList", ExamNumberList);
     model.addAttribute("examList", examList);
        return "examsingleview";
        
    }
   
    @RequestMapping(value = "/singleexamedit", method = RequestMethod.GET)
    public String examsingleedit(@RequestParam(value = "examid", required = false) String examId,Model model){

    	ExamModel examList=null;
        
     if(examId!=null) {
    	 examList=examDao.findByExamId(examId);
        
       
     }
     List<ExamModel> ExamidList = null;
     List<String> ExamNumberList = new ArrayList<>();
     ExamidList = examDao.findAll();
    ExamidList.forEach(questionPaper -> {
     	ExamNumberList.add(questionPaper.getExamId());
		});
    model.addAttribute("ExamNumberList", ExamNumberList);
     model.addAttribute("examList", examList);
        return "singleexamedit";
        
    }
    
    
    
    
    
    
    
    @RequestMapping(value = "/Examsview", method = RequestMethod.GET)
    public String examsview(@RequestParam(value = "examid", required = false) String examId,Model model){

    	List<ExamModel> examList=null;
        
      
        	examList = examDao.findAll();	
      
        

        //examList.sort((exam1, exam2) -> exam1.getExamDate().compareTo(exam2.getExamDate()));
        Collections.reverse(examList);  
        List<ExamModel> ExamidList = null;
        List<String> ExamNumberList = new ArrayList<>();
        ExamidList = examDao.findAll();
       ExamidList.forEach(questionPaper -> {
        	ExamNumberList.add(questionPaper.getExamId());
		});
        
       
        model.addAttribute("examList", examList);
        model.addAttribute("ExamNumberList", ExamNumberList);
        
        
        if(viewController.validatePageAccess("/Examsview"))
	        {
	    		
        	return "Examsview";
	        }
	        else {
	            return "no_access";
	        }
        
        
    }
    
    
    
    
    @RequestMapping(value = "/viewuser", method = RequestMethod.GET)
    public String viewnewuser(@RequestParam(value = "userId", required = false) Long userId,AdduserModel addnewModel,Model model){
    	
    	try {
    		 if(!StringUtils.isEmpty(userId)){
    			 
    			 AdduserModel updateaddModel = addnewuserDao.findByid(userId);
    	        	
    	       
    	        
    	        if(updateaddModel.getStatus().equalsIgnoreCase("Inactive")) {
    	        	
    	        	updateaddModel.setStatus("Active");
    	        	
    	        	 addnewuserDao.save(updateaddModel);	
    	        }
    	        else {
    	        	updateaddModel.setStatus("Inactive");
    	        	 addnewuserDao.save(updateaddModel);	
    	        }
    	        
    	       
    		 }
    		
    			 
 	        
 	    	if(viewController.validatePageAccess("/viewuser"))
 	        {
 	    		List<AdduserModel> userList = addnewuserDao.findAll();
       	   	 model.addAttribute("userList", userList);
	    	  
	    	 return "viewuser";
 	        }
 	        else {
 	            return "no_access";
 	        }
    		 
    	      
    	       
    	}
    	
    	
    	 catch (Exception e){
             return "failed";
         }

    }
   
    @RequestMapping(value = "/Questionsview", method = RequestMethod.GET)
    public String Questionsview(@RequestParam(value = "questionPaperNumber", required = false) String questionPaperNumber,
            Model model){
					            
	int scoretotal=0;
	 
    	int qucount=0;
					List<QuestionsModel> questionsList = null;
					List<QuestionsModel> questionsListcount = null;
					QuestionHeaderModel questionHeaderModel = null;
					List<String> questionPaperNumberList = new ArrayList<>();
					List<QuestionHeaderModel> questionPaperList = null;
					 ArrayList<Integer> scorearray = new ArrayList<Integer>();
					
					questionPaperList = questionHeaderDao.findAll();
					questionPaperList.forEach(questionPaper -> {
					questionPaperNumberList.add(questionPaper.getQuestionPaperNumber());
					});
					
					try{
					if(questionPaperNumber != null){
					//questionsDao.delete(Long.valueOf(questionId));
					}
					
					}
					catch (Exception e){
					e.printStackTrace();
					}
					finally {
					if(questionPaperNumber != null){
					questionsList = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
					//System.out.println(questionsList.size());
					qucount=questionsList.size();
					questionHeaderModel = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);
					 	
					
					questionsList.forEach(questionscore -> {
						scorearray.add(questionscore.getScore());
						
						});
					
					for(int i=0;i<scorearray.size();i++) {
						scoretotal+=scorearray.get(i);	
					}
					
					//System.out.println(scoretotal);
					
					}
					/* else{
					questionsList = questionsDao.findAll();
					}*/
					}
					
					model.addAttribute("scoretotal", scoretotal);
					model.addAttribute("questionHeader", questionHeaderModel);
					model.addAttribute("questionsList", questionsList);
				    model.addAttribute("questionsListcount", qucount);
					model.addAttribute("questionPaperNumber", questionPaperNumber);
					model.addAttribute("questionPaperNumberList", questionPaperNumberList);
					
					
					
					if(viewController.validatePageAccess("/Questionsview"))
					{
					return "Questionsview";
					}
					else {
					
					return "no_access";
					}
					
					}

    
    
    
    @RequestMapping(value = "/editExam", method = RequestMethod.GET)
    public String editExam(@RequestParam(value = "examId") String examId, Model model){

        ExamModel examDetails = examDao.findByExamId(examId);
        model.addAttribute("examDetails", examDetails);
        String editEx="false";
        if((finalResultsDao.findByExamId(examId)).size()>0 || (resultDao.findByExamId(examId)).size()>0){
        	editEx="true";
        }
        model.addAttribute("editEx", editEx);
        return "editExam";
    }
   
    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public String editUser(@RequestParam(value = "userid") Long userid, Model model){

        AdduserModel userDetails = addnewuserDao.findByid(userid);
        List<ScreenAccessModel> screenAccessDetails = screenAccessDao.findAllByUserId(Integer.parseInt(userid.toString()));
        List<ScreenModel> screenList = screenDao.findAll();
        Map<ScreenModel, String> screenAccessMap = new LinkedHashMap<>();

        screenList.forEach(screen -> {
            screenAccessDetails.forEach(screenDetail -> {
                if(screen.getId() == screenDetail.getScreenId()){
                    screenAccessMap.put(screen, screenDetail.getScreenAccess());
                }
            });
        });

        model.addAttribute("screenList", screenList);
        model.addAttribute("userId", userid);
        model.addAttribute("userDetails", userDetails);
        model.addAttribute("screenAccessMap", screenAccessMap);
        return "editUser";
    }

    @RequestMapping(value = "/viewQuestions", method = RequestMethod.GET)
    public String viewquestions(@RequestParam(value = "questionPaperNumber", required = false) String questionPaperNumber, Model model){

        List<QuestionsModel> questionsList = null;
        List<String> questionPaperNumberList = new ArrayList<>();
        List<QuestionHeaderModel> questionPaperList = null;

        questionPaperList = questionHeaderDao.findAll();
        questionPaperList.forEach(questionPaper -> {
            questionPaperNumberList.add(questionPaper.getQuestionPaperNumber());
        });

        if(questionPaperNumber != null){
            questionsList = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
            final int[] totalTimeOfQuestions = new int[1];
            final int[] totalScoreOfQuestions = new int[1];
            if(!CollectionUtils.isEmpty(questionsList)){
                questionsList.forEach(question -> {

                    totalTimeOfQuestions[0] = totalTimeOfQuestions[0] + Integer.parseInt( question.getAllottedTime());
                    totalScoreOfQuestions[0] = totalScoreOfQuestions[0] + question.getScore();
                });

                QuestionHeaderModel questionHeaderModel = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);

                model.addAttribute("questionHeader", questionHeaderModel);
                model.addAttribute("questionsList", questionsList);
            }

            model.addAttribute("totalTimeOfQuestions", totalTimeOfQuestions[0]);
            model.addAttribute("totalScoreOfQuestions", totalScoreOfQuestions[0]);
        }
        else{
          //  questionsList = questionsDao.findAll();

        }

        model.addAttribute("questionPaperNumberList", questionPaperNumberList);

        model.addAttribute("questionPaperNumber", questionPaperNumber);

        return "viewquestions";
    }
    
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpSession session) {
    	 
    	 
    	session.invalidate();
    	 
        return "redirect:/";//You can redirect wherever you want, but generally it's a good practice to show login screen again.
    }
    
    @RequestMapping(value="/Changepass", method = RequestMethod.GET)
    public String Changepass (@RequestParam(value = "userId", required = false) Long userId,@RequestParam(value = "Password", required = false) String Password,AdduserModel addnewModel) {
    	 
    	 try {
    		 
         if(!StringUtils.isEmpty(userId)){
    			 
    			 AdduserModel updateaddModel = addnewuserDao.findByid(userId);
    			 //System.out.println(updateaddModel.getUsername());
    			 //System.out.println(addnewModel.getPassword());
    			 
    			 updateaddModel.setPassword(addnewModel.getPassword());
 	        	
	        	 addnewuserDao.save(updateaddModel);
	        	 
	        	 
    	 }
         
         
    	 }
    	 catch (Exception e){
             return "failed";
         }
    	 
    	
    	 
    	 
    	 if(viewController.validatePageAccess("/Changepass"))
	        {
	    		
 	  
    		 return "Changepass";
	        }
	        else {
	            return "no_access";
	        }
    }
    
    @RequestMapping(value="/Reset", method = RequestMethod.GET)
    public String Resetpass (@RequestParam(value = "username", required = false) String username,@RequestParam(value = "Password", required = false) String Password,AdduserModel addnewModel,Model model) {
    	 
    	 
    	List<AdduserModel> userList = addnewuserDao.findAll();
  	   	 model.addAttribute("userList", userList);
    	
    	try {
    		 
         if(!StringUtils.isEmpty(username)){
    			 
    			 AdduserModel updateaddModel = addnewuserDao.findByUsername(username);
    			 //System.out.println(updateaddModel.getUsername());
    			 //System.out.println(addnewModel.getPassword());
    			 
    			 updateaddModel.setPassword(addnewModel.getPassword());
 	        	
	        	 addnewuserDao.save(updateaddModel);
	        	 
	        	 
    	 }
         
         
    	 }
    	 catch (Exception e){
             return "failed";
         }
    	 
    	if(viewController.validatePageAccess("/Reset"))
        {
    		
	  
    		 return "Reset";
        }
        else {
            return "no_access";
        }
    	
    }

    @RequestMapping(value = "/questionPaperDuplicateCheck", method = RequestMethod.POST)
    public @ResponseBody
    ResponseEntity<HashMap<String, Object>> questionPaperDuplicateCheck(String questionPaperNumber){

    List<QuestionsModel> questionsList = null;
    QuestionHeaderModel questionHeader = null;
    
    
    List<ExamResultModel> quespaperList = null;
    List<String> ResultPaperNumberList = new ArrayList<>();
    quespaperList=examResultDao.findAll();
    quespaperList.forEach(ResultPaper -> {
    	ResultPaperNumberList.add(ResultPaper.getQuestionPaperNumber());
    });
    
    
   /* if(questionPaperNumber != null){
        
           questionsList = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
           questionHeader = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);
           }*/
    boolean isExist = false;
    for(int i=0;i<ResultPaperNumberList.size();i++) {
		 if (questionPaperNumber.equals(ResultPaperNumberList.get(i))) {
    	     
    		 isExist = true; 
    		 break;
    	   }
    	
	}
    if( isExist!=true) {
    	questionsList = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
        questionHeader = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);
    }
    else {
    	//System.out.println("not possible");
    	
    }

        
        HashMap<String, Object> responseMap = new HashMap<>();

        responseMap.put("questionsList", questionsList);
        responseMap.put("questionHeader", questionHeader);
        return ResponseEntity.ok(responseMap);
       
    }

    @RequestMapping(value = "/editQuestions", method = RequestMethod.GET)
    public String editQuestions(@RequestParam(value = "questionId", required = false) String questionId,
                                @RequestParam(value = "questionPaperNumber", required = false) String questionPaperNumber,
                                Model model){
     int quncount=0;
     int scoretotal=0;
        List<QuestionsModel> questionsList = null;
        List<QuestionsModel> questionsListcount = null;
        QuestionHeaderModel questionHeaderModel = null;
        List<String> questionPaperNumberList = new ArrayList<>();
        List<QuestionHeaderModel> questionPaperList = null;
        List<ExamResultModel> quespaperList = null;
        List<String> ResultPaperNumberList = new ArrayList<>();
        ArrayList<Integer> scorearray = new ArrayList<Integer>();
        quespaperList=examResultDao.findAll();
        quespaperList.forEach(ResultPaper -> {
        	ResultPaperNumberList.add(ResultPaper.getQuestionPaperNumber());
        });

        questionPaperList = questionHeaderDao.findAll();
        questionPaperList.forEach(questionPaper -> {
            questionPaperNumberList.add(questionPaper.getQuestionPaperNumber());
        });
        questionPaperNumberList.removeAll(ResultPaperNumberList);
       // System.out.println(questionPaperNumberList);
        
        try{
            if(questionId != null){
                questionsDao.delete(Long.valueOf(questionId));
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if(questionPaperNumber != null){
                questionsList = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
                quncount=questionsList.size();
                questionHeaderModel = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);

					    questionsList.forEach(questionscore -> {
						scorearray.add(questionscore.getScore());
						
						});
					
					for(int i=0;i<scorearray.size();i++) {
						scoretotal+=scorearray.get(i);	
					}

            }
           /* else{
                questionsList = questionsDao.findAll();
            }*/
        }
        model.addAttribute("scoretotal", scoretotal);
        model.addAttribute("questionHeader", questionHeaderModel);
        model.addAttribute("questionsList", questionsList);
        model.addAttribute("questionsListcount", quncount);
        model.addAttribute("questionPaperNumber", questionPaperNumber);
        model.addAttribute("questionPaperNumberList", questionPaperNumberList);
        model.addAttribute("ResultPaperNumberList", ResultPaperNumberList);
    	 if(viewController.validatePageAccess("/editQuestions"))
	        {
     	return "editQuestions";	
	        }
	        else {
	            return "no_access";
	        }

       
        
        
    }
    
    @RequestMapping(value = "/deleteuser", method = RequestMethod.GET)
    public String deleteuser(@RequestParam(value = "userId")int userId, Model model,ScreenAccessModel screenAccess){

    	 try{
    		
    		 if(!StringUtils.isEmpty(userId)){
    			//
     List<ScreenAccessModel> screenAccessDetails = screenAccessDao.findAllByUserId(userId);
    			 
    			 
     
     
     
     
   
         screenAccessDetails.forEach(screenDetail -> {
             //System.out.println(screenDetail.getId());
           screenAccessDao.delete(Long.valueOf(screenDetail.getId()));
          // 
           
         });
         addnewuserDao.delete(Long.valueOf(userId));
     
             }

    		
    	 }
         catch (Exception e){
             e.printStackTrace();
         }
       

        return "deleteuser";
    }

    @RequestMapping(value = "/examRegister", method = RequestMethod.GET)
    public String examRegister(@RequestParam(value = "examId") String examId, Model model){


        ExamModel examModel = examDao.findByExamId(examId);
        model.addAttribute("examName", examModel.getExamName());
        model.addAttribute("examId", examModel.getExamId());
        List<ApplicantRegisterModel> applicantRegisterModel = null;
        applicantRegisterModel = applicantRegisterDao.findByExamId(examId);
        model.addAttribute("applicantList", applicantRegisterModel);
      
        return "applicant_register";
    }
    
    @RequestMapping(value = "/applicantedit", method = RequestMethod.GET)
    public String applicantedit(@RequestParam(value = "applicantId") String applicantId, Model model){

    	ApplicantRegisterModel applicantRegisterModel = null;
        applicantRegisterModel = applicantRegisterDao.findById(Long.valueOf(applicantId));
        ExamModel examModel = examDao.findByExamId(applicantRegisterModel.getExamId());
        model.addAttribute("examName", examModel.getExamName());
        model.addAttribute("examId", examModel.getExamId());
        model.addAttribute("applicant", applicantRegisterModel);
        
        String str = applicantRegisterModel.getServiceDuration(); 
        String[] arrOfStr = str.split(" ");  
        String years="",months="";
        if(str!="" && arrOfStr.length>1){
        years=arrOfStr[0].substring(0, arrOfStr[0].length()-5);
        months=arrOfStr[2].substring(0, arrOfStr[2].length()-6);
        }
        //for (String a : arrOfStr)
            //System.out.println(a);
        model.addAttribute("years", years);
        model.addAttribute("months", months);       
        
        /*ExamModel examModel = examDao.findByExamId(examId);
        model.addAttribute("examName", examModel.getExamName());
        model.addAttribute("examId", examModel.getExamId());
        List<ApplicantRegisterModel> applicantRegisterModel = null;
        applicantRegisterModel = applicantRegisterDao.findByExamId(examId);
        model.addAttribute("applicantList", applicantRegisterModel);*/
      
        //return "applicant_edit";
        if(viewController.validatePageAccess("/EvaluationRpt"))            
   	    {
		
   	    	return "applicant_edit";
		
   	    }
   	    else {
		 return "no_access";
   	    }
       
    }

    @RequestMapping(value = "/registrationDetails", method = RequestMethod.GET)
    public String viewRegistrationDetails(@RequestParam(value = "examId") String examId, Model model){

        ExamModel examModel = examDao.findByExamId(examId);

       /* QuestionHeaderModel questionHeaderModel = questionHeaderDao.findByQuestionPaperNumber(examModel.getQuestionPaperNumber());
        if (questionHeaderModel != null && questionHeaderModel.getTotalTimeAllowedForExam() != null){
            model.addAttribute("totalTimeOfExam", questionHeaderModel.getTotalTimeAllowedForExam());
            model.addAttribute("examDetails", examModel);
            return "display_reg_details";
        }
        else {
            return "display_reg_details";
        }*/
        QuestionPaperModel questionHeaderModel=QuestionPaperDao.findByQuestionpaperid(Long.valueOf(examModel.getQuestionPaperNumber()));
        if (questionHeaderModel != null && questionHeaderModel.getTotal_time_allowed() != null){
            model.addAttribute("totalTimeOfExam", questionHeaderModel.getTotal_time_allowed());
            model.addAttribute("examDetails", examModel);
            //
            String reglink="enable";
            try {
				Date regdt=new SimpleDateFormat("yyyy-MM-dd").parse(examModel.getFinalExamDate());
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date today = new Date();
				Date todaydt = formatter.parse(formatter.format(today));
				if (todaydt.compareTo(regdt)>0){
					reglink="disable";
				}
				
            } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
            model.addAttribute("reglink", reglink);
            //
            return "display_reg_details";
        }
        
        else {
            return "display_reg_details";
        }
        


    }

    @RequestMapping(value = "/viewApplicants", method = RequestMethod.GET)
    public String viewApplicants(@RequestParam(value = "examId", required = false) String examId, Model model){

        List<ExamModel> examList;
        List<ApplicantRegisterModel> applicantRegisterModel = null;

        examList = examDao.findAll();

        if(examId != null){
            applicantRegisterModel = applicantRegisterDao.findByExamId(examId);
            ExamModel examModel = examDao.findByExamId(examId);
            model.addAttribute("examName", examModel.getExamName());
          
            model.addAttribute("examDate", examModel.getExamDate());
        }

        model.addAttribute("examList", examList);
        model.addAttribute("applicantList", applicantRegisterModel);
        
        
        
        if(viewController.validatePageAccess("/viewApplicants"))
	        {
        	return "viewApplicants";	
	        }
	        else {
	            return "no_access";
	        }

        
    }

    @RequestMapping(value = "/approveApplicants", method = RequestMethod.POST)
    public @ResponseBody String approveApplicants(@RequestBody ApplicantManagerPOJO[] applicantsList){

        int i = 0;
        if(applicantsList != null){
            while(i < applicantsList.length){
                applicantRegisterDao.setStatusForApplicant(applicantsList[i].getStatus(), applicantsList[i].getApplicantId());
                i++;
            }
        }


        return "success";
    }

    @RequestMapping(value = "/applicantLogin", method = RequestMethod.GET)
    public String applicantLogin(){

        return "applicantLogin";
    }

    @RequestMapping(value = "/validateApplicantDetails", method = RequestMethod.POST)
    public @ResponseBody String validateApplicantDetails(ApplicantRegisterModel applicantRegisterModel){

        try
        {
            ApplicantRegisterModel applicantDetails = applicantRegisterDao.validateApplicantDetails(applicantRegisterModel.getEmailId(), applicantRegisterModel.getExamId());

            if (applicantDetails.getApplicantPassword().equals(applicantRegisterModel.getApplicantPassword()) &&
                    applicantDetails.getExamId().equals(applicantRegisterModel.getExamId()) && applicantDetails.getApprovalStatus().equalsIgnoreCase("Approove")){

                if (applicantDetails.getExamAttended().equalsIgnoreCase("false")){
                    httpSession.setAttribute("applicantId", applicantDetails.getId());
                    httpSession.setAttribute("emailId", applicantRegisterModel.getEmailId());
                    httpSession.setAttribute("applicantName", applicantDetails.getCandidateName());
                    httpSession.setAttribute("examId", applicantRegisterModel.getEmailId());

                    return applicantDetails.getExamId();
                }
                else {
                    return "examAttended";
                }

            }
            else{
                return "failed";
            }
        }
        catch (Exception e){
            return "failed";
        }
    }
    
    
    
    @RequestMapping(value = "/examDetails", method = RequestMethod.GET)
    public String viewExamDetails(@RequestParam(value = "examId") String examId, Model model){

        ExamModel examModel = examDao.findByExamId(examId);       
        QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(Long.parseLong(examModel.getQuestionPaperNumber()));
        
        if (httpSession.getAttribute("applicantId") != null){
            model.addAttribute("applicantDetails", applicantRegisterDao.findOne((Long) httpSession.getAttribute("applicantId")));
            model.addAttribute("examDuration",questionpapermodel.getTotal_time_allowed());
            model.addAttribute("examDetails", examModel);
            return "examDetails";
        }
        else{
            return "applicantLogin";
        }

    }

     @RequestMapping(value = "/startExam", method = RequestMethod.GET)
     public String startExam(@RequestParam(value = "examId") String examId, Model model){

         if (httpSession.getAttribute("applicantId") != null){
             ExamModel examModel = examDao.findByExamId(examId);
             model.addAttribute("examDetails", examModel);

             Date dateInDB = null;
             Date dbdate=null;
             Date currentDate = new Date();
             DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
             Date date = new Date();
             try {
                 dateInDB = new SimpleDateFormat("yyyy-MM-dd HH:mm"
                 		+ "").parse(examModel.getExamDate() + " " +  examModel.getExamTime());
                 
                 
                 dbdate=new SimpleDateFormat("yyyy-MM-dd").parse(examModel.getExamDate());
                 		
                 //System.out.println(dateFormat.format(date));
                 //System.out.println(dateFormat.format(dbdate));
                 	
                 	
             } catch (ParseException e) {
                 e.printStackTrace();
             }
             if(dateFormat.format(dbdate).compareTo(dateFormat.format(date))==0) {        	   
           
                 if (dateInDB.compareTo(currentDate) <= 0){             	
                  QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(Long.parseLong(examModel.getQuestionPaperNumber()));                     		
                  List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(Integer.parseInt(examModel.getQuestionPaperNumber()));
                  List<QuestionBankModel> questionsList=new ArrayList<QuestionBankModel>();                         	
                  questionpaperQn.forEach(questionpaperqn->{
                  	questionsList.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
                  });                       		
                                       		
                    model.addAttribute("questions", questionsList);
                    model.addAttribute("totalQuestions", questionsList.size());
                    model.addAttribute("totalTimeAllowedForExam",questionpapermodel.getTotal_time_allowed());
                    model.addAttribute("qnID",questionpapermodel.getQuestionpaperid());
                    model.addAttribute("examId", examId);
                    model.addAttribute("applicantName", httpSession.getAttribute("applicantName"));

                 //   httpSession.setAttribute("examStartTime", new Timestamp(System.currentTimeMillis()));           
                
             	 }
                         return "exampage";
              }
             else {
                 return "examDetails";
             }
             
         }
           
         
         else {
             return "applicantLogin";
         }         

     }


     @RequestMapping(value = "/loadQuestions", method = RequestMethod.POST)
     public @ResponseBody List<QuestionBankModel> loadQuestions(@RequestParam(value = "examId") String examId, Model model){

         ExamModel examModel = examDao.findByExamId(examId);
         model.addAttribute("examDetails", examModel);
  
         QuestionPaperModel questionpapermodel=questionPaperDao.findByQuestionpaperid(Long.parseLong(examModel.getQuestionPaperNumber()));
         httpSession.setAttribute("questionPaperId", questionpapermodel.getQuestionpaperid());
         httpSession.setAttribute("examId", examModel.getExamId());
         
         List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(Integer.parseInt(examModel.getQuestionPaperNumber()));
         List<QuestionBankModel> questionsList=new ArrayList<QuestionBankModel>();
                	
         questionpaperQn.forEach(questionpaperqn->{
         	questionsList.add(qustnbankdao.findByQuestionId(Long.parseLong(Integer.toString(questionpaperqn.getQuestionbankid() ))));
         });
         model.addAttribute("questions", questionsList);
         model.addAttribute("totalQuestions", questionsList.size());
         httpSession.setAttribute("examStartTime", new Timestamp(System.currentTimeMillis()));           
         
         //Randomly shuffling the questions
         Integer i=((int) (Math.random()*(10 - 1))) + 1;
         Integer y=0;
         for(y=0;y<i;y++){
        	 Collections.shuffle(questionsList);
         }
         
         return questionsList;
     }


     @RequestMapping(value = "/submitAnswer", method = RequestMethod.POST)
     public @ResponseBody String submitAnswer(ResultDetailsModel resultDetailsModel){

         final Long[] rowId = new Long[1];
         final int[] flag = {0};
         
         try{        	 
        	 resultDetailsModel.setApplicantId((Long)httpSession.getAttribute("applicantId"));        	 
        	 List<QuestionPaperQnModel> questionpaperQn =questionpaperqndao.findByquestionpaperid(resultDetailsModel.getQuestionpaperId());        	 
        	 questionpaperQn.stream().filter(q->q.getQuestionbankid()==resultDetailsModel.getQuestionId()).forEach(qn->resultDetailsModel.setQnScore(qn.getScoreperquestion()));       	 
        	
        	 List<ResultDetailsModel> resultsOfApplicantId=resultDetailsDao.findByApplicantId(resultDetailsModel.getApplicantId());
        	 if (resultsOfApplicantId != null && !CollectionUtils.isEmpty(resultsOfApplicantId))
             {
        		 final ResultDetailsModel[] resultToUpdate = {null};        		
        		 resultsOfApplicantId.stream().filter(result ->result.getExamId().equals(resultDetailsModel.getExamId()) && result.getQuestionpaperId()==resultDetailsModel.getQuestionpaperId() && result.getQuestionId()==resultDetailsModel.getQuestionId() )
        		 .forEach(resultOfQuestion -> {
                     resultToUpdate[0]=resultDetailsDao.getOne(Long.valueOf(resultOfQuestion.getId()));
                     resultToUpdate[0].setApplicantId(resultDetailsModel.getApplicantId());
                     resultToUpdate[0].setQnScore(resultDetailsModel.getQnScore());
                     resultToUpdate[0].setMarkedOption(resultDetailsModel.getMarkedOption());                     
                     resultToUpdate[0].setCorrectOption(resultDetailsModel.getCorrectOption());
                     resultToUpdate[0].setMarkedDesc(resultDetailsModel.getMarkedDesc());
                     resultToUpdate[0].setCorrectDesc(resultDetailsModel.getCorrectDesc());
                     resultToUpdate[0].setSection(resultDetailsModel.getSection());
                     
                     if(resultOfQuestion.getCorrectOption()!=null && resultOfQuestion.getMarkedOption()!=null){
                         if((resultOfQuestion.getCorrectOption()).equalsIgnoreCase(resultOfQuestion.getMarkedOption())){
                        	 resultToUpdate[0].setTotalScore(resultDetailsModel.getQnScore());
                         }else{
                        	 resultToUpdate[0].setTotalScore(0);
                         }
                     }else{
                    	 resultToUpdate[0].setTotalScore(0);
                     }
                     
                 });
        		 if (resultToUpdate[0] != null && resultToUpdate[0].getId() != null){        			 
        			 resultDetailsDao.save(resultToUpdate[0]);        			
                 }else {
                   if(resultDetailsModel.getCorrectOption()!=null && resultDetailsModel.getMarkedOption()!=null){                         	 
                	 if((resultDetailsModel.getCorrectOption()).equalsIgnoreCase(resultDetailsModel.getMarkedOption())){
                		 resultDetailsModel.setTotalScore(resultDetailsModel.getQnScore());
                     }else{
                    	 resultDetailsModel.setTotalScore(0);
                     }
                	}else{
                		resultDetailsModel.setTotalScore(0);
                    }
                	 resultDetailsDao.save(resultDetailsModel);                	 
                 }
        		 
        
             
             }else {
               if(resultDetailsModel.getCorrectOption()!=null && resultDetailsModel.getMarkedOption()!=null){                     
            	 if((resultDetailsModel.getCorrectOption()).equalsIgnoreCase(resultDetailsModel.getMarkedOption())){
            		 resultDetailsModel.setTotalScore(resultDetailsModel.getQnScore());
                 }else{
                	 resultDetailsModel.setTotalScore(0);
                 }
               }else{
           		resultDetailsModel.setTotalScore(0);
               }
            	 resultDetailsDao.save(resultDetailsModel);
             }


             return  "success";
        	
         }
         catch (Exception e){
             return "failed";        	
         }
     }


     @RequestMapping(value = "/computeResult", method = RequestMethod.GET)
     public String computeResult(){

         try{        	 
        	 
        	 final int[] desc={0};
        	 desc[0]=0;        	 
             final double[] passPercentage = {0};
             final int[] totalScore = {0};
             final int[] correctAnswers = {0};
             final int[] questionsAttempted = {0};
             final int[] maximumScore = {0};
             HashMap<String, Integer> sectionScore = new HashMap<String, Integer>();

             Long applicantId = null;
             Timestamp examStartTime;
             Timestamp examEndTime;
             long timeTaken = 0;              
            
             
             if(httpSession.getAttribute("applicantId") != null && httpSession.getAttribute("examStartTime") != null){
                 applicantId = (Long) httpSession.getAttribute("applicantId");
                 examStartTime = (Timestamp) httpSession.getAttribute("examStartTime");
                 examEndTime = new Timestamp(System.currentTimeMillis());

                 timeTaken = (examEndTime.getTime() - examStartTime.getTime())/1000;    
             }
             
            
             List<ResultDetailsModel> resultDetailsModel = resultDetailsDao.findByApplicantId(applicantId);             
             if(resultDetailsModel.size()>0){            	 
             resultDetailsModel=(List<ResultDetailsModel>)resultDetailsModel.stream().filter(x->{return x.getExamId().equals((String)httpSession.getAttribute("examId"));}).collect(Collectors.toList());    
             
             resultDetailsModel.forEach(resultDetails -> {
             	 questionsAttempted[0] = questionsAttempted[0] + 1;              
                 QuestionPaperModel questionPaperModel=questionPaperDao.findByQuestionpaperid((Long)httpSession.getAttribute("questionPaperId"));
                 passPercentage[0] = questionPaperModel.getPass_percentage();
                 maximumScore[0] = questionPaperModel.getMaximum_score();                 
                 if(resultDetails.getCorrectDesc()!=null){desc[0]=1;}               
            	 
            	 if(resultDetails.getCorrectOption()!=null && resultDetails.getMarkedOption()!=null){
                   if((resultDetails.getCorrectOption()).equalsIgnoreCase(resultDetails.getMarkedOption())){
                     correctAnswers[0] = correctAnswers[0] + 1;
                     totalScore[0] = totalScore[0] + resultDetails.getQnScore();

                     if(sectionScore.containsKey(resultDetails.getSection())){
                         sectionScore.replace(resultDetails.getSection(),  sectionScore.getOrDefault(resultDetails.getSection(), 0) + resultDetails.getQnScore());
                     }
                     else {
                         sectionScore.put(resultDetails.getSection(), sectionScore.getOrDefault(resultDetails.getSection(), 0) +resultDetails.getQnScore());
                     }                    
                    
                   }
            	 }            	 

             });

             
             
             if (totalScore[0] >= maximumScore[0]){
                 totalScore[0] = maximumScore[0];
             }

             ResultModel resultModel = new ResultModel();

             resultModel.setQuestionsAttempted(questionsAttempted[0]);
             resultModel.setApplicantId(applicantId);
             resultModel.setTotalScore(totalScore[0]);
             resultModel.setCorrectAnswers(correctAnswers[0]);
             resultModel.setExamId(resultDetailsModel.get(0).getExamId());
             Long i=(Long)httpSession.getAttribute("questionPaperId");
             resultModel.setQuestionPaperId(Math.toIntExact(i));
             
             QuestionPaperModel questionPaperModell=questionPaperDao.findByQuestionpaperid((Long)httpSession.getAttribute("questionPaperId"));
             sectionScore.forEach((section, score) -> {
                 if (section.equalsIgnoreCase(questionPaperModell.getSection1())){
                	 resultModel.setSection1(score);
                 }
                 else if(section.equalsIgnoreCase(questionPaperModell.getSection2())){
                	 resultModel.setSection2(score);
                 }
                 else if(section.equalsIgnoreCase(questionPaperModell.getSection3())){
                	 resultModel.setSection3(score);
                 }else if(section.equalsIgnoreCase(questionPaperModell.getSection4())){
                	 resultModel.setSection4(score);
                 }

             });
                   		            
             if(desc[0]==1){resultModel.setFinalResult("no");}
             else{resultModel.setFinalResult("yes");}
             resultModel.setTimeTaken(timeTaken);
             resultModel.setScoreType("obtained");
             Date todaysDate = new Date();
             DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
             resultModel.setAttendedDate(df.format(todaysDate));
             resultModel.setAttendedTime(new SimpleDateFormat("HH:mm:ss").format(Calendar.getInstance().getTime()));

             if(passPercentage[0] <= ((totalScore[0]/maximumScore[0]))*100){
            	 resultModel.setStatus("Passed");
             }
             else {
            	 resultModel.setStatus("Failed");
             }
             
             // status of the exam 
             
             if( ((double)((double)totalScore[0]/(double)maximumScore[0])*100)>=passPercentage[0]) {
            	 resultModel.setStatus("Passed");
             }
             else {
            	 resultModel.setStatus("Failed");
             }
             

             ApplicantRegisterModel applicantRegisterModel = applicantRegisterDao.findOne(Long.valueOf(applicantId));
             resultModel.setApplicantName(applicantRegisterModel.getCandidateName());

             resultDao.save(resultModel);

             applicantRegisterModel.setExamAttended("true");
             applicantRegisterDao.updateExamAttendedStatus("true", applicantId);

             httpSession.invalidate();
             httpSession.getAttribute("applicantId");
             }

             return "endExam";
         }
         catch (Exception e){           	
             return "endExam";
         }
     }
     
    @RequestMapping(value = "/viewResults", method = RequestMethod.GET)
    public String viewResults(@RequestParam(value = "examId", required = false) String examId, Model model){

        List<ExamModel> examList;
        List<FinalResultsModel> finalResultsModels = null;
       
        HashMap<Long, ApplicantRegisterModel> applicantDetails = new HashMap<>();
        final ApplicantRegisterModel[] applicantInfo = new ApplicantRegisterModel[1];
        HashMap<String, Integer> sectionData = new HashMap<>();
        ArrayList<String> sectionNames = new ArrayList<>();

        /*sectionData.put("Default", 0);
        sectionNames.add("Default");*/
        
      
        

        final long[] totalTimeTakenByCandidates = new long[1];
        final int[] candidatesPassed = {0};

        examList = examDao.findAll();

        if(examId != null){
            examList.forEach(exam -> {
                if (exam.getExamId() != null && exam.getExamId().equals(examId)){

                    QuestionHeaderModel questionHeader = questionHeaderDao.findByQuestionPaperNumber(exam.getQuestionPaperNumber());
                    if (!StringUtils.isEmpty(questionHeader.getSection1()) && !StringUtils.isEmpty(questionHeader.getSection2()) && !StringUtils.isEmpty(questionHeader.getSection3())){

                        sectionData.put(questionHeader.getSection1(), 0);
                        sectionData.put(questionHeader.getSection2(), 0);
                        sectionData.put(questionHeader.getSection3(), 0);

                        sectionNames.add(questionHeader.getSection1());
                        sectionNames.add(questionHeader.getSection2());
                        sectionNames.add(questionHeader.getSection3());

                      //  sectionNames.sort((s1, s2) -> s1.compareToIgnoreCase(s2));

                        model.addAttribute("sectionNames", sectionNames);
                    }


                    model.addAttribute("examName", exam.getExamName());
                    model.addAttribute("examId", examId);
                    model.addAttribute("examDate", exam.getExamDate());
                    model.addAttribute("questionPaperNumber", exam.getQuestionPaperNumber());

                    List<QuestionsModel> questions = questionsDao.findByQuestionPaperNumber(exam.getQuestionPaperNumber());
                    QuestionHeaderModel questionHeaderModel = questionHeaderDao.findByQuestionPaperNumber(exam.getQuestionPaperNumber());
                    model.addAttribute("totalExamDuration", questionHeaderModel.getTotalTimeAllowedForExam());
                    model.addAttribute("maximumScore", questionHeaderModel.getMaximumScore());
                    model.addAttribute("passpercentage", questionHeaderModel.getPassPercentage());

                    if(!CollectionUtils.isEmpty(sectionData)) {
                        questions.forEach(question -> {
                            if(!StringUtils.isEmpty(question.getSection())){
                                sectionData.replace(question.getSection(), sectionData.get(question.getSection()) + question.getScore());
                            }
                        });
                        model.addAttribute("sectionData", sectionData);
                    }
                }
            });
            finalResultsModels = finalResultsDao.findByExamId(examId);

            finalResultsModels.forEach((FinalResultsModel finalResult) -> {
                totalTimeTakenByCandidates[0] = totalTimeTakenByCandidates[0] + finalResult.getTimeTaken();
                if (finalResult.getStatus().equals("Passed")){
                    candidatesPassed[0] = candidatesPassed[0] + 1;
                }

                applicantInfo[0] = applicantRegisterDao.findOne(finalResult.getApplicantId());
                applicantDetails.put(finalResult.getApplicantId(), applicantInfo[0]);
            });

            double passPercentage = ((double)candidatesPassed[0]/(double)finalResultsModels.size())*100;
            model.addAttribute("candidatePassPercentage", passPercentage);

            long averageTimeTaken = 0;
            if(finalResultsModels.size() > 0){
                averageTimeTaken = totalTimeTakenByCandidates[0] / finalResultsModels.size();
            }

            TimeZone tz = TimeZone.getTimeZone("UTC");
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
            df.setTimeZone(tz);

            model.addAttribute("averageTimeTaken", df.format(new Date(averageTimeTaken*1000)));
            model.addAttribute("candidatesPassed", candidatesPassed[0]);
            model.addAttribute("candidatesFailed", finalResultsModels.size() - candidatesPassed[0]);

            //finalResultsModels.sort((result1, result2) -> (Integer.toString(result1.getTotalScore()).compareTo(Integer.toString(result2.getTotalScore()))));
            Collections.sort(finalResultsModels, new ResultComparator());

            int i = 0;
            int rank = 0;
            if(finalResultsModels.size() > 0){
                finalResultsModels.get(0).setRank(1);
                while (i < (finalResultsModels.size()-1)){

                    if (finalResultsModels.get(i).getTotalScore() == finalResultsModels.get(i+1).getTotalScore()){
                        finalResultsModels.get(i+1).setRank(finalResultsModels.get(i).getRank());
                    }
                    else {

                        finalResultsModels.get(i+1).setRank(finalResultsModels.get(i).getRank() + 1);
                    }
                    i = i + 1;
                }
            }


            model.addAttribute("applicantDetails", applicantDetails);

            model.addAttribute("results", finalResultsModels);
            model.addAttribute("noOfCandidates", finalResultsModels.size());
        }
        /*else{
            finalResultsModels = finalResultsDao.findAll();
            finalResultsModels.sort((result1, result2) -> (Integer.toString(result2.getTotalScore()).compareTo(Integer.toString(result1.getTotalScore()))));
        }*/

        
        //model.addAttribute("examList", examList);  //// Filter ExamId as the NEW System does not support old exam/result        
        List<FinalResultsModel> finalResultsExm = finalResultsDao.findAll();
        HashSet<Object> seen=new HashSet<>();
        finalResultsExm.removeIf(e->!seen.add(e.getExamId()));
        List<ExamModel> examResLst=new ArrayList<ExamModel>();
        for(FinalResultsModel f:finalResultsExm){
        	examResLst.add(examDao.findByExamId(f.getExamId()));
        }
        examList=examResLst;
        model.addAttribute("examList", examList);
        /////////////////////////////////////////////////
        
        if(viewController.validatePageAccess("/viewResults"))
	        {
	    		
        	 return "viewresult";
	        }
	        else {
	            return "no_access";
	        }
       
        
        
    }

    @RequestMapping(value = "/reportCard", method = RequestMethod.GET)
    public String viewReportCard(@RequestParam( value = "examId", required = false) String examId,
                                 @RequestParam( value = "applicantId", required = false) String applicantId, Model model){
    	int scoretotal=0;
    	int scoreobtain=0;
        List<ExamResultModel> examResult;
        FinalResultsModel finalResult;
        ArrayList<Integer> scorearray = new ArrayList<Integer>();
       ExamModel exmvalue;
        finalResult = finalResultsDao.findByApplicantId(Long.parseLong(applicantId));
        examResult = examResultDao.findByApplicantId(Long.parseLong(applicantId));
        exmvalue=examDao.findByExamId(examId);
        List<QuestionsModel> questions;
        QuestionHeaderModel questionHeader;
        String questionPaperNumber = finalResult.getQuestionPaperNumber();
        ArrayList<Integer> scoreobtained = new ArrayList<Integer>();

        questionHeader = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);
        questions = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
        
        
        questions.forEach(questionscore -> {
			scorearray.add(questionscore.getScore());
			
			});
        for(int i=0;i<scorearray.size();i++) {
			scoretotal+=scorearray.get(i);	
		}
        
        
        examResult.forEach(scores -> {
        	scoreobtained.add(scores.getScore());
			
			});
        for(int p=0;p<scoreobtained.size();p++) {
        	scoreobtain+=scoreobtained.get(p);	
		}
        
       // System.out.println(scoreobtain);
        

        questions.sort((question1, question2) -> question1.getQuestionId().compareTo(question2.getQuestionId()));
        examResult.sort((result1,result2) -> result1.getQuestionId().compareTo(result2.getQuestionId()));


        model.addAttribute("scoretotal", scoretotal);
        model.addAttribute("scoreobtains", scoreobtain);
        model.addAttribute("finalResult", finalResult);
        model.addAttribute("examResult", examResult);
        model.addAttribute("questionHeader", questionHeader);
        model.addAttribute("questionsList", questions);
        model.addAttribute("percentage", (finalResult.getTotalScore()/questionHeader.getMaximumScore())*100);
        model.addAttribute("exmname", exmvalue.getExamName());
        TimeZone tz = TimeZone.getTimeZone("UTC");
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        df.setTimeZone(tz);

        model.addAttribute("timeTaken", df.format(new Date(finalResult.getTimeTaken()*1000)));

        return "viewReportCard";

    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public String uploadFile(
            @RequestParam(value = "questionImg", required = false) MultipartFile questionImg,
            @RequestParam(value = "option1Img", required = false) MultipartFile option1Img,
            @RequestParam(value = "option2Img", required = false) MultipartFile option2Img,
            @RequestParam(value = "option3Img", required = false) MultipartFile option3Img,
            @RequestParam(value = "option4Img", required = false) MultipartFile option4Img) {


        MultipartFile fileToUpload = null;
        String fileUploadedFor;

        try {

            if (questionImg != null && !StringUtils.isEmpty(questionImg.getOriginalFilename())){
                fileToUpload = questionImg;
                fileUploadedFor = "questionImg";
            }
            else if(option1Img != null && !StringUtils.isEmpty(option1Img.getOriginalFilename())){
                fileToUpload = option1Img;
                fileUploadedFor = "option1Img";
            }
            else if(option2Img !=null && !StringUtils.isEmpty(option2Img.getOriginalFilename())){
                fileToUpload = option2Img;
                fileUploadedFor = "option2Img";
            }
            else if(option3Img !=null && !StringUtils.isEmpty(option3Img.getOriginalFilename())){
                fileToUpload = option3Img;
                fileUploadedFor = "option3Img";
            }
            else if(option4Img !=null && !StringUtils.isEmpty(option4Img.getOriginalFilename())){
                fileToUpload = option4Img;
                fileUploadedFor = "option4Img";
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

        return fileUploadedFor;
    } // method uploadFile

    @RequestMapping(value = "/endExam", method = RequestMethod.GET)
    public String endExam(){

        return "endExam";
    }

    @RequestMapping(value = "/uploadQuestionsFromExcel", method = RequestMethod.GET)
    public String uploadQuestionsFromExcel(){
    	if(viewController.validatePageAccess("/uploadQuestionsFromExcel"))
	        {
    		  return "uploadExcel";
   
	        }
	        else {
	            return "no_access";
	        }
      
    }

    @RequestMapping(value = "/uploadExcel", method = RequestMethod.POST)
    @ResponseBody
    public String uploadExcel(@RequestParam(value = "excelFile", required = false) MultipartFile excelFile){


        try{

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


            List<QuestionsModel> questions = Poiji.fromExcel(new File(filepath), QuestionsModel.class);
            questions.remove(0);


            try {
                QuestionHeaderModel questionHeader = (QuestionHeaderModel) httpSession.getAttribute("questionHeaderForExcelUpload");
                questionHeaderDao.save(questionHeader);
            }
            catch (Exception e){
                e.getMessage();
            }

            try{
                questionsDao.save(questions);
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

    @RequestMapping(value = "/uploadQuestionHeaderForExcelUpload", method = RequestMethod.POST)
    @ResponseBody
    public String uploadQuestionHeaderForExcelUpload(QuestionHeaderModel questionHeader){

        httpSession.setAttribute("questionHeaderForExcelUpload", questionHeader);

        return "success";

    }

    @RequestMapping(value = "/updateQuestion", method = RequestMethod.GET)
    public String updateQuestion(@RequestParam(value = "questionId", required = false) String questionId, Model model){

        QuestionsModel questionToEdit;
        QuestionHeaderModel questionPaperToEdit = null;
        String questionPaperNumber;

        try{
            questionToEdit = questionsDao.findByQuestionId(Long.valueOf(questionId));

            if(questionToEdit != null && !StringUtils.isEmpty(questionToEdit.getQuestionPaperNumber())){
                questionPaperNumber = questionToEdit.getQuestionPaperNumber();

                questionPaperToEdit = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);
            }

            model.addAttribute("questionToEdit", questionToEdit);
            model.addAttribute("questionPaperToEdit", questionPaperToEdit);
        }
        catch (Exception e){
            e.getMessage();
        }


        return "updateQuestions";
    }

    @RequestMapping(value = "/updateQuestionAjaxCall", method = RequestMethod.GET)
    public String updateQuestionAjaxCall(@RequestParam(value = "questionId", required = false) String questionId,
                                         @RequestParam(value = "questionPaperNumber", required = false) String questionPaperNumber,
                                         Model model){

        List<QuestionsModel> questionsList = null;
        QuestionHeaderModel questionHeaderModel = null;
        List<String> questionPaperNumberList = new ArrayList<>();
        List<QuestionHeaderModel> questionPaperList = null;


        questionPaperList = questionHeaderDao.findAll();
        questionPaperList.forEach(questionPaper -> {
            questionPaperNumberList.add(questionPaper.getQuestionPaperNumber());
        });

        try{
            if(questionId != null){
                questionsDao.delete(Long.valueOf(questionId));
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        finally {
            if(questionPaperNumber != null){
                questionsList = questionsDao.findByQuestionPaperNumber(questionPaperNumber);
                questionHeaderModel = questionHeaderDao.findByQuestionPaperNumber(questionPaperNumber);

            }
            else{
                questionsList = questionsDao.findAll();
            }
        }

        model.addAttribute("questionHeader", questionHeaderModel);
        model.addAttribute("questionsList", questionsList);
        model.addAttribute("questionPaperNumber", questionPaperNumber);
        model.addAttribute("questionPaperNumberList", questionPaperNumberList);

        return "editQuestions";
    }
    
    
}
