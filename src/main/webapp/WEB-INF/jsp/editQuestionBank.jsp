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
                    <div class="card"  style="height: auto;">
                    <div class="ribbon4">
                    <div class="row">
                    <div class="col-md-4">
                    <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                    <a href="/pathTDS/Questionsbank" class="btn btn-sm btn-info">Question Bank</a>
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
                    <div >
                     <div>
                      <div class="card-header">

                       <div id="headding"> <p class="ribbon2" style="height: 50px; padding-top:15px;" >

                          View/Edit QuestionBank<hr>
                            </p></div>

                            <br>
                             
                             <div class="row " style="margin-top: -1vw">
                                <div class="col-md-3" >
                                    <div class="form-group">  
                                            <label><b>Question Type</b></label>
                                            <input list="questionPaperNumberList"  autocomplete="off"  id="questionPaperNumberview" name="questionPaperNumberview" value="" class="form-control col-md-8" onblur="qusnValidate();" placeholder="Type">
                                            <datalist id="questionPaperNumberList">                                                
                                                   <option value="multiple"></option>
                                                   <option value="descriptive"></option>
                                                   <option value="both"></option>                                       
                                            </datalist>                                            
                                        </div>
                                 </div>                                
                                 <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Class Name</b></label>
                                        <input list="qnclass"  autocomplete="off"  id="class" name="class"  class="form-control col-md-8" value="" placeholder="Class">
                                           <datalist id="qnclass">
                                                  <c:forEach items="${qnclass}" var="qnclass" >
                                                    <c:if test="${qnclass.prm_type eq 'class'}">
                                                       
                                                    	<option value="${qnclass.prm_shortname}">${qnclass.prm_name}</option>                                                       
                                                     
                                                     </c:if>
                                                  </c:forEach>
                                           </datalist>                                      
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <label><b>Status</b></label>
                                        <input list="status"  autocomplete="off"  id="qnstatus" name="qnstatus" value="" class="form-control col-md-8" onblur="qusnValidate();" placeholder="Status">
                                            <datalist id="status">                                                   
                                                   <option value="active"></option>
                                                   <option value="deleted"></option>
                                                   <option value="both" ></option>                                                
                                            </datalist>
                                             
                                      
                                    </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Area</b></label>
                                        <input type="text"  id="area" name="area" value="" class="form-control col-md-8" placeholder="Area">
                                                             
                                    </div>
                                </div>
                              </div>  
                              <div class="row " style="padding-top:5px;">  
                                <div class="col-md-3"  >
                                    <div class="form-group">
                                       <label><b>Date From:</b></label>                                    
                                       <input id="frmDate" name="frmDate" type="Date" class="form-control col-md-8" placeholder="Date From"   value="">
                                    </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>To Date:</b></label>                                    
                                       <input id="toDate" name="toDate" type="Date" class="form-control col-md-8" placeholder="To Date"   value="">
                                    </div>
                                </div>
                                <div class="col-md-3"  >
                                    <div class="form-group">
                                       <label><b>Question ID From:</b></label>                                    
                                       <input list="qnList1"  autocomplete="off"  id="qnNumber1" name="qnNumber1" value="" class="form-control col-md-8"  placeholder="Question ID From">
                                            <datalist id="qnList1">
                                                <c:forEach items="${questionsAllList}" var="qn1" varStatus="myIndex">
                                                   <option value="${qn1.getQuestionId()}"></option>                                                  
                                                </c:forEach>
                                            </datalist> 
                                     </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>To Question ID:</b></label>                                    
                                       <input list="qnList2"  autocomplete="off"  id="qnNumber2" name="qnNumber2" value="" class="form-control col-md-8"  placeholder="To Question ID">
                                            <datalist id="qnList2">
                                                <c:forEach items="${questionsAllList}" var="qn2" varStatus="myIndex">
                                                   <option value="${qn2.getQuestionId()}"></option>                                                  
                                                </c:forEach>
                                            </datalist> 
                                     </div>
                                </div>
                              </div> 
                               <div class="row " style="margin-top: -1vw">                                  
                                <div class="col-md-6"><span id="errDt" style="color: red;font-weight: bold;"></span></div>
                                <div class="col-md-6"><span id="errQn" style="color: red;font-weight: bold;"></span></div>
                               </div> 
                              <br/>
                              <div class="row " style="margin-top:5px;">                                  
                                <div class="col-md-3"></div>
                                    <div class="form-group col-md-6" style="text-align: center;">
                                        <button type="button"  name="search" id="search" class="btn btn-primary col-md-3">Search</button>
                                    </div>
                                <div class="col-md-3"></div>                               
                             </div>
                             <br/>                 
 
                            
                            </div><hr style="margin-top: -1vw" class="ribbon2" id="hr1" >
                            </div>
                           
                            <div class="card-body"  id="printarea">
                              <div class="container-fuid">
                            
                                <c:forEach items="${questionsList}" var="question" varStatus="count">
                           
                                    <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group" >
                                          <p style="text-align: left ;align : justify; font-weight:510;line-height: 1.3; white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${count.index + 1}. "/> <span style="color: red">Q: </span>&nbsp;
                                       <c:out value="${question.question}"/>
                                        
                                          </p>
                                          <img class="img img-responsive" src="${question.questionImg}" />
                                       	</div>
                                        </div>
                                      <div class="col-md-4">
                                      <div class="row">
                                       <div class="col-md-2" id="qnid">
                                         <div class="form-group">
                                           <p>
                                             <label>QnId</label>
                                           <br><c:out value="${question.questionId}"/>
                                           </p>
                                         </div>
                                      </div>
                                      <div class="col-md-3" id="type" style=" margin-left:5px;">
                                         <div class="form-group">
                                           <p>
                                             <label>Qn Type</label>
                                           <c:out value="${question.qn_type}"/>
                                           </p>
                                         </div>
                                      </div>
                                      <div class="col-md-2" id="classname">
                                         <div class="form-group">
                                           <p>
                                             <label>Class</label><br>
                                           <c:out value="${question.class_name}"/>
                                           </p>
                                         </div>
                                      </div>
                                      <div class="col-md-2" id="time">
                                        <div class="form-group">
                                          <p><label>Time(S) </label>
                                          <c:out value="${question.time_per_question}"/></p>
                                        </div>
                                      </div>
                                      
                                      
                                      
                                      
                                      
                                      
                                        <div class="col-md-3" id="section">
                                         <div class="form-group">
                                           <p>
                                             <label>Section</label><br>
                                             <c:out value="${question.section}"/>
                                           </p>
                                         </div>
                                      </div>
                                      <c:if test="${question.qn_type eq 'multiple'}"> 
                                      <div class="col-md-2" id="answer">
                                         <div class="form-group">
                                           <p>
                                             <label>Answer</label>
                                           <c:out value="${question.answer_multiple}"/>
                                           </p>
                                         </div>
                                      </div>
                                      
                                      </c:if>
                                     
                                     <div class="col-md-2" id="time" >
                                        <div class="form-group">
                                          <!--  <a href="/pathTDS/updateQuestion?questionId=${question.questionId}">Edit</a> -->
                                        <c:if test="${question.status ne 'ACTIVE' && question.status ne 'Deleted'}">
                                        <button onclick='editButtonClick("${question.questionId}")' class="btn btn-info btn-sm enableOnInput" id="editButton">Edit</button>
                                         </c:if>
                                        </div>
                                      </div>
                                      
                                      <div class="col-md-2" id="time" >
                                        <div class="form-group handle">
                                          <!--  <a href="/pathTDS/updateQuestion?questionId=${question.questionId}">Edit</a> -->
                                       <c:if test="${question.status ne 'Deleted'}">   
                                        <button onclick='deleteButtonClick("${question.questionId}")' class="btn btn-danger btn-sm disableOnInput" id="deleteButton">Delete</button>
                                        </c:if>   
                                        </div>
                                      </div>
                                      <div class="col-md-2">
                                        <div class="form-group">

                                         

                                        </div>
                                <style type="text/css">
                 @media print {
                 
                 
                   
                  #deleteButton {
                   display: none;
                  }
                  
                  
                   #editButton {
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

                 #qnid{
                  display: inline-block;
                  padding: 40px;
                   font-size: 20px;
                  list-style-type: none;
                 text-align: center;
                 margin-top: 0px;
                 line-height: 1.1;
                  padding-bottom:5px;
                  }
                  #type{
                   display: inline-block;
                    padding: 20px;
                  font-size: 24px;
                   list-style-type: none;
                   text-align: center;
                     line-height: 1.0;
                     padding-bottom:5px;
                  }
                  #classname{
                  display: inline-block;
                   padding: 20px;
                   font-size: 24px;
                   list-style-type: none;
                   text-align: center;
               line-height: 1.0;
               padding-bottom:5px;
                  }
                  #status{
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
                                    <c:if test="${question.qn_type eq 'multiple'}"> 
                                   <div>
                                      <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op1: </span> &nbsp;&nbsp;&nbsp;
                                   		 <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${question.op1}"/> </span>
                                   		</p>
                                   		 <img class="img img-responsive" src="${question.optionImg1 }"></img>
                                         </div>
                                         
                                    </div>
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op2: </span> &nbsp;&nbsp;&nbsp;
                                   		   <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${question.op2}"/></span>
                                   		 </p>
                                   		 <img class="img img-responsive"  src="${question.optionImg2}"></img>
                                         </div>
                                         
                                    </div>
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op3: </span> &nbsp;&nbsp;&nbsp;
                                   		    <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${question.op3}"/></span>
                                   		 </p>
                                   		 <img class="img img-responsive" src="${question.optionImg3}"></img>
                                         </div>
                                         
                                    </div>
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: red">Op4: </span> &nbsp;&nbsp;&nbsp;
                                   		    <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${question.op4}"/></span>
                                   		</p>
                                   		  <img class="img img-responsive" src="${question.optionImg4}"></img>
                                         </div>
                                       
                                    </div>

                                    <div class="row">
                                    <div class="col-md-4">
                                      <div class="form-group">

                                          <p style="align : justify;"><span style="color: red">Op5: </span> &nbsp;&nbsp;&nbsp;
                                          <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${question.op5}"/></span>
                                          </p>

                                      </div>
                                    </div>
                                   </div>
                                   </div>
                                   </c:if>
                                    <c:if test="${question.qn_type eq 'descriptive'}">
                                    <div class="row">
                                    <div class="col-md-9">
                                        <p style="align : justify;"><span style="color: black">Answer: </span> &nbsp;&nbsp;&nbsp;
                                   		<c:out value="${question.answer_Descriptive}"/></p>
                                   		 
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
               
                  function myFunction(){
                	 var qntype = $("#questionPaperNumberview").val();
                	 
                     var classname=$("#class").val();
                  var Createddate=$("#Date").val();
                  var qnstatus=$("#qnstatus").val();
                	window.location.href = "/pathTDS/editQuestionBank?Qn_type=" + qntype+ "&classname=" + classname+ "&Createddate=" + Createddate+ "&qnstatus=" + qnstatus;
                
                  }
                   
                    

            
                 
                 </script>
                 <script>
                    function deleteButtonClick(questionId){
                        var retVal = confirm("Are you sure to delete this question ?. Click 'OK' to confirm.");
                       if(retVal == true){
                    	  
                    	   
                         window.location.href = "/pathTDS/deleteQuestionBank?questionId=" + questionId ;
                       alert("sucessfully deleted ")
                       }
                    }
                </script>
                <script>
                    function editButtonClick(questionId){
                    	window.location.href="/pathTDS/QuestionbankUpdate?questionId=" + questionId ;
                       
                    }
                </script>
              <!--    <style>
                 textarea {
  margin:0px 0px;
  padding:5px;
  height:20px;
  line-height:16px;
  width:96%;
  display:block;
  margin:0px auto;    
}
                 </style> -->
              <script>
             /* function expandTextarea(id) {
            	    document.getElementById(id).addEventListener('keyup', function() {
            	        this.style.overflow = 'hidden';
            	        this.style.height = 10;
            	        this.style.height = this.scrollHeight + 'px';
            	    }, false);
            	}

            	expandTextarea('txtarea');*/
              </script>
              
                <script>
                
                $( document ).ready(function() {
               	 $("#errDt").text('');
               	 $("#errQn").text('');
               	 $("#search").click(function(e){                		
               		 var qntype = $("#questionPaperNumberview").val();
                        var classname=$("#class").val();                        
                        var qnstatus=$("#qnstatus").val();                		
                        var area=$("#area").val();
                        var frmdate=$("#frmDate").val();
                        var todate=$("#toDate").val();
                        var qn1=$("#qnNumber1").val();
                        var qn2=$("#qnNumber2").val();
                         window.location.href = "/pathTDS/editQuestionBank?Qn_type=" + qntype+ "&classname=" + classname+  "&qnstatus=" +  qnstatus + "&area=" +area +"&frmdate="+frmdate+"&todate="+todate+"&frmqn="+qn1+"&toqn="+qn2;   
               	 });
                });
                
                function printQuestions() {
                	 var toPrint = document.getElementById('printarea');
                     var popupWin = window.open('', '_blank', 'width=2480,height=3508');
                    popupWin.document.open();

                   // popupWin.document.write("<br>");
                    popupWin.document.write("<p style=text-align:center;font-size:30><b>QuestionBank</b></p>");
                   
                    popupWin.document.write("<hr></hr>");
                    popupWin.document.write('<html><head><link rel="stylesheet" type="text/css" href="css/style.print.css"></head><body onload="window.print()" ><div id="pwrap" style=font-size:18;line-height: 0.5;>' +toPrint .innerHTML + '</div>');

                    popupWin.document.write('</body></html>');
                   popupWin.document.close();
                }
                </script>
                
                
              </html>
