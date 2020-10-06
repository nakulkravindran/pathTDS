package com.clizo.controller;

import com.clizo.dao.AddnewDao;
import com.clizo.dao.ExamDao;
import com.clizo.dao.QuestionHeaderDao;
import com.clizo.dao.ScreenAccessDao;
import com.clizo.dao.ScreenDao;
import com.clizo.dao.QuestionPaperDao;
import com.clizo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ViewController {


    final private String INDEX = "/index";
    final private String ADD_NEW_USER = "/user";
    final private String VIEW_NEW_USER = "/UsersView";
   final private String PRIVILAGES = "/privileges";
    final private String USER_MANAGEMENT = "/usermangmnt";
    final private String PASS_MANAGEMENT = "/passwordMangement";
    final private String UPLOAD_EXCEL = "/QuestnExcel";
    final private String EXAM_MANAGEMENT = "/exammangmnt";
    final private String MANAGE_QUESTIONS = "/manageQuestions";
    final private String EXAM_ANNOUNCEMENT = "/exam";
   

    @Autowired
    AddnewDao addnewuserDao;

    @Autowired
    HttpSession httpSession;

    @Autowired
    ScreenDao screenDao;

    @Autowired
    ScreenAccessDao screenAccessDao;
    @Autowired
    QuestionHeaderDao questionHeaderDao;
    @Autowired
    ExamDao examDao;
    @Autowired
    QuestionPaperDao QuestionPaperDao;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loginpage(){
        return "login";
    }

    @RequestMapping(value = ADD_NEW_USER, method = RequestMethod.GET)
    public String addnew(Model model){
        if (validatePageAccess(ADD_NEW_USER)){


            List<ScreenModel> screenList = screenDao.findAll();
            model.addAttribute("screenList", screenList);
            LoggedInUserDetailsPOJO loggedInUserDetails = (LoggedInUserDetailsPOJO) httpSession.getAttribute("loggedInUserDetails");
            model.addAttribute("userId", loggedInUserDetails.getId());
            return "adduser";
        }
        else {
            return "no_access";
        }

    }
    
    @RequestMapping(value = VIEW_NEW_USER, method = RequestMethod.GET)
    public String viewnewuser(Model model){
    	
    	 if (validatePageAccess(VIEW_NEW_USER)){
    	List<AdduserModel> userList = addnewuserDao.findAll();
	   	 model.addAttribute("userList", userList);
    	return "UsersView";
    	 }
    	 else {
    		 return "no_access"; 
    	 }
    }
    
    
    

    @RequestMapping(value = PRIVILAGES, method = RequestMethod.GET )
    public String privilege(@RequestParam(value = "screenId", required = false) Long screenId,Model model,ScreenAccessModel ScrenAcess){
    	
        if (validatePageAccess(PRIVILAGES)){
        	
        	/*List<AdduserModel> userList =  addnewuserDao.findAll();
        	 List<ScreenAccessModel> screenAccessDetails = screenAccessDao.findAll();
        	 List<ScreenModel> screenList = screenDao.findAll();
        	Map<ScreenModel, String> screenAccessMap = new LinkedHashMap<>();

            screenList.forEach(screen -> {
                screenAccessDetails.forEach(screenDetail -> {
                    if(screen.getId() == screenDetail.getScreenId()){
                        screenAccessMap.put(screen, screenDetail.getScreenAccess());
                    }
                });
            });
        	
             model.addAttribute("userList", userList); 
            
             model.addAttribute("screenList", screenList); 
             model.addAttribute("screenAccessMap", screenAccessMap);
             
   	       //System.out.println(screenList);*/
   	   
        	return "privileges";
        }
        
        
        else {
            return "no_access";
        }
        
    }

    
    
  /*  @RequestMapping(value = "/addPrivilage", method = RequestMethod.GET)
    public String addPrivilage( @RequestParam(value = "userId", required = true) int userId,@RequestParam(value = "screenId", required = true) int screenId, Model model,ScreenAccessModel ScrenAcess){


    	 try {
       	     if(!StringUtils.isEmpty(screenId)){
       	    	 
       	       screenAccessDao.save(ScrenAcess);
       	 }
       	    }
       	 catch (Exception e){
             return "failed";
         }
        

    	 return "redirect:/privileges";
    }
    */
    
    @RequestMapping(value = "/changePrivilage", method = RequestMethod.GET)
    public String changePrivilage(@RequestParam(value = "userId", required = true) int userId,
                                  @RequestParam(value = "screenId", required = true) int screenId, Model model){


        List<ScreenAccessModel> screenAccessDetails = screenAccessDao.findAllByUserId(userId);
        screenAccessDetails.forEach(screenDetail -> {
            if ((screenDetail.getScreenId() == screenId) && (screenDetail.getUserId() == userId)){
                if (screenDetail.getScreenAccess().equals("yes")){
                    screenAccessDao.updatePrivilage("no", screenDetail.getId());
                }
                else if(screenDetail.getScreenAccess().equals("no")){
                    screenAccessDao.updatePrivilage("yes", screenDetail.getId());
                }

            }
        });

        return "redirect:/editUser?userid=" + userId;
    }

    @RequestMapping(value = "/regisucess", method = RequestMethod.GET)
    public String regisucess(){
       
            return "regisucess";
        

    }
    
    @RequestMapping(value = "/regitrainingsuccess", method = RequestMethod.GET)
    public String regitrainingsuccess(){
       
            return "regitrainingsuccess";
        

    }

    @RequestMapping(value = USER_MANAGEMENT, method = RequestMethod.GET)
    public String usermangmnt(){
       
            return "usermangmnt";
        

    }
    
    @RequestMapping(value = PASS_MANAGEMENT, method = RequestMethod.GET)
    public String passmangmnt(){
       
            return "passwordMangement";
        

    }
    
    
    

    @RequestMapping(value = UPLOAD_EXCEL, method = RequestMethod.GET)
    public String QuestnExcel(){
        if (validatePageAccess(UPLOAD_EXCEL)){
            return "QuestnExcel";
        }
        else {
            return "no_access";
        }

    }

    @RequestMapping(value = EXAM_MANAGEMENT, method = RequestMethod.GET)
    public String exammangmnt(){
       
            return "exammangmnt";
        }
        

   

    @RequestMapping(value = "/examcon", method = RequestMethod.GET)
    public String examm(){
        if (validatePageAccess("/examcon")){
            return "examcon";
        }
        else {
            return "no_access";
        }

    }

    @RequestMapping(value = INDEX, method = RequestMethod.GET)
    public String homepage(Model model){

       
        	 List<AdduserModel> userList = addnewuserDao.findAll();
    	   	 model.addAttribute("userList", userList);
            return "index";
            
       
    }

    @RequestMapping(value = MANAGE_QUESTIONS, method = RequestMethod.GET)
    public String questions(){
       
            return "questions";
        }
      

   

    @RequestMapping(value = EXAM_ANNOUNCEMENT, method = RequestMethod.GET)
    public String exam(Model model){
        if (validatePageAccess(EXAM_ANNOUNCEMENT)){
        	
        	
        	List<QuestionHeaderModel> Questnheadr = questionHeaderDao.findAll();
        	
        	List<QuestionPaperModel> QuestnpaperList=QuestionPaperDao.findAll();
        	
        	List<String> questionPaperNumberList = new ArrayList<>();
    		List<ExamModel> questionPaperList = null;
    		 
    		
    		questionPaperList = examDao.findAll();
    		questionPaperList.forEach(questionPaper -> {
    		questionPaperNumberList.add(questionPaper.getExamId());
    		});
    		model.addAttribute("ExamidList", questionPaperNumberList);
            
   	   	 model.addAttribute("QuestnheadrList", Questnheadr);
   	  model.addAttribute("QuestnpaperList", QuestnpaperList); 
   	   	 return "examannouncement";
       
        }
        else {
            return "no_access";
        }

    }

       @RequestMapping(value = "/getUserDetails", method = RequestMethod.POST)
      public @ResponseBody  String validateLogin( LoginModel userLoginData) {
   
        try
        {
//            LoginModel loginModel = loginDao.findByUserName(userLoginData.getUserName());
            AdduserModel userModel = addnewuserDao.findByUsername(userLoginData.getUserName());
           
            
               
            
          
            if (userModel.getPassword().equals(userLoginData.getPassword()) && userModel.getStatus().equals("Active")){

                LoggedInUserDetailsPOJO loggedInUserDetails = new LoggedInUserDetailsPOJO(userModel);
               
                List<String> screenList = new ArrayList<String>();
               //ScreenModel screen = new ScreenModel();
                List<ScreenAccessModel> screenAccessDetails = screenAccessDao.findAllByUserId(Integer.parseInt(loggedInUserDetails.getId().toString()));
               
               
                ArrayList<Long> arr = new ArrayList<Long>();
         
                screenAccessDetails.forEach(screenAccessDetail -> {
               
                    
                   
                arr.add(screenAccessDetail.getId());
                    
              
                    if(screenAccessDetail.getScreenAccess().equals("yes")){
                    	  
                    	 ScreenModel screens=screenDao.findById(screenAccessDetail.getScreenId());
                    	
                      screenList.add(screens.getScreenName());
                       
                    }
                });
               
               // System.out.println(arr);

                loggedInUserDetails.setScreenList(screenList);
                httpSession.setAttribute("uid",userModel.getId() );
                httpSession.setAttribute("curntpass",userModel.getPassword() );
                httpSession.setAttribute("uname",userModel.getName() );
                httpSession.setAttribute("loggedInUserDetails", loggedInUserDetails);

                return "success";
            }
            else{
                return "failed";
            }
        }
        catch (Exception e){
            return "failed";
        }
    }
    
    
   
    
       
        public boolean validatePageAccess(String url) {
        if (httpSession.getAttribute("loggedInUserDetails") != null){
            LoggedInUserDetailsPOJO loggedInUserDetails = (LoggedInUserDetailsPOJO) httpSession.getAttribute("loggedInUserDetails");

            if (!CollectionUtils.isEmpty(loggedInUserDetails.getScreenList())){
                Iterator screenListIterator = loggedInUserDetails.getScreenList().listIterator();
                if (CollectionUtils.contains(screenListIterator, url)){
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }
        }
        else {
            return false;
        }
    }
}

