
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
   <title>Generate Question Paper</title>
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

<body >

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
                     <li >
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
     
               
                     
                  
        <div class="panel-header panel-header-sm">  </div>
            <div class="content">
               <div id="questionHeader" class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <!-- <h5 class="title"> Question Paper Setting</h5> -->
                            </div>
                            <div class="card-body">
                                 <div class="col-md-12">
                                 <table class="table">
                                  <thead class=" text-primary" style="vertical-align:left;font-weight:400;font-size:17px; background-color: #3498db "><tr><th colspan="4">Generate Question Paper</th></tr></thead>
                                  <tbody>
                                     <tr >
                                        <td class="form-group"><label>Duplicate from a previous Question</label></td>
                                        <td class="form-group">
                                            <input type="radio" class="clpreviousqn" name="previousqn" value="yes" > Yes &nbsp;
                                            <input type="radio" class="clpreviousqn" name="previousqn" value="no"> No<br>                                                 
                                         </td>
                                        <td class="form-group clprevQn"><label>Previous QuestionPaper No</label></td>
                                        <td class="form-group clprevQn">
                                            <input list="questionPaperList" autocomplete="off" id="questionPaperNumber" name="questionPaperNumber" class="form-control validate" placeholder="questionPaperNumber" value="" maxlength="10">
                                                <datalist id="questionPaperList">
                                                    <c:forEach items="${questionPaperList}" var="questionPaperNumber" varStatus="myIndex">
                                                        <option value="${questionPaperNumber.getQuestionpaperid()}"> <c:out value="${questionPaperNumber.getclassname()}"/></option>
                                                    </c:forEach>
                                                </datalist>
                                        </td>
                                     </tr>
                                     <tr class="clNprev">
                                        <td class="form-group"><label>class</label></td>
                                        <td class="form-group">                                           
                                            <input list="classnameList" autocomplete="off" id="className" name="className"  class="form-control validate" placeholder="Class name" value="" maxlength="250" >
                                                <datalist id="classnameList">
                                                    <c:forEach items="${classnameList}" var="classname" varStatus="myIndex1">
                                                        <option value="${classname.getPrm_shortname()}">${classname.getPrm_name()}</option>
                                                    </c:forEach>
                                                </datalist>
                                        </td>
                                        <td class="form-group"><label>Maximum allowed Score</label></td>
                                        <td class="form-group"><input type="text" id="maximumScore" name="maximumScore" class="form-control" placeholder="Maximum Score"   value="" maxlength="10"> </td>
                                     </tr>
                                     <tr class="clNprev">
                                        <td class="form-group"><label>Time Allowed(mts)</label></td>
                                        <td class="form-group"> <input type="text" id="totalTimeAllowedForExam" name="totalTimeAllowedForExam" class="form-control" placeholder="Total Time Allowed For The Exam(mts)" value="" maxlength="10"> </td>
                                        <td class="form-group"><label>Total Score </label></td>
                                        <td class="form-group"><input type="text" id="TotalScore" name="TotalScore" class="form-control" value="0" readonly> </td>
                                     </tr>
                                     <tr class="clNprev">
                                        <td class="form-group"><label></label></td>
                                        <td class="form-group"> </td>
                                        <td class="form-group"><label>Pass percentage(%) </label></td>
                                        <td class="form-group"> <input type="text" id="passPercentage" name="passPercentage" class="form-control" placeholder="Pass Percentage" value="" maxlength="10" >
                                         </td>
                                     </tr>
                                  </tbody>
                                 </table>
                                 
                                 </div>
                                                    
                            </div>
                     </div>
                
                    <div class="col-md-12 clcriteria">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title clNprev"> Selection criteria</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                <table class="table" style="vertical-align:middle;border-color: black;">

                                  <thead class=" text-primary  clNprev" style="vertical-align:left;font-weight:400;font-size:17px; background-color: #3498db "><tr><th>Sections</th><th>Answer Type</th><th>Easy</th><th>Average</th><th>Difficult</th><th>Total</th><th>Score per Question</th></tr></thead>
                                  <tbody>
                                     
                                     <tr class=" clNprev">
                                          <td>
                                            <input list="sectionList1" autocomplete="off" id="section1" name="section1" class="form-control validate selector" placeholder="Section1" value="" >
                                                <datalist id="sectionList1">
                                                    <c:forEach items="${sectionList}" var="sectionname" varStatus="myIndex1">
                                                        <option value="${sectionname.getPrm_name()}"></option>
                                                    </c:forEach>
                                                </datalist>
                                           </td> 
                                           <td><input list="answerTypeList" autocomplete="off" id="answerTy1" name="answerTy1" class="form-control validate" placeholder="answer type" value=""  >
                                                <datalist id="answerTypeList">
                                                    <c:forEach items="${answerTypeList}" var="answerTypeList" varStatus="myIndex">
                                                        <option value="${answerTypeList}"></option>
                                                    </c:forEach>
                                                </datalist></td> 
                                           <td><input type="text" id="easy1" name="easy1" class="form-control" placeholder="Easy" value="" ></td><td><input type="text" id="average1" name="average1" class="form-control" placeholder="Average" value="" ></td><td><input type="text" id="difficult1" name="difficult1" class="form-control" placeholder="Difficult" value="" ></td><td><span id="totalead1"></span></td> 
                                           <td><input type="text" id="scorePerQn1" name="scorePerQn1" class="form-control" placeholder="Score per Question" value="" ></td></tr>
                                     <tr  class=" clNprev">
                                       <td>
                                       <input list="sectionList2" autocomplete="off" id="section2" name="section2" class="form-control validate selector" placeholder="Section2" value="" >
                                                <datalist id="sectionList2">
                                                    <c:forEach items="${sectionList}" var="sectionname" varStatus="myIndex1">
                                                        <option value="${sectionname.getPrm_name()}"></option>
                                                    </c:forEach>
                                                </datalist>
                                      </td> 
                                      <td>
                                        <input list="answerTypeList" autocomplete="off" id="answerTy2" name="answerTy2" class="form-control validate" placeholder="answer type" value=""  >
                                                <datalist id="answerTypeList">
                                                    <c:forEach items="${answerTypeList}" var="answerTypeList" varStatus="myIndex">
                                                        <option value="${answerTypeList}"></option>
                                                    </c:forEach>
                                                </datalist>
                                      </td> 
                                      <td> <input type="text" id="easy2" name="easy2" class="form-control" placeholder="Easy" value="" ></td><td><input type="text" id="average2" name="average2" class="form-control" placeholder="Average" value="" ></td><td><input type="text" id="difficult2" name="difficult2" class="form-control" placeholder="Difficult" value="" ></td><td><span id="totalead2"></span></td> 
                                      <td><input type="text" id="scorePerQn2" name="scorePerQn2" class="form-control" placeholder="Score per Question" value="" ></td></tr>
                                     <tr  class=" clNprev">
                                       <td>
                                       <input list="sectionList3" autocomplete="off" id="section3" name="section3" class="form-control validate selector" placeholder="Section3" value="" >
                                                <datalist id="sectionList3">
                                                    <c:forEach items="${sectionList}" var="sectionname" varStatus="myIndex1">
                                                        <option value="${sectionname.getPrm_name()}"></option>
                                                    </c:forEach>
                                                </datalist>
                                       </td> 
                                       <td>
                                         <input list="answerTypeList" autocomplete="off" id="answerTy3" name="answerTy3" class="form-control validate" placeholder="answer type" value=""  >
                                                <datalist id="answerTypeList">
                                                    <c:forEach items="${answerTypeList}" var="answerTypeList" varStatus="myIndex">
                                                        <option value="${answerTypeList}"></option>
                                                    </c:forEach>
                                                </datalist>
                                       </td> 
                                       <td> <input type="text" id="easy3" name="easy3" class="form-control" placeholder="Easy" value="" ></td><td> <input type="text" id="average3" name="average3" class="form-control" placeholder="Average" value="" ></td><td><input type="text" id="difficult3" name="difficult3" class="form-control" placeholder="Difficult" value="" ></td><td><span id="totalead3"></span></td> 
                                       <td> <input type="text" id="scorePerQn3" name="scorePerQn3" class="form-control" placeholder="Score per Question" value="" ></td></tr>
                                     <tr  class=" clNprev">
                                     <td>
                                     <input list="sectionList4" autocomplete="off" id="section4" name="section4" class="form-control validate selector" placeholder="Section4" value="" >
                                                <datalist id="sectionList4">
                                                    <c:forEach items="${sectionList}" var="sectionname" varStatus="myIndex1">
                                                        <option value="${sectionname.getPrm_name()}"></option>
                                                    </c:forEach>
                                                </datalist>                                     
                                     </td> 
                                     <td>
                                       <input list="answerTypeList" autocomplete="off" id="answerTy4" name="answerTy4" class="form-control validate" placeholder="answer type" value=""  >
                                                <datalist id="answerTypeList">
                                                    <c:forEach items="${answerTypeList}" var="answerTypeList" varStatus="myIndex">
                                                        <option value="${answerTypeList}"></option>
                                                    </c:forEach>
                                                </datalist>
                                     </td> 
                                     <td><input type="text" id="easy4" name="easy4" class="form-control" placeholder="Easy" value="" ></td><td><input type="text" id="average4" name="average4" class="form-control" placeholder="Average" value="" ></td><td><input type="text" id="difficult4" name="difficult4" class="form-control" placeholder="Difficult" value="" ></td><td><span id="totalead4"></span></td> 
                                     <td> <input type="text" id="scorePerQn4" name="scorePerQn4" class="form-control" placeholder="Score per Question" value="" ></td></tr>
                                     <tr  class=" clNprev"><td></td> <td></td> <td></td><td></td><td></td> <td></td></tr>
                                     <tr  class=" clNprev" style="background-color:#75b9e7;"><td colspan="2" style="text-align:right;"><span><b>Total</b></span></td> <td><span id="totaleasy"></span></td><td><span id="totalAverage"></span></td><td><span id="totalDifficult"></span></td> <td><span id="totaltot"></span></td><td> </td></tr>
                                     <tr  class=" btnGenerateQn" > <td colspan="7" style="vertical-align:middle;text-align:center;"> <input id="btnGenerateQn" type="submit" value="Generate Question Paper" /></td>  </tr>
                                  </tbody>
                                </table>
                                </div>                             
                                      
                               
         					</div> 
                        </div>
                    </div>
				</div>
            </div>
        </div>
</body>
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
<script src="js/Questionpaper.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
});
</script>

