<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>TDS</title>
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
                
                <a href="#" class="simple-text logo-normal">
                    T&amp;D SYSTEM
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li >
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
                    <li >
                        <a href="/pathTDS/passwordMangement">
                            <i class="now-ui-icons ui-1_lock-circle-open"></i>
                            <p>Password Management</p>
                        </a>
                    </li>
                    <li >
                        <a href="/pathTDS/setuppara">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Parameter setup</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/manageQuestions">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Questions</p>
                        </a>
                    </li>
                   
                    <li class="active">
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
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="now-ui-icons location_world"></i>
                                    
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                
                                    <a class="dropdown-item" href="/pathTDS/logout">Logout</a>

                                </div>
                            </li>
                            
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
                            
                            <div class="card-body">
                                <form id="examannouncement" onsubmit="return false;">
                                <div class="row">
                                
                                <div class="col-md-6">
                                    <h6> &emsp; Edit Exam </h6>
                                </div>
                                <div class="col-md-6">
                                    <h6>Exam Id : <c:out value="${examDetails.examId}"/></h6>
                                </div>
                                
                            </div><hr>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Exam Name </label>
                                                <input id="examName" name="examName"  type="text" class="form-control"  placeholder="Exam Name" onblur="hideexmname()" value="${examDetails.examName}">
                                            </div>
                                              <div id="exmname" style=display:none;color:red ><i><font size="2">exam name can not be empty </font> </i></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Exam Date</label>
                                                <input id="examDate" name="examDate" type="Date" class="form-control" placeholder="Exam Date" onfocus="exmnameFunction()" onchange="hideemdate()" value="${examDetails.examDate}">
                                            </div>
                                            <div id="exmdate" style=display:none;color:red ><i><font size="2">exam date can not be empty </font> </i></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Final Date Of Registration</label>
                                                <input id="finalExamDate" name="finalExamDate" type="Date" class="form-control" onfocus="exmdateFunction()"  onchange="hidefinaldate()" placeholder="Final Date Of Exam" value="${examDetails.finalExamDate}">
                                            </div>
                                             <div id="finalexmdate" style=display:none;color:red ><i><font size="2">final exam date can not be empty </font> </i></div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Exam starting time</label>
                                                <input id="examTime" name="examTime" type="time" class="form-control" onfocus="exmfinaldate()" onchange="hideexmst()" placeholder="hh:mm:ss" value="${examDetails.examTime}">
                                            </div>
                                             <div id="exmstart" style=display:none;color:red ><i><font size="2">exam start can not be empty </font> </i></div>
                                            </div>
                                            <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Accessible Time From</label>
                                                <input id="accessibleTimeFrom" name="accessibleTimeFrom" type="time" class="form-control" onfocus="exmstartFunction()" onchange="hideacctimefrom()" placeholder="hh:mm:ss" value="${examDetails.accessibleTimeFrom}">
                                            </div>
                                            <div id="acctime" style=display:none;color:red ><i><font size="2">accessible time from can not be empty </font> </i></div>
                                            </div>
                                            <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Accessible Time To</label>
                                                <input id="accessibletimeTo" name="accessibletimeTo" type="time" class="form-control" onfocus="acctimeto()" onchange="hideacctimeto()" placeholder="hh:mm:ss" value="${examDetails.accessibletimeTo}">
                                            </div>
                                            <div id="accto" style=display:none;color:red ><i><font size="2">accessible time from can not be empty </font> </i></div>
                                            </div>
                                        </div>


                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Question Paper Number</label>
                                                <input id="questionPaperNumber" name="questionPaperNumber" type="text" class="form-control" onfocus="qnnoFunction()" placeholder="Question Paper Number" value="${examDetails.questionPaperNumber}">
                                            </div>
                                              <div id="qnno" style=display:none;color:red ><i><font size="2">question paper no can not be empty </font> </i></div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group">
                                                <label>Who Can Register</label>
                                                <textarea class="form-control" id="whoCanRegister" name="whoCanRegister" placeholder="Who Can Register ?" id="WhoCanRegister" onfocus="whoFunction()" name="WhoCanRegister"> ${examDetails.whoCanRegister} </textarea>
                                            </div>

                                            <div class="form-group">
                                                <label>Other Details</label>
                                                <textarea id="otherDetails" name="otherDetails" class="form-control" placeholder="OtherDetails"> ${examDetails.otherDetails} </textarea>
                                            </div>

                                            <div class="form-group">
                                                <label>Other Instructions & Conditions</label>
                                                <textarea id="additionalInstructions1" name="additionalInstructions1" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions1} </textarea>
                                            </div>

                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions2" name="additionalInstructions2" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions2} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions3" name="additionalInstructions3" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions3} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions4" name="additionalInstructions4" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions4} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions5" name="additionalInstructions5" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions5} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions6" name="additionalInstructions6" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions6} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions7" name="additionalInstructions7" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions7} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions8" name="additionalInstructions8" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions8} </textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions9" name="additionalInstructions9" class="form-control" placeholder="Additional Instructions"> ${examDetails.additionalInstructions9} </textarea>
                                            </div>
                                        </div>


                                    </div>


                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group" style="margin-left:10px;">
                                                <input type="hidden" name="examId" value="${examDetails.examId}" />
                                                <c:if test="${editEx eq 'false'}"> 
                                                <button id="updateExam" class="btn btn-info " >Announce and Schedule Exam</button>
                                                </c:if>
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
<script src="js/examHelper.js"></script>
<script src="js/editexamValidate.js"></script>


<script>

    /* $("#examName").val("${examDetails.examName}");
    $("#examDate").val("${examDetails.examDate}");
    $("#examTime").val("${examDetails.examTime}");
    $("#finalExamDate").val("${examDetails.finalExamDate}");
    $("#accessibleTimeFrom").val("${examDetails.accessibleTimeFrom}");
    $("#accessibletimeTo").val("${examDetails.accessibletimeTo}");
    $("#questionPaperNumber").val("${examDetails.questionPaperNumber}");
    $("#whoCanRegister").val("${examDetails.whoCanRegister}");
    $("#otherDetails").val("${examDetails.otherDetails}");

    $("#additionalInstructions1").val("${examDetails.additionalInstructions1}");
    $("#additionalInstructions2").val("${examDetails.additionalInstructions2}");
    $("#additionalInstructions3").val("${examDetails.additionalInstructions3}");
    $("#additionalInstructions4").val("${examDetails.additionalInstructions4}");
    $("#additionalInstructions5").val("${examDetails.additionalInstructions5}");
    $("#additionalInstructions6").val("${examDetails.additionalInstructions6}");
    $("#additionalInstructions7").val("${examDetails.additionalInstructions7}");
    $("#additionalInstructions8").val("${examDetails.additionalInstructions8}");
    $("#additionalInstructions9").val("${examDetails.additionalInstructions9}"); */
    
   
    
    
    $("#updateExam").click(function() {
        updateExam("${examDetails.id}");
    });
</script>

</html>
