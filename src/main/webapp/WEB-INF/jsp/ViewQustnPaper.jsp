<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" /><%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
       
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
      <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>TDS</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
          <!-- CSS Files -->
          <link href="assets/css2/bootstrap.min.css" rel="stylesheet" />
          <link href="assets/css2/now-ui-dashboard.css?v=1.0.1" rel="stylesheet" />
          <!-- CSS Just for demo purpose, don't include it in your project -->
          <link href="assets/demo/demo.css" rel="stylesheet" />
        </head>
        <body>
        <% 
response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server 
%>
            <div class="container-fluid">
              <!-- End Navbar -->
              
              <div class="panel-header panel-header-sm">
          
              </div>
              <div class="content">
              
                <div class="row" >
                  <div class="col-md-12">
                    <div class="card">
                    <div class="ribbon4">
                    <div class="row">
                    <div class="col-md-4">
                    <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                    <a href="/pathTDS/manageQuestions" class="btn btn-sm btn-info">Questions</a>
                    <button class="btn btn-sm btn-info" id="printButton" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button>
                 
                       
                                   
                            
                    </div>
                    <div class="col-md-7">
                       
                    </div>
                    <div class="col-md-1"><br>
                        
                     <a   href="/pathTDS/logout"><font color="white">Logout</font></a>
                    
                      </div>
                    </div>
                    <!-- <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                    <a href="/manageQuestions" class="btn btn-sm btn-info">Questions</a>
                    <button class="btn btn-sm btn-danger" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button> -->
                    </div>
                    <div id="printarea">
                     <div>
                      <div class="card-header">

                       <div id="headding">
                          <p class="ribbon2" style="height: 50px; padding-top:15px;" >

                          View Question paper<hr>
                            </p> </div>

                             
                            <div class="row" id="hederDetails">
                                <div class="col-md-2" id="qestnno">
                                    <div class="form-group">
                                       <h5 >
                                       <label><b> Qn Paper Number</b></label><br>
                                       <c:out value="${questionpapermodel.getQuestionpaperid()}"/>
                                       </h5>
                                    </div>
                                </div>
                                 <div class="col-md-2" id="class">
                                    <div class="form-group">
                                      <h5>
                                        <label><b>Class Name</b></label><br>
                                        <c:out value="${questionpapermodel.getclassname()}"/> 
                                      </h5>
                                    </div>
                                </div>
                                <div class="col-md-2" id="maxscre">
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Maximum Score</b></label><br>
                                       <c:out value="${questionpapermodel.getMaximum_score()}"/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-2" id="maxtime">
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Maximum Time(Min)</b></label><br>
                                       <c:out value="${questionpapermodel.getTotal_time_allowed()}"/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-2" id="maxtime">  
                                    <div class="form-group">
                                       <h5>
                                       <label><b>No.of Questions</b></label><br>
                                        <c:out value="${questionpapermodel.getNo_of_question_for_evaluation()}"/>
                                        
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-2" id="maxtime">  
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Total Score</b></label><br>
                                        <c:out value="${questionpapermodel.getTotal_score()}"/>
                                        
                                       </h5>
                                    </div>
                                </div>
                            </div>
                            </div>
                             <br>
                             <hr class="ribbon2" id="hr1"> 
                             <input type="hidden" id="clchk" value="${classChk}">
                             <input type="hidden" id="dupchk" value="${dup}"> 
                             <input type="hidden" id="exstChk" value="${exst}"> 
                            <div class="row" style="text-align:center;">
                                <div class="col-md-2">
                                       <label><b>Question Paper Number</b></label>
                                </div>
                                <div class="col-md-3">
                                        <div class="form-group" id="questBankList">                                           
                                            <input list="QuestnpaperList"  autocomplete="off"  id="questionBankAddNumber" name="questionBankAddNumber"  value="" class="form-control col-md-4"  placeholder="Question Bank Number" maxlength="10">
                                            <datalist id="QuestnpaperList">
                                                <c:forEach items="${QuestnpaperList}" var="questionbankNum" >
                                                   <option value="${questionbankNum.questionpaperid}"> ${questionbankNum.questionpaperid} - ${questionbankNum.classname}</option>                                                  
                                                </c:forEach>                                                
                                            </datalist>
                                             <div id=qnErr style=display:none;color:red ><i><font size="2">You must enter a valid question number</font> </i></div>
                                      </div>
                                </div>
                                
                                <div class="col-md-3">                                    
                                     <input type="hidden" id="score" name="score" class="form-control col-md-4" placeholder="Score" value="" maxlength="10" >
                                     <div id=scErr style=display:none;color:red ><i><font size="2">You must enter a number.</font> </i></div>
                                </div>
                                <div class="col-md-2">
                                    <button hidden onclick='addQnButtonClick("${questionpapermodel.getQuestionpaperid()}")' class="btn btn-info btn-sm enableOnInput col-md-4" id="addQnButton">Add</button>
                                        
                                </div>
                            </div>
                            
                             <hr class="ribbon2" id="hr1">
                            </div>
                           
                            <div class="card-body" >
                              <div class="container-fuid">
                            
                                <c:forEach items="${questionbankList}" var="question" varStatus="count">

                                    <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group" >
                                          <p style="text-align: left ;align : justify; font-weight:510;line-height: 1.3;"> 
                                            <c:out value="${count.index + 1}. "/> <%-- <c:out value="${question.getQuestionId()}"/> --%> <span style="color: red">Q: </span>&nbsp;
                                            <b><c:out value="${question.getQuestion()}"/></b>
                                          </p>
                                          <img class="img img-responsive" src="${question.getQuestionImg()}" />
                                       	</div>
                                        </div>
                                      <div class="col-md-4">
                                      <div class="row">
                                      
                                       <div class="col-md-2" id="section">
                                         <div class="form-group">
                                           <p>
                                             <label><b>QnId</b></label><br>
                                             <c:out value="${question.getQuestionId()}"/>
                                           </p>
                                         </div>
                                      </div>
                                      
                                      
                                        <div class="col-md-2" id="section">
                                         <div class="form-group">
                                           <p>
                                             <label><b>Section</b></label><br>
                                             <c:out value="${question.getSection()}"/>
                                           </p>
                                         </div>
                                      </div>
                                     
                                      
                                      <div class="col-md-2" id="time">
                                        <div class="form-group">
                                          <p><label><b>Time(S)</b> </label><br>
                                          <c:out value="${question.getTime_per_question()}"/></p>
                                        </div>
                                      </div>
                                     
                                      <c:forEach items="${questionpaperQn}" var="qn">
                                         <c:if test="${qn.getquestionpaperid() == questionpapermodel.getQuestionpaperid()  && (qn.getQuestionbankid() == question.getQuestionId())}"> 
                                            
                                      <div class="col-md-2" id="score">
                                        <div class="form-group">
                                          <p><label><b>Score</b></label>  <br>                                        
                                             <c:out value="${qn.getScoreperquestion()}" /> 
                                             
                                        </div>
                                      </div>
                                       <div class="col-md-2" id="answer">
                                         <div class="form-group">
                                           <p>
                                            <c:if test="${question.getQn_type() eq 'multiple'}">
                                             <label><b>Answer</b></label><br>
                                            
                                                 <c:out value="${question.getAnswer_multiple()}"/>
                                             </c:if>
                                             
                                           
                                           </p>
                                         </div>
                                      </div>
                                      
                                      <div class="col-md-2" >
                                        <div class="form-group">
                                           <button onclick='deleteQnButtonClick("${qn.getquestionpaperqnid()}", "${qn.getScoreperquestion()}","${questionpapermodel.getQuestionpaperid()}")' class="btn btn-danger btn-sm disableOnInput " id="deleteQnButton">Delete</button>
                                        </div>
                                       </div>
                                       
                                       </c:if>
                                     </c:forEach>
                                      <div class="col-md-2">
                                        <div class="form-group">

                                         

                                        </div>
                                <style type="text/css">
                 @media print {
                 
                 
                   
                  #deleteButton {
                   display: none;
                  }
                  #hr1{
                   display: none;
                  }
                  
                   div {

      margin-top: -11px;
      margin-bottom: -11px;
      padding-left: 1px;


         }

                  #questNumList{
                  display: none;
                  }
                  #headding{
                   display: none;
                  }

                 #qestnno{
                  display: inline-block;
                  padding: 20px;
                   font-size: 24px;
                  list-style-type: none;
                 text-align: center;
                 margin-top: 0px;
                 line-height: 1.1;
                  padding-bottom:5px;
                  }
                  #class{
                   display: inline-block;
                    padding: 20px;
                  font-size: 24px;
                   list-style-type: none;
                   text-align: center;
                     line-height: 1.0;
                     padding-bottom:5px;
                  }
                  #maxscre{
                  display: inline-block;
                   padding: 20px;
                   font-size: 24px;
                   list-style-type: none;
                   text-align: center;
               line-height: 1.0;
               padding-bottom:5px;
                  }
                  #maxtime{
                  display: inline-block;
                   padding: 20px;
                  font-size: 24px;
                   list-style-type: none;
                   text-align: center;
                    line-height: 1.0;
                     padding-bottom:5px;
                  }
                  #section{
                   display: inline-block;

                  padding: 15px;
                  font-size: 20px;
                  text-align:center;
                   line-height: 1.0;
                  }
                  #answer{
                  display: inline-block;
                   padding: 15px;
                  font-size: 20px;
                  text-align:center;
                   line-height: 1.0;
                  }
                  #score{
                  display: inline-block;
                   padding: 15px;
                  font-size: 20px;
                  text-align:center;
                   line-height: 1.0;
                  }
                  #time{
                  display: inline-block;
                   padding: 15px;
                  font-size: 20px;
                 text-align:center;
                  line-height: 1.0;
                  }

                }
                </style>
                                      </div>
                                      </div>
                                    </div>
                                   </div>
                                   <c:if test="${question.getQn_type() eq 'multiple'}">
                                    
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op1: </span> &nbsp;&nbsp;&nbsp;
                                   		<c:out value="${question.getOp1()}"/> </p>
                                   		 <img class="img img-responsive" src="${question.getOptionImg1() }"></img>
                                         </div>
                                         <!--  <div class="col-md-3" >
                                          <img class="img img-responsive" src="${question.optionImg1 }"></img>
                                        </div>-->
                                    </div>
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op2: </span> &nbsp;&nbsp;&nbsp;
                                   		<c:out value="${question.getOp2()}"/> </p>
                                   		 <img class="img img-responsive"  src="${question.getOptionImg2()}"></img>
                                         </div>
                                          <!-- <div class="col-md-3">
                                          <img class="img img-responsive"  src="${question.optionImg2}"></img>
                                        </div>-->
                                    </div>
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op3: </span> &nbsp;&nbsp;&nbsp;
                                   		<c:out value="${question.getOp3()}"/> </p>
                                   		 <img class="img img-responsive" src="${question.getOptionImg3()}"></img>
                                         </div>
                                         <!-- <div class="col-md-3" align="left">
                                          <img class="img img-responsive" src="${question.optionImg3}"></img>
                                        </div> -->
                                    </div>
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op4: </span> &nbsp;&nbsp;&nbsp;
                                   		<c:out value="${question.getOp4()}"/></p>
                                   		  <img class="img img-responsive" src="${question.getOptionImg4()}"></img>
                                         </div>
                                        <!-- <div class="col-md-3" align="left">
                                          <img class="img img-responsive"align="left" src="${question.optionImg4}"></img>
                                        </div> --> 
                                    </div>

                                    <div class="row">
                                    <div class="col-md-4">
                                      <div class="form-group">

                                          <p style="align : justify;"><span style="color: red">Op5: </span> &nbsp;&nbsp;&nbsp;
                                          <c:out value="${question.getOp5()}"/></p>

                                      </div>
                                    </div>
                                   </div>
                                    </c:if>
                                    
                                    
                                      <c:if test="${question.getQn_type() eq 'descriptive'}">
                                    <div class="row">
                                    <div class="col-md-9">
                                       <!--   <p style="align : justify;"><span style="color: black">Answer: </span> &nbsp;&nbsp;&nbsp;
                                   		<c:out value="${question.answer_Descriptive}"/></p>-->
                                   		<b>Answer:</b> <span style="white-space:pre;overflow-wrap:break-all;line-height: 2.3"><c:out value="${question.getAnswer_Descriptive()}"/></span>
                                         </div>
                                       
                                    </div>
                                    </c:if>
                                    <hr id="hr2">
                                </c:forEach>
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

                
                 <script>
                $("#questionBankAddNumber").change(function(){
               
                	 var questionPaperNumber=$("#questionBankAddNumber").val();
                	 //alert(questionPaperNumber);
                	 window.location.href="/pathTDS/ViewQustns?questionPaperNumber=" + questionPaperNumber ;
                });
                
                </script>
               



                <script>
                $(document).ready(function(){
                	$("#qnErr").hide();
                	$("#scErr").hide();
                	var clkstr=$("#clchk").val();
                	if(clkstr=="true"){
                		alert("Please select a question of same class.");
                	}
                	var dupStr=$("#dupchk").val();
                    if(dupStr=="true"){
                       alert("The question paper has this question. Select another question.");
                    }
                    var exstStr=$("#exstChk").val();
                    if(exstStr=="true"){
                       alert("Please check the correct question number.");
                    }
                });
                function printQuestions() {
                	 var toPrint = document.getElementById('printarea');
                     var popupWin = window.open('', '_blank', 'width=2480,height=3508');
                    popupWin.document.open();

                   // popupWin.document.write("<br>");
                    popupWin.document.write("<p style=text-align:center;font-size:30><b>Questions & Answers</b></p>");
                   
                    popupWin.document.write("<hr></hr>");
                    popupWin.document.write('<html><head><link rel="stylesheet" type="text/css" href="css/style.print.css"></head><body onload="window.print()" ><div id="pwrap" style=font-size:18;line-height: 0.5;>' +toPrint .innerHTML + '</div>');

                    popupWin.document.write('</body></html>');
                    popupWin.document.close();
                }
                
                function deleteQnButtonClick(questionPaperQnID,scoreVal,questionPaperNum){
                    var retVal = confirm("Are you sure to delete this question ?. Click 'OK' to confirm.");
                    if(retVal == true){                    	
                    	var delStr="delete";
                        window.location.href = "/pathTDS/QuestionPaperView?actionStr="+delStr+ "&" +"qnID=" + questionPaperQnID + "&" + "score="+scoreVal+"&" +"questionPaperNumber=" + questionPaperNum;
                    }
                }
            
                function addQnButtonClick(questionPaperNum){
                	$("#qnErr").hide();
                	$("#scErr").hide();
                	var adStr="add";
                	var questionBankAddNum=document.getElementById('questionBankAddNumber').value;
                	var scoreVal=document.getElementById('score').value;                
                	if(!isNaN(parseInt(questionBankAddNum)&&!isNaN(parseInt(scoreVal)))){
                	  window.location.href = "/pathTDS/QuestionPaperView?actionStr="+adStr+ "&" +"qnID=" + questionBankAddNum + "&" +"score="+scoreVal+"&" +"questionPaperNumber=" + questionPaperNum;
                	}
                	else if(isNaN(parseInt(questionBankAddNum)&&isNaN(parseInt(scoreVal)))){$("#qnErr").show();$("#scErr").show();}
                	else if(isNaN(parseInt(questionBankAddNum))){$("#qnErr").show();}
                	else if(isNaN(parseInt(scoreVal))){$("#scErr").show();}
                }
                
                </script>
              </html>
