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
    .btn-bs-file{
        position:relative;
    }
    .btn-bs-file input[type="file"]{
        position: absolute;
        top: -9999999;
        filter: alpha(opacity=0);
        opacity: 0;
        width:0;
        height:0;
        outline: none;
        cursor: inherit;
    }
</style>

<body class="">
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
                   
                    <li>
                        <a href="/pathTDS/usermangmnt">
                            <i class="now-ui-icons location_map-big"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                    <li >
                        <a href="/pathTDS/passwordMangement">
                            <i class="now-ui-icons ui-1_lock-circle-open"></i>
                            <p>Password Management</p>
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
                    <li class="active">
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
                    <li >
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
                        <a class="navbar-brand" href="#pablo">USER:<%= session.getAttribute("uname") %></a>
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
                                    <a class="dropdown-item" href="#">Logout</a>

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
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title"> Question Paper Setting</h5>
                            </div>
                            <div class="card-body">
                                     <form id="uploadQuestionsForm">

                                    <div class="row">

                                        <div class="col-md-4 ">
                                             <div class="form-group">
                                                 <label>Question Paper Number</label>
                                                 <input disabled="disabled" list="questionPaperList" autocomplete="off" id="questionPaperNumber" name="questionPaperNumber" class="form-control validate"  placeholder="questionPaperNumber" value="${questionToEdit.questionPaperNumber}" onfocus="MsgFunction()">
                                                 <datalist id="questionPaperList">
                                                    <c:forEach items="${questionPaperList}" var="questionPaperNumber" varStatus="myIndex">
                                                   <option value="${questionPaperNumber}"></option>
                                                   </c:forEach>
                                                 </datalist>
                                             </div>
                                             <div id=qno  style=display:none;color:red; ><i><font size="2">please enter question paper number </i></font></div>
                                         </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Class Name</label>
                                                <input disabled="disabled" type="text" id="className" name="className" class="form-control validate"  placeholder="ClassName" onfocus="Checkqno()"  onkeypress="Hidediv()" value="${questionPaperToEdit.className}">
                                            </div>
                                            <div id=classname style=display:none;color:red ><i><font size="2">please enter class name</font> </i></div>
                                        </div>
                                       <!--   <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Questions </label>
                                                <input disabled="disabled" type="text" id="TotalQuestions" name="TotalQuestions" class="form-control validate"  value="0" readonly>


                                            </div>
                                        </div>-->
                                 <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Score </label>
                                                <input disabled="disabled" type="text" id="TotalScore" name="TotalScore" class="form-control"  value="0" readonly>
                                            </div>
                                        </div>

                                    </div>
                                     <div class="row">

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Pass Percentage</label>
                                                <input disabled="disabled" type="text" id="passPercentage" name="passPercentage" class="form-control"  placeholder="Pass Percentage"  value="${questionPaperToEdit.passPercentage}" onfocus="PassFunction()" onkeypress="Hidepass()" onkeyup="Passmsg()" >
                                             </div>
                                              <div id="pass" style=display:none;color:red ><i><font size="2">please enter pass percentage </font> </i></div>

                                              <div id="passmsg" style=display:none;color:red ><i><font size="2">please pass percentage should not exceed 100</font> </i></div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Time Per Question(secs)</label>
                                                <input disabled="disabled" type="text" id="timePerQuestion"  name="timePerQuestion" class="form-control"  placeholder="Time Per Question" value="" onfocus="TimeFunction()" onkeypress="HideTime()">
                                            </div>
                                            <div id="time" style=display:none;color:red ><i><font size="2">please enter time per question </font> </i></div>
                                        </div>

                                        <!--  <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Time (mts) </label>
                                                <input disabled="disabled" type="text" id="TotalTime" name="TotalTime" class="form-control"  value="0" readonly>
                                            </div>
                                        </div>-->
                                <div class="col-md-4 ">
                                             <div class="form-group">
                                                <label>Maximum Score</label>
                                                <input disabled="disabled" type="text" id="maximumScore"  name="maximumScore" class="form-control"  placeholder="Maximum Score"  onfocus="MaxscoreFunction()"  onkeypress="Hidemaxscore()" value="${questionPaperToEdit.maximumScore}">
                                             </div>
                                             <div id="maxscore" style=display:none;color:red ><i><font size="2">please enter maximum score </font> </i></div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Last Option Value</label>
                                                <input disabled="disabled" type="text" id="option5" name="option5" class="form-control"  placeholder="Last Option Value" value="None of the above">
                                            </div>
                                        </div>


                                        <div class="col-md-4 ">
                                             <div class="form-group">
                                                <label>Score Per Question</label>
                                                <input disabled="disabled" type="text" id="scorePerQuestion"  name="scorePerQuestion" class="form-control"  placeholder="Score Per Question" onfocus="ScoreFunction()" onkeypress="HideScore()" value="">
                                             </div>

                                            <div id="scoreqn" style=display:none;color:red ><i><font size="2">please enter score per question </font> </i></div>
                                         </div>
                                        <div class="col-md-4 ">
                                             <div class="form-group">
                                                <label>No.of Question For Evaluation </label>
                                                <input disabled="disabled" type="text" id="noOfQuestionsForEvaluation"  name="noOfQuestionsForEvaluation" class="form-control"  placeholder="No.of Question For Evaluation"  onfocus="noqestFunction()" onkeypress="Hidenoofquest()" value="${questionPaperToEdit.noOfQuestionsForEvaluation}">
                                             </div>
                                               <div id="noofquest" style=display:none;color:red ><i><font size="2">please enter no of question for evaluvation </font> </i></div>
                                         </div>
                                        


                                    </div>

                                       <div class="row">

                                        <div class="col-md-4 ">
                                              <div class="form-group">
                                                   <label>Section 1</label>
                                                   <input disabled="disabled" type="text" id="section1" name="section1" class="section form-control"  placeholder="Section" value="${questionPaperToEdit.getSection1()}" >
                                              </div>
                                        </div>

                                        <div class="col-md-4 ">
                                              <div class="form-group">
                                                  <label>Section 2</label>
                                                  <input disabled="disabled" type="text" id="section2" name="section2" class="section form-control"  placeholder="Section" value="${questionPaperToEdit.getSection2()}">
                                              </div>
                                        </div>

                                        <div class="col-md-4 ">
                                              <div class="form-group">
                                                  <label>Section 3</label>
                                                  <input disabled="disabled" type="text" id="section3" name="section3" class="section form-control"  placeholder="Section" value="${questionPaperToEdit.getSection3()}">
                                              </div>
                                        </div>
                                    </div>


                                     <div class="row">
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Time Allowed For The Exam(mts)</label>
                                                <input disabled="disabled" type="text" id="totalTimeAllowedForExam" name="totalTimeAllowedForExam" class="form-control"  placeholder="Total Time Allowed For The Exam(mts)" value="${questionPaperToEdit.totalTimeAllowedForExam}" onfocus="TotimeFunction()" onkeypress="HideTotaltime()" >
                                            </div>
                                           <div id="tottimeexam" style=display:none;color:red ><i><font size="2">please enter time allowed for exam(mts) </font> </i></div>
                                        </div>


                                        
                                        



                                    </div>






                                  <!--    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group">
                                                <button id="uploadQuestions" class="btn btn-info btn-block"  >ADD QUESTION</button>
                                            </div>
                                        </div>

                                    </div>-->







                            </div>
                        </div>
                    </div>

                </div>



                <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title"> Question & Answers</h5>
                            </div>
                            <div class="card-body">

                                     <div class="row">
                                        <div class="col-md-3 ">
                                            <div class="form-group">
                                                <label>Time Allowed(sec)</label>
                                                <input type="text" id="timeAlowed" name="timeAlowed" class="form-control"  placeholder="Time Allowed(sec)" value="${questionToEdit.allottedTime}">
                                            </div>
                                        </div>
                                        <div class="col-md-3 ">
                                            <div class="form-group">
                                                <label>Question Score</label>
                                                <input type="text" id="questionScore" name="questionScore" class="form-control"  placeholder="Question Paper Number" value="${questionToEdit.score}">
                                            </div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                               <label>Difficulty Level</label>
                                               <input type="text" id="difficultyLevel" name="difficultyLevel" class="form-control"  placeholder="Question Paper Number"  onfocus="DificultFunction()"  onkeypress="Hidedificult()" value="${questionToEdit.difficultyLevel}">
                                            </div>
                                            

                                        </div>
                                        <div class="col-md-2">
                                             <div class="form-group">
                                                <label>Section</label>
                                                  <!--<input type="text" id="section" name="section" class="form-control" value="" /> -->
                                                <select id="section" name="section" value="" class="btn btn-primary btn-block">
                                                	<option disabled="disabled" selected="selected">Select</option>
                                                    <option id="section1String"></option>
                                                    <option id="section2String"></option>
                                                    <option id="section3String"></option>
                                                 </select> 
                                             </div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Question</label>
                                                <textarea id="Question" name="Question" class="form-control"  placeholder="ClassName"  value="${questionToEdit.question}"  onfocus="QuestionFunction()" onkeypress="HidedQuest()"></textarea>
                                            </div>
                                            <div id="quesn" style=display:none;color:red ><i><font size="2">please enter the question </font> </i></div>

                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <span id="upload-file-message-questionImg" class="alert-success"></span>
                                            <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info" style=color:#fff >
                                                Add Image
                                                 <input style="width:100px" id="questionImg" class="upload-file-input" type="file" name="questionImg" accept="*" />
                                            </label>
                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Option 1</label>
                                                <textarea id="option1" name="option1" class="form-control"  placeholder="Option 1" value="${questionToEdit.option1}" onfocus="option1Function()" onkeypress="Hidedop1()"></textarea>
                                            
                                            </div>
                                            
                                            
                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <span id="upload-file-message-option1Img"  class="alert-success"></span>
                                            <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info "style=color:#fff  >
                                            Add Image
                                                <input style="width:100px" id="option1Img" class="upload-file-input" type="file" onchange="op1img();"  name="option1Img" accept="*" />
                                            </label>
                                        </div>


                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Option 2</label>
                                                <textarea id="option2" name="option2" class="form-control"  placeholder="Option 2"  onfocus="option1Function()"  value="${questionToEdit.option2}"></textarea>
                                            </div>
                                             
                                            
                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <span id="upload-file-message-option2Img" class="alert-success"></span>
                                            <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-xs btn-info" style=color:#fff>
                                            Add Image
                                                <input style="width:100px" id="option2Img" class="upload-file-input" type="file" onchange="op2img();" name="option2Img" accept="*" />
                                            </label>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Option 3</label>
                                                <textarea id="option3" name="option3" class="form-control"  placeholder="Option 3" onfocus="option1Function()"  value="${questionToEdit.option3}"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <span id="upload-file-message-option3Img" class="alert-success"></span>
                                            <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-xs btn-info" style=color:#fff>
                                            Add Image
                                               <input style="width:100px" id="option3Img" class="upload-file-input" type="file" name="option3Img" onchange="op3img();" accept="*" />
                                            </label>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="form-group">
                                                <label>Option 4</label>
                                                <textarea id="option4" name="option4" class="form-control"  placeholder="Option 2" onfocus="option1Function()" value="${questionToEdit.option4}"></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <br>
                                            <span id="upload-file-message-option4Img" class="alert-success"></span>
                                            <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info" style=color:#fff >
                                            Add Image
                                               <input style="width:100px" id="option4Img" class="upload-file-input" type="file" name="option4Img"  onchange="op4img();"accept="*" />
                                            </label>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="col-md-2 ">
                                            <div class="form-group">
                                                <label>Answer</label>

                                           <!--  <select onfocus="generateAnswerList()" id="Answer" value="" name="Answer" class="form-control">
                                            <option disabled="disabled" selected="selected">Select Option</option>
                                            <option disabled="disabled" id="answer1" value="1">1</option>
                                            <option disabled="disabled" id="answer2" value="2">2</option>
                                            <option disabled="disabled" id="answer3" value="3">3</option>
                                            <option disabled="disabled" id="answer4" value="4">4</option>
                                            <option disabled="disabled" id="answer5" value="5">5</option>
                                        </select>-->
                                                <input type="text" id="Answer" name="Answer" class="form-control" value="" />
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-4 ">

                                        </div>
                                        <div class="col-md-4 ">

                                        </div>


                                    </div>




                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button id="editQuestionButton" class="btn btn-primary "   >SAVE & ADD NEXT QUESTION</button>
                                            </div>
                                        </div>

                                    </div>


                               </form>



                            </div>


                        </div>

                    </div>

                </div>




            <!--  <div class="col-md-12">
                        <div class="card">

                            <div class="card-body">
                                <form id="uploadQuestionsForm2">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button id="SubmitQuestionPaper" class="btn btn-info btn-block"    >SUBMIT QUESTION PAPER</button>
                                            </div>
                                        </div>
                                    </div>




                                </form>



                            </div>
                        </div>
                    </div>  -->

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
<script src="js/uploadquesHelper.js"></script>
<script src="js/uploadquestionValidater.js"></script>

<script>



 
 $("#timePerQuestion").val("${questionToEdit.getAllottedTime()}");
 $("#scorePerQuestion").val("${questionToEdit.getScore()}");
 $("#TotalScore").val("${questionPaperToEdit.getMaximumScore()}");
 
    $("#section1").val("${questionPaperToEdit.getSection1()}");
    $("#section2").val("${questionPaperToEdit.getSection2()}");
    $("#section3").val("${questionPaperToEdit.getSection3()}");

    $("#section1String").text("${questionPaperToEdit.getSection1()}");
    $("#section2String").text("${questionPaperToEdit.getSection2()}");
    $("#section3String").text("${questionPaperToEdit.getSection3()}");

    $("#Question").text("${questionToEdit.question}");
    $("#option1").text("${questionToEdit.option1}");
    $("#option2").text("${questionToEdit.option2}");
    $("#option3").text("${questionToEdit.option3}");
    $("#option4").text("${questionToEdit.option4}");
    $("#section3").val("${questionPaperToEdit.getSection3()}");

    $("#Answer").val("${questionToEdit.getCorrectAnswer()}");
    $("#section").val("${questionToEdit.getSection()}");
    //$("#questionImg").val("${questionToEdit.getQuestionImg()}");
   // $("#option1Img").val("${questionToEdit.getOptionImg1()}");
    
    
</script>
</html>
