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
                    <li class="active">
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
                                <h5 class="title"> Adjust Score</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                   <div class="col-md-3 form-group"><b>Applicant Name</b><div class="form-control">${applicantRegister.candidateName}</div></div>
                                   <div class="col-md-3 form-group"><b>Exam ID</b><div class="form-control">${exam.examId }</div></div>
                                   <div class="col-md-2 form-group"><b>Score obtained</b><div class="form-control">${ObtainedScore}</div></div>
                                   <div class="col-md-2 form-group"><b>Total score</b><div class="form-control">${QnTotalScore }</div></div>
                                   <div class="col-md-2 form-group"><b>Pass Percentage</b><div class="form-control">${QnPassPercent }</div></div>
                                  <!--  <div class="col-md-1 form-group"><b></b><div class="form-control"></div></div> -->
                                </div>
                               <hr class="ribbon2" id="hr1">                               
                                                 
                                
                                  <div class="table-responsive">
                                    <table id="applicantTable" class="table table-sm">
                                        <thead class="text-primary" style="background-color: #3498db">
                                            <th>
                                                Sl.no
                                            </th>
                                            <th>
                                                Question
                                            </th>
                                         
                                            <!-- <th>
                                                Correct Answer
                                            </th>
                                            <th>
                                               Marked Answer
                                            </th> -->

                                            <th>
                                                Qn Score
                                            </th>
                                            <th>
                                                Obtained score
                                            </th>                   

                                        </thead>
                                        <form id="upgradeScoreForm">
                                        <tbody>
                                           <c:forEach items="${resultDetails}" var="resultDetailsData" varStatus="myIndex">
                                               <tr>
                                               <td style="width:5%;">

                                                   <c:out value="${myIndex.index+1}"/>

                                               </td>
                                               <td class="form-group" style="width:80%;">
                                                
                                                <c:forEach items="${QnBankLst}" var="QnBank" >
                                                    <c:set var = "rstlQid"  value = "${resultDetailsData.getQuestionId()}"/>
                                                    <c:set var = "qid"  value = "${QnBank.getQuestionId()}"/>
                                                    <c:if test="${rstlQid==qid}">
                                                        <span class="form-control" style=" white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${QnBank.getQuestion()}"/></span>
                                                    </c:if>
                                                 </c:forEach>
                                               </td>
                                               <%-- <td class="form-group">
                                                  <span class="form-control" style="white-space:pre;overflow-wrap:break-all;"><c:out value="${resultDetailsData.getCorrectDesc()}"/></span>
                                               </td>
                                               <td class="form-group">
                                                    <span class="form-control" style="white-space:pre;overflow-wrap:break-all;"><c:out value="${resultDetailsData.getMarkedDesc()}"/></span>
                                               </td> --%>
                                               <td class="form-group" style="width:5%;">
                                                   <div class="form-control" id="qnSc_${resultDetailsData.id}" data_value="${resultDetailsData.getQnScore()}"> ${resultDetailsData.getQnScore()} </div>
                                               </td>
                                               <td class="form-group" style="width:15%;">
                                                    <input class="form-control" type="text" id="${resultDetailsData.id}" name="${resultDetailsData.id}" />
                                               </td>
                                              
                                               
                                          
                                               
                                               
                                             </tr>
                                             </c:forEach>
                                        </tbody>
                                        </form>
                                    </table>

                                </div>

                                <button class="btn btn-info" id="saveChangesButton"  onclick="myFunction()">Save changes</button>
                                
                                
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
<script src="js/UpgradeScores.js"></script>

</html>