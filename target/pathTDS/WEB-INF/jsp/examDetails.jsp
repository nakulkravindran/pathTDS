<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <script>
        history.forward();
    </script>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>T&amp;D System</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    <!-- CSS Files -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css2/now-ui-dashboard.css?v=1.0.1" rel="stylesheet" />
    <link href="assets/demo/demo.css" rel="stylesheet" />
</head>

<body style="background:#ced6e0;font-size:12px;color:black;">

    <div class="wrapper ">
        
            <div class="content">
                        <div class="card">
                            <div class="card-header">
                            <div class="row ribbon2">
                             <div class="col-md-12"><h6>Instructions to Candidates</h6> <span style="  color:#fff;font-weight:400;font-size:17px;text-align: left " > Candidate Name: <c:out value="${applicantDetails.candidateName}"/></span></div>
                             
                             </div>
                             <br>
                             <div class="row">
                              <div class="col-md-3">
                             <p style="color:#c0392b;font-weight:400;font-size:17px; class="text-primary">
                             Examination ID - <span style="color:blue;"><c:out value="${examDetails.examId}"/></span>
                             </p>
                             </div>
                             
                             <div class="col-md-3">
                             <p style="color:#c0392b;font-weight:400;font-size:17px; class="text-primary">
                             Exam Name - <span style="color:blue;"><c:out value="${examDetails.examName}"/></span><br>
                             </p>
                             </div>
                            
                             <div class="col-md-3">
                             <p style="color:#c0392b;font-weight:400;font-size:17px; class="text-primary">
                             Exam Duration - <span style="color:blue;"> <c:out value="${examDuration}"/>  Minutes</span>
                             </p>
                             </div>
                             <div class="col-md-3">
                             <p style="color:#c0392b;font-weight:400;font-size:17px; class="text-primary">
                             Exam Date - <span style="color:blue;"><c:out value="${examDetails.examDate}"/></span>
                             </p>
                             </div>
                             
                             </div>
                             <div class="row blockquote">
                                <div class="col-md-12" style="height:480px; overflow-y:auto;" >
                                <p> <b>Dear Candidate,</b> <br>

									Greetings from Path Solutions Corporate Academy. Please read the below given instructions and conditions before starting the exam. Time taken for reading this page will not be counted, time clock will start only when you start the exam. 
									</p>
									<p>
									&nbsp;&nbsp;&nbsp; <b> <span style="color:#000080;"> 1. &nbsp;&nbsp;Check your name, exam name, time allowed etc. displayed above. </span> </b> <br>
									      
									
									
									 &nbsp;&nbsp;&nbsp; <b> <span style="color:#000080;"> 2. &nbsp;&nbsp;Note the buttons and navigation in the exam screen. </span> </b> <br>								
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-2" style="background-color: #808000;"><h6 id="answeredQuestions">Answered</h6></div><div class="col-md-1"></div>
									 <div class="col-md-8">On the left block of the screen will display the question numbers and their status as "Answered", "For Review" and </div>
									 </div>
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-2" style="background-color: #FFFF00;"><h6  id="reviwedQuestions">For Review  </h6></div><div class="col-md-1"></div>
									 <div class="col-md-8">"Unanswered" "Not visited" in different color codes.</div>
									 </div>									
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-2" style="background-color: #FFA500;"><h6  id="unAnsweredQuestions">Un Answered</h6></div><div class="col-md-1"></div>
									 <div class="col-md-8">You can directly access a question by clicking          on the question number, besides using the Previous or Next buttons. </div>
									 </div>
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-2" style="background-color: #C0C0C0;"><h6  id="notVisited">Not Visited</h6></div><div class="col-md-1"></div>
									 <div class="col-md-8">This will help to access the Questions marked for review or some unanswered questions in the middle.</div>
									 </div>
									 <br>
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-8" >* The "Previous" or "Next" buttons will allow you to move backward and forward from one question to the other. </div>
									 <div class="col-md-3"><a class="btn btn-sm btn-info" style="margin-left:30px;" >Previous</a>&emsp;
                                                <a class="btn btn-sm btn-danger">Next</a></div>
									 </div>
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-8" >* "Mark for Review": If you are not sure of the answer marked and wanted to recheck the same before submitting the exam, you can mark is for review by clicking on flag. </div>
									 <div class="col-md-3"><a class="btn btn-sm btn-success" style="margin-left:30px;">Mark for review&emsp;<input type="checkbox"></a></div>
									 </div>
									 <div class="row ">
									 <div class="col-md-1"></div><div class="col-md-8" >* Once you finish the exam you can click the button "End Exam and Submit". Once submitted, you cannot do anything further with the exam, can only exit. </div>
									 <div class="col-md-3"> <a class="btn btn-sm btn-danger" style="margin-left:30px;">End &amp; And Submit Exam</a>  </div>
									 </div>
									 
									
									 &nbsp;&nbsp;&nbsp; <b> <span style="color:#000080;"> 3. Conditions </span> </b> <br>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *You are not allowed to copy the questions, fully or partially, and not expected to disclose the questions to anybody.<br>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *During the exam you should not refer any type of material to answer the questions.<br>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *You will not be provided with the answer sheets of the exam you have attended. Will be informed of the final result only.<br>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *You are expected to adhere to the instructions of the supervisor in charge and ensure discipline during the exam.
                                	<br>
                                	                          	
                                	
                                     <p style="margin-left:20px;"> <b> <span style="color:#000080;"> 4. Other Instructions & Conditions </span> </b> </p> 

                                     
 
                                     <p>
                                        <c:if test="${not empty examDetails.additionalInstructions1}">
                                            <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions1}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions2}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions2}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions3}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions3}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions4}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions4}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions5}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions5}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions6}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions6}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions7}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions7}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions8}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions8}"/></li>
                                        </c:if>
                                        </p><p>
                                        <c:if test="${not empty examDetails.additionalInstructions9}">
                                             <li style="margin-left:20px;"><c:out value="${examDetails.additionalInstructions9}"/></li>
                                        </c:if>
                                     </p>


                                 </div>                                
                                </div>
                            
                                <div class="row">
                                <div class="col-md-6"> <b> <span style="color:#000080;font-size:16px;"> To start exam, first tick the flag "Agree Conditions" and then click button "Start Exam". </span><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#000080;font-size:20px;">"Wish you Good Luck"  </span></b> </div>
                                <div class="col-md-3"> 
		                                <div class="checkbox">
										 <p class="btn btn-lg btn-success"><input id="agreeTnC" type="checkbox" value="" >Agree the Conditions</p>
										</div>
                                </div>
                                <div class="col-md-2">
                                
                                <button disabled="disabled" class="btn btn-lg btn-primary"  id="applicantRegisterButton"> Start Exam </button>
                                </div>
                               	</div>
                                
                            </div>
                    </div>
                   
                </div>
            </div>


            <footer class="footer" style="margin-top:-80px;">
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

     $("#applicantRegisterButton").prop("disabled", true);

    $('#agreeTnC').click(function() {
            if($('#agreeTnC').is(':checked')){
                    $("#applicantRegisterButton").prop("disabled", false);
                }
                else{
                   $("#applicantRegisterButton").prop("disabled", true);
                }
        });

    $("#applicantRegisterButton").click(function(){

        window.location.href="/pathTDS/startExam?examId=${examDetails.examId}";

    }); 

</script>

</html>
