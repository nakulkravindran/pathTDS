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
                                                <input list="questionPaperList" autocomplete="off" id="questionPaperNumber" name="questionPaperNumber" class="form-control validate" placeholder="questionPaperNumber" value=""  onfocus="MsgFunction()">
                                                <datalist id="questionPaperList">
                                                    <c:forEach items="${questionPaperList}" var="questionPaperNumber" varStatus="myIndex">
                                                        <option value="${questionPaperNumber}"></option>
                                                    </c:forEach>
                                                </datalist>
                                                 
                                            </div>
                                            
                                            <div id=qno style=display:none;color:red;><i><font size="2">please enter question paper number</font> </i></div>
                                            <div id=cnte style=color:red;><i><font size="2">please enter question paper number</font> </i></div>
                                            
                                            
                                            
                                             
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Class Name</label>
                                                <input type="text" id="className" name="className" class="form-control validate" placeholder="ClassName" onfocus="Checkqno()" onkeypress="Hidediv()" value="">
                                            </div>
                                            <div id=classname style=display:none;color:red><i><font size="2">please enter class name</font> </i></div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Questions </label>
                                                <input type="text" id="TotalQuestions" name="TotalQuestions" class="form-control validate" value="0" readonly>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="row">

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Pass Percentage</label>
                                                <input type="text" id="passPercentage" name="passPercentage" class="form-control" placeholder="Pass Percentage" value="" onfocus="PassFunction()" onkeypress="Hidepass()" onkeyup="Passmsg()">
                                            </div>
                                            <div id="pass" style=display:none;color:red><i><font size="2">please enter pass percentage </font> </i></div>

                                            <div id="passmsg" style=display:none;color:red><i><font size="2">please pass percentage should not exceed 100</font> </i></div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Time Per Question(secs)</label>
                                                <input type="text" id="timePerQuestion" name="timePerQuestion" class="form-control" placeholder="Time Per Question" value="" onfocus="TimeFunction()" onkeypress="HideTime()">
                                            </div>
                                            <div id="time" style=display:none;color:red><i><font size="2">please enter time per question </font> </i></div>
                                        </div>

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Time (Sec) </label>
                                                <input type="text" id="TotalTime" name="TotalTime" class="form-control" value="0" readonly>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Last Option Value</label>
                                                <input type="text" id="option5" name="option5" class="form-control" placeholder="Last Option Value" value="None of the above">
                                            </div>
                                        </div>

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Score Per Question</label>
                                                <input type="text" id="scorePerQuestion" name="scorePerQuestion" class="form-control" placeholder="Score Per Question" onfocus="ScoreFunction()" onkeypress="HideScore()" value="">
                                            </div>

                                            <div id="scoreqn" style=display:none;color:red><i><font size="2">please enter score per question </font> </i></div>
                                        </div>
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Score </label>
                                                <input type="text" id="TotalScore" name="TotalScore" class="form-control" value="0" readonly>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Section 1</label>
                                                <input type="text" id="section1" name="section1" class="section form-control" placeholder="Section" onkeypress="hidesec1();" value="">
                                                <div id="sect1" style=display:none;color:red><i><font size="2">please enter section1 </font> </i></div>
                                            </div>

                                        </div>

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Section 2</label>
                                                <input type="text" id="section2" name="section2" class="section form-control" onfocus="Fnsection1()" onkeypress="hidesec2();" placeholder="Section" value="">
                                                <div id="sect2" style=display:none;color:red><i><font size="2">please enter section2 </font> </i></div>
                                            </div>
                                        </div>

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Section 3</label>
                                                <input type="text" id="section3" name="section3" class="section form-control" onfocus="Fnsection2()" onkeypress="hidesec3();" placeholder="Section" value="">
                                                <div id="sect3" style=display:none;color:red><i><font size="2">please enter section3 </font> </i></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Total Time Allowed For The Exam(mts)</label>
                                                <input type="text" id="totalTimeAllowedForExam" name="totalTimeAllowedForExam" class="form-control" placeholder="Total Time Allowed For The Exam(mts)" value="" onfocus="TotimeFunction()" onkeypress="HideTotaltime()">
                                            </div>
                                            <div id="tottimeexam" style=display:none;color:red><i><font size="2">please enter time allowed for exam(mts) </font> </i></div>
                                        </div>

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>No.of Question For Evaluation </label>
                                                <input type="text" id="noOfQuestionsForEvaluation" name="noOfQuestionsForEvaluation" class="form-control" placeholder="No.of Question For Evaluation" onfocus="noqestFunction()" onkeypress="Hidenoofquest()" value="">
                                            </div>
                                            <div id="noofquest" style=display:none;color:red><i><font size="2">please enter no of question for evaluvation </font> </i></div>
                                        </div>

                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Maximum Score</label>
                                                <input type="text" id="maximumScore" name="maximumScore" class="form-control" placeholder="Maximum Score" onfocus="MaxscoreFunction()" onkeypress="Hidemaxscore()" value="">
                                            </div>
                                            <div id="maxscore" style=display:none;color:red><i><font size="2">please enter maximum score </font> </i></div>
                                        </div>
                                    </div>
                                    <!--   <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group" style="margin-left:10px;">
                                                <button id="uploadQuestions" class="btn btn-info "  >ADD QUESTION</button>
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
                                <div class="col-md-4 ">
                                    <div class="form-group">
                                        <label>Time Allowed(sec)</label>
                                        <input type="text" id="timeAlowed" name="timeAlowed" class="form-control" placeholder="Time Allowed(sec)" value="">
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="form-group">
                                        <label>Question Score</label>
                                        <input type="text" id="questionScore" name="questionScore" class="form-control" placeholder="Question Paper Number" value="">
                                    </div>
                                </div>
                                <div class="col-md-4 ">
                                    <div class="form-group">
                                        <label>Difficulty Level</label>
                                        <input type="text" id="difficultyLevel" name="difficultyLevel" class="form-control" placeholder="Question Paper Number" onfocus="DificultFunction()" onkeypress="Hidedificult()" value="">
                                    </div>

                                </div>

                            </div>
                            <div class="row">

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>Section</label>
                                        <select id="section" name="section" class="btn btn-primary btn-block" onchange="hidesection();">
                                            <option disabled="disabled" value="selectcard" selected="selected">Select</option>
                                            <option id="section1String"></option>
                                            <option id="section2String"></option>
                                            <option id="section3String"></option>
                                        </select>
                                        <div id="session" style=display:none;color:red><i><font size="2">please select the section </font> </i></div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">

                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Question</label>
                                        <textarea id="Question" name="Question" class="form-control" placeholder="ClassName" value="" onfocus="QuestionFunction()" onkeypress="HidedQuest()"></textarea>
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
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Option 1</label>
                                        <textarea id="option1" name="option1" class="form-control" placeholder="Option 1" value="" onfocus="option1Function()" onkeypress="Hidedop1()"></textarea>
                                        <div id="op1" style=display:none;color:red><i><font size="2">please enter the option1 </font> </i></div>
                                    </div>

                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-option1Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info " style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="option1Img" class="upload-file-input" type="file" onchange="op1img();" name="option1Img" accept="*" />
                                    </label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label>Option 2</label>
                                        <textarea id="option2" name="option2" class="form-control" placeholder="Option 2" onfocus="option2Function()" onkeypress="Hidedop2()" value=""></textarea>
                                        <div id="op2" style=display:none;color:red><i><font size="2">please enter the option2 </font> </i></div>
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
                                        <textarea id="option3" name="option3" class="form-control" placeholder="Option 3" onfocus="option3Function()" onkeypress="Hidedop3()" value=""></textarea>
                                        <div id="op3" style=display:none;color:red><i><font size="2">please enter the option3 </font> </i></div>
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
                                        <textarea id="option4" name="option4" class="form-control" placeholder="Option 2" onfocus="opt4Function()" value=""></textarea>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <br>
                                    <span id="upload-file-message-option4Img" class="alert-success"></span>
                                    <label id="uploadQuestionsimg" class="file btn-bs-file btn btn-md btn-info" style=color:#fff>
                                        Add Image
                                        <input style="width:100px" id="option4Img" class="upload-file-input" type="file" name="option4Img" onchange="op4img();" accept="*" />
                                    </label>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-2 ">
                                    <div class="form-group">
                                        <label>Answer</label>

                                        <select onfocus="generateAnswerList()" id="Answer" name="Answer" class="form-control">
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

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group" style="margin-left:10px;">
                                        <button id="saveandnxt" class="btn btn-primary ">SAVE & ADD NEXT QUESTION</button>
                                    </div>
                                </div>

                            </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

            <div class="col-md-12">
                <div class="card">

                    <div class="card-body">
                        <form id="uploadQuestionsForm2">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="form-group" style="margin-left:35px;">
                                        <button id="SubmitQuestionPaper" class="btn btn-info ">SUBMIT QUESTION PAPER</button>
                                    </div>
                                </div>
                            </div>

                        </form>

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
<script src="js/uploadquesHelper.js"></script>
<script src="js/uploadquestionValidater.js"></script>


</html>