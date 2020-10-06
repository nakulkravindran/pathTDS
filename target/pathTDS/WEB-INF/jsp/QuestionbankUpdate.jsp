<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>T&amp;D System</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/now-ui-dashboard.css?v=1.0.1" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="assets/demo/demo.css" rel="stylesheet" />

</head>

<style>
    .btn-bs-file {
        position: relative;
    }

    .btn-bs-file input[type="file"] {
        position: absolute;
        top: -9999999;
        filter: alpha(opacity=0);
        opacity: 0;
        width: 0;
        height: 0;
        outline: none;
        cursor: inherit;
    }
</style>

<body class="">
    <%
response.setHeader("Cache-control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP1.0
response.setDateHeader("Expire",0); //prevents caching at the proxy server
%>
        <div class="sidebar" data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
            <div class="logo">

                <a href="#" class="simple-text logo-normal" style="text-align:center;font-weight:600;">
                    T&D System
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li>
                        <a href="/pathTDS/index">
                            <i class="now-ui-icons design_app"></i>
                            <p>Admin</p>
                        </a>
                    </li>
                    <!--    <li >
                        <a href="/pathTDS/privileges">
                            <i class="now-ui-icons education_atom"></i>
                            <p>Privileges</p>
                        </a>
                    </li>-->
                    <li>
                        <a href="/pathTDS/usermangmnt">
                            <i class="now-ui-icons location_map-big"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/passwordMangement">
                            <i class="now-ui-icons ui-1_lock-circle-open"></i>
                            <p>Password Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/setuppara">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Parameter setup</p>
                        </a>
                    </li>
                    <li class="active">
                        <a href="/pathTDS/manageQuestions">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Questions</p>
                        </a>
                    </li>
                    
                    <li>
                        <a href="/pathTDS/exammangmnt">
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Exam Management </p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/viewApplicants">
                            <i class="now-ui-icons design_bullet-list-67"></i>
                            <p>Applications Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/viewResults">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Old Results</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/UpgradeScoreResult">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Results</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/TrainingModule">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Training</p>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute bg-primary fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span>
                                <span class="navbar-toggler-bar bar2"></span>
                                <span class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a class="navbar-brand" href="#pablo">USER: <%= session.getAttribute("uname") %></a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">

                        <ul class="navbar-nav">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="now-ui-icons location_world"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Change Password</span>
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">

                                    <a class="dropdown-item" href="/pathTDS/logout">Logout</a>

                                </div>
                            </li>
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <i class="now-ui-icons users_single-02"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Account</span>
                                    </p>
                                </a>
                            </li> -->
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="panel-header panel-header-sm">
            </div>
            <div class="content">
                <div id="questionHeader" class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title"> Edit Questions</h5>
                            </div>
                            <div class="card-body">
                                <form id="uploadQuestionsupdate" onsubmit="return false;" >

                                    <div class="row">

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Question Type</label>
                                               <select hidden class=" form-control validate "  id="mySelect" onblur="myFunction()" value="${qnmodel.qn_type}">
												  <option >Select</option>
												  <option value="multiple">Objective</option>
												  <option value="descriptive">Descriptive</option>
												
												     </select> 
												 <input type="text" readonly id="Qn_type" class=" form-control validate " name="Qn_type" value="${qnmodel.qn_type}">   
                                            </div>
                                            <div id=qnype style=display:none;color:red;><i><font size="2">please enter question  type </i></font>
                                            </div>
                                              
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Class Name</label>
                                              
                                                 <input list="paramList" autocomplete="off" id="className" name="className" class="form-control validate" placeholder="Class Name" value="${qnmodel.class_name}"  maxlength="30" onfocus="MsgFunction()">
                                                  <datalist id="paramList">
                                                    <c:forEach items="${paramList}" var="parameters" >
                                                    <c:if test="${parameters.prm_type eq 'class'}"> 
                                                        <option value="${parameters.prm_shortname}">${parameters.prm_name}</option>
                                                       
                                                        </c:if>
                                                         
                                                    </c:forEach>
                                                </datalist>
                                            </div>
                                      
                                            
                                        </div>
                                        
                                        
                                                <c:forEach items="${paramList}" var="parameters" >
                                                    <c:if test="${parameters.prm_type eq 'class'}"> 
                                                        
                                                       <input type="hidden" name=classchek[] id=classchek value="${parameters.prm_shortname}">
                                                        </c:if>
                                                          <c:if test="${parameters.prm_type eq 'section'}"> 
                                                        
                                                            <input type="hidden" name=sectionchek[] id=sectionchek value="${parameters.prm_name}">
                                                        </c:if>
                                                         <c:if test="${parameters.prm_type eq 'Difficulty level'}"> 
                                                          <input type="hidden" name=difficultychek[] id=difficultychek value="${parameters.prm_name}">
                                                        </c:if>
                                                    </c:forEach>
                                                    
                                                    
                                                    
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                            <label>Section</label>
                                               <input list="sectionparamList" autocomplete="off" id="Section" name="Section" class="form-control validate" placeholder="Section" value="${qnmodel.section}"  maxlength="30" onfocus="MsgFunction()">
                                                  <datalist id="sectionparamList">
                                                    <c:forEach items="${paramList}" var="sectionpara" >
                                                    <c:if test="${sectionpara.prm_type eq 'section'}"> 
                                                        <option value="${sectionpara.prm_name}"></option>
                                                        </c:if>
                                                    </c:forEach>
                                                </datalist>
                                              
 
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Difficulty Level</label>
                                               <input list="difficultyparamList" autocomplete="off" id="difficultylevel" name="difficultylevel" class="form-control validate" placeholder="Difficultylevel" value="${qnmodel.difficultylevel}"  maxlength="20" onfocus="MsgFunction()">
                                                  <datalist id="difficultyparamList">
                                                    <c:forEach items="${paramList}" var="diffcultpara" >
                                                    <c:if test="${diffcultpara.prm_type eq 'Difficulty level'}"> 
                                                        <option value="${diffcultpara.prm_name}">${parameters.prm_shortname}</option>
                                                        </c:if>
                                                    </c:forEach>
                                                </datalist>
                                               
                                               
                                                
                                            </div>
                                            
                                           
                                            
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Time Per Question(secs)</label>
                                                <input type="text" id="timeperQuestion" name="timeperQuestion" class="form-control" placeholder="Time Per Question" value="${qnmodel.time_per_question}" onfocus="TimeFunction()" maxlength="4"onkeyup="digitfunction()" onkeypress="HideTime()">
                                            </div>
                                            <div id="time" style=display:none;color:red><i><font size="2">please enter time per question </font> </i></div>
                                             <div id="digit" style=display:none;color:red><i><font size="2">You have exceed the maximum length</font> </i></div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Area</label>
                                                <input type="text" id="area" name="area" class="form-control" placeholder="Area" value="${qnmodel.area}" maxlength="250">
                                            </div>
                                        </div>
                                        
										<div class="col-md-4 ">
                                            <div class="form-group">
                                               
                                                <input type="hidden" id="scoreperQuesion" name="scoreperQuesion" class="form-control" placeholder="Score Per Question" onfocus="ScoreFunction()" onkeypress="HideScore()" onkeyup="scorecheck()" maxlength="2"value="">
                                            </div>
                                      <div id="scre" style=display:none;color:red><i><font size="2">You have exceed the maximum length</font> </i></div>
                                            <div id="scoreqn" style=display:none;color:red><i><font size="2">please enter score per question </font> </i></div>
                                        </div>
                                    </div>

                                    <div class="row" id="lastoption"  style=display:none;>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Last Option Value</label>
                                                <input type="text" id="noneof" name="noneof" class="form-control" placeholder="Last Option Value" value="${qnmodel.op5}">
                                            </div>
                                        </div>
                                         </div>
                                      <input type="hidden" value="unused" id="Status" name="Status">  

                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Question</label>
                                       <%--  <textarea id="Question"   name="Question" class="form-control" placeholder="Question"  onfocus="QuestionFunction()" onkeypress="HidedQuest()">${qnmodel.question}</textarea> --%>
                                        <textarea id="Question"   name="Question" class="form-control" placeholder="Question" >${qnmodel.question}</textarea>
                                        
                                    </div>
                                    <div id="quesn" style=display:none;color:red><i><font size="2">please enter the question </font> </i></div>

                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-questionImg" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info" style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="questionImg" class="upload-file-input" type="file" name="questionImg" accept="*" />
                                    </label>
                                </div>

                            </div>                     
                            
                           <c:if test="${qnmodel.qn_type eq 'multiple'}">  
                            <div id="objective" >
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Option 1</label>
                                        <textarea id="option1"  name="option1" class="form-control" placeholder="Option 1" >${qnmodel.op1}</textarea> 
                                      
                                        <div id="op1chek" style=display:none;color:red;padding-left:10px;><i><font size="2">please enter the option1 or upload option1Image </font> </i></div>
                                    </div>

                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-option1Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info " style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="option1Img" class="upload-file-input" type="file" onchange="op1changeimg();"  name="option1Img" accept="*" />
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Option 2</label>  
                                        <textarea  id="option2" name="option2" class="form-control" placeholder="Option 2" onblur="checknulop2();" onfocus="op1ChFn();">${qnmodel.op2}</textarea>
                                        <div id="op2" style=display:none;color:red><i><font size="2">please enter the option2 </font> </i></div>
                                   <div id="opt2chek" style=display:none;color:red;padding-left:10px;><i><font size="2">please enter the option2 or upload option2Image </font> </i></div>
                                    </div>

                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-option2Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-xs btn-info" style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="option2Img" class="upload-file-input" type="file" onchange="op2changeimg();" name="option2Img" accept="*" />
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Option 3</label>
                                        <textarea id="option3"  name="option3" class="form-control" placeholder="Option 3" onfocus="op2ChFn()" onblur="checknulop3();" onkeypress="Hidedop3()">${qnmodel.op3}</textarea>
                                        <div id="op3" style=display:none;color:red><i><font size="2">please enter the option3 </font> </i></div>
                                   <div id="op3tchek" style=display:none;color:red;padding-left:10px;><i><font size="2">please enter the option3 or upload option3Image </font> </i></div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-option3Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-xs btn-info" style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="option3Img" class="upload-file-input" type="file" name="option3Img"  onblur="op3ChFn()"onchange="op3changeimg();" accept="*" />
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Option 4</label>
                                          <input type="hidden" id="option5" name="option5" class="form-control"  placeholder="Last Option Value" value="">
                                        <textarea id="option4" name="option4" class="form-control" placeholder="Option 4" onfocus="op3ChFn();">${qnmodel.op4}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-option4Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info" style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="option4Img" class="upload-file-input" type="file" name="option4Img" onchange="op4changeimg();" accept="*" />
                                    </label>
                                </div>
                        
                            </div>
                            </div>
                            
                            <div class="row" id="multpleAnswer" >
                                <div class="col-md-2 ">
                                    <div class="form-group">
                                        <label>Answer</label>

                                        <select onfocus="generateAnswerList()" id="answerMultiple" name="answerMultiple" class="form-control" >
                                            <option disabled="disabled" selected="selected">Select Option</option>
                                            <option disabled="disabled" id="answer1" value="1">1</option>
                                            <option disabled="disabled" id="answer2" value="2">2</option>
                                            <option disabled="disabled" id="answer3" value="3">3</option>
                                            <option disabled="disabled" id="answer4" value="4">4</option>
                                            <option disabled="disabled" id="answer5" value="5">5</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-md-4 ">

                                </div>
                                <div class="col-md-4 ">

                                </div>

                            </div>
                            </c:if>
                           <c:if test="${qnmodel.qn_type ne 'multiple'}">
                            
                             <div class="row" id="answerdesc" >

                                <div class="col-md-10" >
                                    <div class="form-group">
                                        <label>Answer</label>
                                        <textarea id="answerDescrptive" name="answerDescrptive" class="form-control" placeholder="Descrptive Answer" value="" onfocus="QuestionFunction()" onkeypress="HidedQuest()">${qnmodel.answer_Descriptive}</textarea>
                                  
                                    </div>
                                  
                                </div>
                                 <div class="col-md-2"  >
                                    <br>
                                    <span id="upload-file-message-option1Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info " style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="answerImg" class="upload-file-input" type="file" onchange="op1img()" name="answerImg" accept="*" />
                                    </label>
                                </div>
                                  </div>
                             </c:if>
                             <style>
                                                .buttons1 {
												   
												   
	                                           background-color: #04c1a5;
	                                            color: #FFFFFF;
	                                            font-size: 1.0em;
                                                margin-bottom: 5px;
	                                            text-decoration: none;
	                                            position: relative;
	                                          
	                                            border-width: 2px;
											    font-weight: 400;
											  
											    line-height: 1.35em;
											    margin: 5px 1px;
											    border: none;
											    margin: 10px 1px;
											    border-radius: 0.1675rem;
											    padding: 5px 10px;
											    cursor: pointer;
											    width:42%;
                                                }   
                                                 .buttons2 {
											    font-size: 1.0em;
                                               margin-bottom: 5px;
	                                           text-decoration: none;
	                                            position: relative;
	                                           background-color: #ffb236;
	                                            color: #FFFFFF;
	                                            border-width: 2px;
											    font-weight: 400;
											  
											    line-height: 1.35em;
											    margin: 5px 1px;
											    border: none;
											    margin: 10px 1px;
											    border-radius: 0.1675rem;
											    padding: 5px 10px;
											    cursor: pointer;
											    width:42%;
											  
																							    
                                                }   
                                                  
                                                             
                                                
                                                </style>

                            <div class="row">
                                <div class="col-md-12">
                                    <div style="margin-left:720px;">
                                    <!--     <button id="previous"  class="buttons2 ">Previous Question</button>
                                        <button id="next" class="buttons1">Next Question</button>-->  
                                       
                                    </div>
                                   
                                    <div class="form-group" style="margin-left:10px;">
                                       <!--   <button id="addNewQuestion" class="btn btn-primary ">ADD NEW QUESTION</button>-->
                                         <button id="saveandnxt" class="btn btn-primary " >SUBMIT & ADD NEXT QUESTION</button>
                                    </div>
                                    <div class="form-group" style="margin-left:10px;">
                                       
                                    </div>
                                </div>

                            </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

           
        </div>

        </div>
        <footer class="footer">
            <div class="container-fluid">
                <nav>
                    <ul>
                        <li>
                            <a href="#">
                                    TDS
                                </a>
                        </li>

                    </ul>
                </nav>
                <div class="copyright">
                    &copy;
                    <script>
                        document.write(new Date().getFullYear());
                    </script>

                    , Ver 1.0 Beta
                </div>
            </div>
        </footer>
        </div>
        </div>
</body>
<!--   Core JS Files   -->
<script src="assets/js/core/jquery.min.js"></script>
<script src="assets/js/core/popper.min.js"></script>
<script src="assets/js/core/bootstrap.min.js"></script>
<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chart JS -->
<script src="assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
<script src="assets/js/now-ui-dashboard.js?v=1.0.1"></script>
<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/demo/demo.js"></script>
<script src="js/QuestionbankValidate.js"></script> 

<script>
$("#answerMultiple").val("${qnmodel.answer_multiple}");

$("#saveandnxt").click(function() {
	
    updateclass("${qnmodel.questionId}");
});
    function  updateclass(questionId) {
    	
    	
    	
    	var Question=$("#Question").val(); 
	      var Qn_type=$("#Qn_type").val(); 
	      
	      var className=$("#className").val(); 
	      var Section=$("#Section").val();
	      var Difficultylevel=$("#difficultylevel").val();
	      var Time_per_question=$("#timeperQuestion").val();
	      var Op1=$("#option1").val();
	      var Op2=$("#option2").val();
	      var Op3=$("#option3").val();
	      var Op4=$("#option4").val();
	      var Op5=$("#option5").val();
	      var Answer_multiple=document.getElementById("answerMultiple").value;
	      var area=$("#area").val();
	      var Answer_Descriptive=$("#answerDescrptive").val();
	      if(Qn_type!=""&&className!=""&&Section!=""&&difficultylevel!=""&&timeperQuestion!=""&&Question!=""){
    	 
	    	  var url = "/pathTDS/QuestionChange?questionId=" + questionId ;
    	    //var formData = $("#uploadQuestionsupdate").serializeArray();
    	      
    	      
    	      
    	      

    	       $.ajax({
    	        type: "POST",
    	        url: url,
    	        data: {Qn_type:Qn_type,Class_name:className,Section:Section,Question:Question,Difficultylevel:Difficultylevel,Time_per_question:Time_per_question,Op1:Op1,Op2:Op2,Op3:Op3,Op4:Op4,Op5:Op5,Answer_multiple:Answer_multiple,Answer_Descriptive:Answer_Descriptive,area:area}, // serializes the form's elements.
    	      
    	        success: function(data) {
    	         // show response from the php script.
    	         if (data == "sucess") {

    	          alert("Question updated successfully.");
    	          window.location.href = "/pathTDS/editQuestionBank?Qn_type=" + Qn_type+ "&classname=" + className+ "&Createddate=" + ""+ "&qnstatus=" + "";
    	         }
    	        },
    	        error: function(data) {
    	         console.log("error");
    	        }
    	       });
    	       
	      }
	      else{
	    	  alert("please fill fields");
	      }

    } 

    	  
    
</script>


</html>