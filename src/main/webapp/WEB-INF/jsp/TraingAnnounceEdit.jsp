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
                   
                    <li >
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
                    <li class="active">
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
                                <h5 class="title caps">Announce - Training </h5>
                            </div>
                            <div class="card-body">
                                <form id="trainingannouncement" onsubmit="return false;">
                                   

                                    <div class="row">
                                    
                                    <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Training Mode</label>
                                                <select class=" form-control validate " id="mySelect" onchange="myFunction()">
												  <option >Select</option>
												  <option value="Internal">Internal</option>
												  <option value="External">External</option>
												
												     </select> 
                                            </div>
                                           
                                        </div>
                                    <input type="hidden" value="" id="trainingtype" name="trainingtype">
                                    <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Training Type</label>
                                              
                                                 <input list="paramList" autocomplete="off" id="category" name="category" class="form-control validate" placeholder="category" value="${trainingList.category}"  maxlength="30" >
                                                  <datalist id="paramList">
                                                    <c:forEach items="${paramList}" var="parameters" >
                                                    <c:if test="${parameters.prm_type eq 'Trainingtype'}"> 
                                                        <option value="${parameters.prm_name}"></option>
                                                       
                                                        </c:if>
                                                         
                                                    </c:forEach>
                                                </datalist>
                                            </div>
                                      
                                            
                                        </div>
                                        
                                        <div class="col-md-4 ">
                                            <div class="form-group">
                                                <label>Select Evaluvation Form</label>
                                              
                                                 <input list="formid" autocomplete="off" id="evalformno" name="evalformno" class="form-control validate" placeholder="Evaluation form" value="${trainingList.evalformno}"  maxlength="30" >
                                                  <datalist id="formid">
                                                    <c:forEach items="${formid}" var="formid" >
                                                   
                                                        <option value="${formid.id}"><c:out value="${formid.formName }"/></option>
                                                       
                                                        
                                                         
                                                    </c:forEach>
                                                </datalist>
                                            </div>
                                      
                                            
                                        </div>
                                    
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Name of the Training</label>
                                                <input id="name" name="name" type="text" class="form-control" placeholder="Name"   value="${trainingList.name}" maxlength="40">
                                            </div>
                                           
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Training Location</label>
                                                <input id="location" name="location" type="text" class="form-control" placeholder="location"   value="${trainingList.location}" maxlength="40">
                                            </div>
                                           
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Training Language</label>
                                                <input id="language" name="language" type="text" class="form-control" placeholder="language"   value="${trainingList.language}" maxlength="40">
                                            </div>
                                           
                                        </div>
                                        
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Training Period &Time</label>
                                                <input id="period" name="period" type="text" class="form-control" placeholder="period"   value="${trainingList.period}" maxlength="40">
                                            </div>
                                           
                                        </div>
                                        
                                          
                                        
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Training Start Date</label>
                                                <input id="startdt" name="startdt" type="date" class="form-control" placeholder="start date"   value="${trainingList.startdt}">
                                            </div>                                           
                                        </div>
                                        
                                        
                                         <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Final Date Of Registration</label>
                                                <input id="Regfinal" name="Regfinal" type="date" class="form-control" placeholder="Fianldate"   value="${trainingList.regfinal}">
                                            </div>
                                           
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Last date of Evaluation submission</label>
                                                <input id="submitdate" name="submitdate" type="date" class="form-control" placeholder="Evaluation submit date"   value="${trainingList.submitdate}">
                                            </div>                                           
                                        </div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Time Zone</label>
                                                <input id="timezone" name="timezone" type="text" class="form-control" placeholder="time zone"   value="${trainingList.timezone}" maxlength="60">
                                            </div>
                                           
                                        </div>
                                        
                                        <div class="col-md-4"></div>
                                        
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Trainer Name</label>
                                                <input id="trainername" name="trainername" type="text" class="form-control" placeholder="trainer name"   value="${trainingList.trainername}" maxlength="40">
                                            </div>
                                           
                                        </div>
                                   
                                       
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Department</label>
                                                <input id="department" name="department" type="text" class="form-control" placeholder="department"   value="${trainingList.department}" maxlength="40">
                                            </div>
                                           
                                        </div>
                                          
                                        
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Trainer Details</label>
                                                 <textarea class="form-control" id="details" name="details"  placeholder="details"   value="" maxlength="400">${trainingList.details}</textarea>
                                            </div>
                                           
                                        </div>
                                        
                                        
                                      
                                       

                                    </div>

                             <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group">
                                                <label>Who Can Register</label>
                                                <textarea class="form-control" id="whocan" name="whocan" placeholder="Who Can Register ?" id="WhoCanRegister" onfocus="whoFunction()" name="WhoCanRegister" maxlength="400"> ${trainingList.whocan} </textarea>
                                            </div>

                                            <div class="form-group">
                                                <label>Other Details</label>
                                                <textarea id="otherdeatils" name="otherdeatils" type="text" class="form-control" placeholder="OtherDetails"  onfocus="whoFunction()" value="" maxlength="400">${trainingList.otherdeatils}</textarea>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>Training Agenda</label>
                                                <textarea id="agenda" name="agenda" type="text" class="form-control" placeholder="agenda"  onfocus="whoFunction()" value="" maxlength="2000"  rows="16" cols="50">${trainingList.agenda}</textarea>
                                            </div>
                                   
                                   </div>
                                   </div>
                                     

                                    <div class="row">
                                        <div class="col-md-12 ">
                                            <div class="form-group" style="margin-left:10px;">
                                                <button id="updateuser" class="btn btn-info " >Save</button>
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
<script src="js/TrainingAnnounce.js"></script> 
<script>
function myFunction() { //onchange event of question type
    var x = document.getElementById("mySelect").value;
    document.getElementById("trainingtype").value = x;
   
}
</script>
<script>

  $(document).ready(function(){ 
    $("#mySelect").val("${trainingList.trainingtype}");
    $("#trainingtype").val("${trainingList.trainingtype}");
  }); 
    /* $("#name").val("${trainingList.name}");
    $("#period").val("${trainingList.period}");
    $("#location").val("${trainingList.location}");
    $("#language").val("${trainingList.language}");
    $("#Regfinal").val("${trainingList.regfinal}");
    $("#startdt").val("${trainingList.startdt}");
    $("#details").val("${trainingList.details}");
    $("#whocan").val("${trainingList.whocan}");
    $("#otherdeatils").val("${trainingList.otherdeatils}"); */
   
    $("#updateuser").click(function() {
    	
       updateuser("${trainingList.id}");
        
   });
  
</script>




</html>
