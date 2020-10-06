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
                                    <p>
                                       
                                    </p>
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
                            <div class="card-header">
                                <h5 class="title caps">Announce - Schedule Exam </h5>
                            </div>
                            <div class="card-body">
                                <form id="examannouncement">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                            <!-- <c:forEach items="${QuestnheadrList}" var="questn">
                                            <input type="text" value="${questn.questionPaperNumber}">
                                            
                                            </c:forEach>  -->
                                            
                                                <label>Exam Name </label>
                                                <input id="examName" name="examName"  type="text" class="form-control"  placeholder="Exam Name" onkeypress="hideexmname()" value="">
                                            </div>
                                            <div id=exmname style=display:none;color:red ><i><font size="2">please enter exam name</font> </i></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <c:forEach items="${ExamidList}" var="Examsid" varStatus="myIndex">
                                              <input type="hidden" id="exmsid" name="exmisd[]" value="${Examsid}">
                                            
                                               </c:forEach>
                                             
                                            
                                                <label>Exam Id </label>
                                                <!-- <input id="examId" name="examId"  type="text" class="form-control" onfocus="examnameFunction()" onkeypress="hideexmid()" onblur="checkdupli()"  placeholder="Exam Id" value=""> -->
                                                <input id="examId" name="examId"  type="text" class="form-control"    placeholder="Exam Id" value="" disabled="disabled">
                                            </div>
                                             <!-- <div id=exmid style=display:none;color:red ><i><font size="2">please enter exam id</font> </i></div>
                                              <div id=exmssid style=display:none;color:red ><i><font size="2">Exam Id Alredy exist !!</font> </i></div> -->
                                        </div>
                                        <!--  <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Question Paper Number</label>
                                                <input  id="questionPaperNumber" name="questionPaperNumber" type="text"  class="form-control  " placeholder="Question Paper Number" onfocus="examidFunction()" onkeypress=" hideqnpaper()"  value="">
                                              </div>
                                             <div id=qnno style=display:none;color:red ><i><font size="2">please enter question paper no</font> </i></div>
                                        </div> --> 
                                        
                                        
                                    <!--   <div class="col-md-4">
                                            <div class="form-group">
                                            
                                            <label>Question Paper Number</label>
                                            <input list="questionPaperNumberList"  autocomplete="off"  id="questionPaperNumber" name="questionPaperNumber" value="" class="form-control" onfocus="examidFunction()" onchange=" hideqnpaper()" placeholder="Question Paper Number">
                                            <datalist id="questionPaperNumberList">
                                              <c:forEach items="${QuestnheadrList}" var="questn">
                                                   <option value="${questn.questionPaperNumber}"></option>
                                                </c:forEach>
                                            </datalist>
                                            
                                            <div id=qnno style=display:none;color:red ><i><font size="2">please enter question paper no</font> </i></div>
                                            </div>   
                                        </div> -->
                                        
                                        
                                        
                                        
                                    <div class="col-md-4">
                                            <div class="form-group">
                                            
                                            <label>Question Paper Number</label>
                                            <input list="questionPaperNumberList"  autocomplete="off"  id="questionPaperNumber" name="questionPaperNumber" value="" class="form-control" onfocus="examidFunction()" onchange=" hideqnpaper()" placeholder="Question Paper Number">
                                            <datalist id="questionPaperNumberList">
                                              <c:forEach items="${QuestnpaperList}" var="quetnpaper">
                                                   <option value="${quetnpaper.questionpaperid}">${quetnpaper.questionpaperid} - ${quetnpaper.classname}</option>
                                          
                                                </c:forEach>
                                                
                                                
                                            </datalist>
                                            
                                           <div id=qnno style=display:none;color:red ><i><font size="2">please enter question paper no</font> </i></div>
                                            </div>   
                                        </div>     
                                        
                                
                             </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Exam Date(mm/dd/yyyy)</label>
                                                <input id="examDate" name="examDate" type="Date" class="form-control" placeholder="Exam Date"  onfocus="qnpaperFunction()" onchange="hideexamdate()" value="">
                                            </div>
                                            <div id=exmdate style=display:none;color:red ><i><font size="2">please enter exam date</font> </i></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Final Date Of Registration</label>
                                                <input id="finalExamDate" name="finalExamDate" type="Date" class="form-control" onfocus="exmdateFunction()" onchange=" hidefinalexamdate()" placeholder="Final Date Of Exam">
                                            </div>
                                            <div id=finalexmdate style=display:none;color:red ><i><font size="2">please enter final date of registration</font> </i></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Exam starting time</label>
                                                <input id="examTime" name="examTime" type="time" class="form-control" onfocus="finalexmFunction()" onchange="hideexamstart()" placeholder="hh:mm:ss" value="">
                                            </div>
                                             <div id=exmstart style=display:none;color:red ><i><font size="2">please enter exam starting time</font> </i></div>
                                        </div>

                                    </div>


                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Accessible Time From  </label>
                                                <input id="accessibleTimeFrom" name="accessibleTimeFrom" type="time" class="form-control" placeholder="hh:mm:ss" onfocus="starttimeFunction()" onchange="hideacctimefrom()" value="">
                                            </div>
                                            <div id=acctimefrom  style=display:none;color:red ><i><font size="2">please enter accessible time from</font> </i></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Accessible Time To </label>
                                                <input id="accessibletimeTo" name="accessibletimeTo" type="time" class="form-control" placeholder="hh:mm:ss" onfocus="acctimetoFunction()" onchange="hideacctimeto()" value="">
                                            </div>
                                             <div id=acctimeto  style=display:none;color:red ><i><font size="2">please enter accessible time to</font> </i></div>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group">
                                                <label>Who Can Register</label>
                                                <textarea class="form-control" id="whoCanRegister" name="whoCanRegister" placeholder="Who Can Register ?" id="WhoCanRegister" onfocus="whoFunction()" name="WhoCanRegister"> </textarea>
                                            </div>

                                            <div class="form-group">
                                                <label>Other Details</label>
                                                <textarea id="otherDetails" name="otherDetails" type="text" class="form-control" placeholder="OtherDetails"  onfocus="whoFunction()" value=""></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label>Other Instructions & Conditions</label>
                                                <textarea id="additionalInstructions1" name="additionalInstructions1" type="text" class="form-control" placeholder="Additional Instructions" onfocus="whoFunction()"  value=""></textarea>
                                            </div>

                                            <div class="form-group">
                                               
                                                <textarea id="additionalInstructions2" name="additionalInstructions2" type="text" class="form-control" placeholder="Additional Instructions" onfocus="whoFunction()" value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions3" name="additionalInstructions3" type="text" class="form-control" placeholder="Additional Instructions"  onfocus="whoFunction()"  value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions4" name="additionalInstructions4" type="text" class="form-control" placeholder="Additional Instructions"  onfocus="whoFunction()" value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions5" name="additionalInstructions5" type="text" class="form-control" placeholder="Additional Instructions" onfocus="whoFunction()" value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions6" name="additionalInstructions6" type="text" class="form-control" placeholder="Additional Instructions" onfocus="whoFunction()" value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions7" name="additionalInstructions7" type="text" class="form-control" placeholder="Additional Instructions"  onfocus="whoFunction()"value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                               
                                                <textarea id="additionalInstructions8" name="additionalInstructions8" type="text" class="form-control" placeholder="Additional Instructions"  onfocus="whoFunction()" value=""></textarea>
                                            </div>
                                            <div class="form-group">
                                                
                                                <textarea id="additionalInstructions9" name="additionalInstructions9" type="text" class="form-control" placeholder="Additional Instructions"  onfocus="whoFunction()" value=""></textarea>
                                            </div>


                                        </div>          
                                                                      
                                        
                                    </div>
                                     

                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group" style="margin-left:10px;">
                                                <button id="announceexam" class="btn btn-info " >Announce and Schedule Exam</button>
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
                            document.write(new Date().getFullYear())
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
<script src="js/examHelper.js"></script>
<script src="js/examScheduleValidate.js"></script>
<script src="js/duplicteexmid.js"></script>

</html>
