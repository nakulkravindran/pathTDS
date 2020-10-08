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
    <div class="wrapper ">
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
                    <li>
                        <a href="/pathTDS/exammangmnt">
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Exam Management </p>
                        </a>
                    </li>
                    <li class="active">
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
                        <div class="card scrollmenu">
                            <div class="card-header">
                                <h5 class="title">Applicants List </h5>

                            </div>
                            <div class="card-body" style="height:500px; ">
                                <div class="row">
                                <div class="col-md-3">
                                  <label>Select any Exam</label>
                                            <input list="questionPaperNumberList"  autocomplete="off"  id="examidview" name="examidview" value="" class="form-control col-md-6"  placeholder="Exam Id">
                                            <datalist id="questionPaperNumberList">
                                                <c:forEach items="${examList}" var="questionPaperNumber" varStatus="myIndex">
                                                   <option value="${questionPaperNumber.examId}"></option>
                                                  
                                                </c:forEach>
                                            </datalist>
                                   
                                </div>
                                 
                                   <!--   <div class="col-md-3">
                                            <div class="dropdown">
                                              <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Select any Exam
                                              </button>
                                              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style=" height: 140px; width: 200px; overflow-y: scroll;">

                                                <c:forEach items="${examList}" var="exam">
                                                    <a class="dropdown-item" href="/pathTDS/viewApplicants?examId=${exam.examId}"><c:out value="${exam.examId}"/></a>
                                                </c:forEach>
                                              </div>
                                            </div>
                                    </div>-->
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Exam ID :<span style="color:red;font-weight:400;font-size:17px;"> <%= request.getParameter("examId") %></span></p>
                                   <input type="hidden" id="exmid" name="exmid" value="<%= request.getParameter("examId") %>">
                                   
                                   
                                    </div>
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Exam Name :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${examName}"/></span></p>
                                    </div>
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Exam Date :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${examDate}"/></span></p>
                                    </div>
                                </div>

								<div class="row">
                                   <div class="col-md-3"></div>
                                   <div class="col-md-3"></div>
                                   <div class="col-md-3"><button  class="btn btn-success" id="emailAppr">Email Approvals</button>
                                </div>
                                   <div class="col-md-3"><button  class="btn btn-success" id="emailRej">Email Rejections</button>
                                </div>
                                </div>
   
                                <div class="table-responsive">
                                    <table id="applicantTable" class="table table-sm">
                                        <thead class="text-primary" style="background-color: #3498db">
                                            <th>
                                                Sl.no
                                            </th>
                                            <th hidden>
                                            <!-- Approval Status -->
                                            </th> 
                                            <th >
                                              Mail <input type="checkbox" id="chkmail" name="mail" value="0" /> 
                                            </th>
                                            <th>
                                                
                                            </th>
                                            <th>
                                                Status
                                            </th>
                                          
                                            <th>
                                                Candidate Name
                                            </th>
                                            <th>
                                               Company
                                            </th>

                                            <th>
                                                Country
                                            </th>
                                            <th>
                                                Email Id
                                            </th>
                                            <th>
                                                Phone No
                                            </th>
                                            <th>
                                                Job Title
                                            </th>
                                            <th>
                                                Department
                                            </th>
                                            <th>
                                                Line Manager
                                            </th>

                                            <th>
                                                Password
                                            </th>
                                            <th>
                                           		Line Manager Email ID
                                            </th>
                                            <th>
                                              Remarks
                                            </th>
                                            <th>
                                              CAD Remarks
                                            </th>

                                            <th hidden >
                                                Path Employee
                                                yes/no
                                            </th>
                                             <th hidden >
                                               Line Manager Approved
                                                yes/no
                                            </th>
                                            
                                             <th hidden >
                                              Employee Id
                                            </th>
                                            
                                              <th hidden >
                                          		Service Duration
                                            </th>
                                            
                                            <th hidden >
                                          		Date registered
                                            </th>
                                            
                                
                                

                                        </thead>
                                        <form id="applicantApprovalForm">
                                        <tbody>
                                           <c:forEach items="${applicantList}" var="applicantData" varStatus="myIndex">
                                               <tr>
                                               <td >

                                                   <c:out value="${myIndex.index+1}"/>

                                               </td>
                                               <td >
                                                	<input type="checkbox" name="mail" value="${applicantData.id}">
                                               </td>
                                               <td>                                               
                                               <a href="/pathTDS/applicantedit?applicantId=${applicantData.id}"><b>Edit</b></a>                                                
                                               </td>
                                               <td>
                                               <select id="applicantStatus${applicantData.id}" class=".applicantStatus${applicantData.id}" name="${applicantData.id}">
                                                    <option id="Pending${applicantData.id}" value="Pending">Pending</option>
                                                    <option id="Approove${applicantData.id}" value="Approove">Approve</option>
                                                    <option id="Reject${applicantData.id}" value="Reject" >Reject</option>
                                                    
                                               </select> 
                                               </td>
                                               <td hidden >
                                                  <c:out value="${applicantData.approvalStatus}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.candidateName}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.companyName}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.location}"/>
                                               </td>
                                               <td >
                                                    <c:out value="${applicantData.emailId}"/>
                                               </td>
                                               <td >
                                                    <c:out value="${applicantData.phoneNumber}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.jobTitle}"/>
                                               </td>
                                                <td >
                                                  <c:out value="${applicantData.department}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.lineManager}"/>
                                               </td>
                                               <td >
                                                  <c:out value="${applicantData.applicantPassword}"/>
                                               </td>
                                               <td>
                                                  <c:out value="${applicantData.lineManagerEmail}"/>
                                               </td>
                                                <td>
                                                  <c:out value="${applicantData.remarks}"/>
                                               </td>
                                               <td>
                                                  <c:out value="${applicantData.cadremarks}"/>
                                               </td>
                                          	   <td hidden>
                                              <!--     <c:out value="${applicantData.approvedByLineManager}"/> -->                                                   
                                         			<c:if test="${applicantData.pathEmployee eq 'Y'}">                                   
                                             			<c:out value="Yes"/>                                      
                                     				</c:if> 
                                     				<c:if test="${applicantData.pathEmployee eq 'N'}">                                   
                                             			<c:out value="No"/>                                      
                                     				</c:if>                                       
                                               </td>
                                                <td hidden >
                                                  <c:out value="${applicantData.approvedByLineManager}"/>
                                               </td>
                                              
                                                <td hidden >
                                                  <c:out value="${applicantData.employeid}"/>
                                               </td>
                                               
                                               <td hidden >
                                                  <c:out value="${applicantData.serviceDuration}"/>
                                               </td>
                                               
                                               <td hidden >
                                                  <c:out value="${applicantData.currentdate}"/>
                                               </td>
                                               
                                               
                                             </tr>
                                             </c:forEach>
                                        </tbody>
                                        </form>
                                    </table>

                                </div>

                                <button class="btn btn-info" id="saveChangesButton"  onclick="myFunction()">Save changes</button>
                                <button class="btn btn-success" id="export">Export</button>
                                <!-- <button onclick="sendEmailApprovals()" class="btn btn-success" id="emailAppr">Email Approvals</button>
                                <button onclick="sendEmailRejections()" class="btn btn-success" id="emailRej">Email Rejections</button>  -->
                                
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
<script src="assets/js/jquery.table2excel.min.js"></script>
<script src="js/applicantApprovalHelper.js"></script>
<script src="js/Applicantcheck.js"></script>
<script>
    $("#export").click(function(){
      $("#applicantTable").table2excel({
        // exclude CSS class
        
        exclude: ".noExl",
        name: "Worksheet Name",
       filename: "ApplicantList" //do not include extension
      });
    });
    
    $("#chkmail").click(function(){
        if($(this).prop("checked") == true){
        	$.each($("input[name='mail']"), function(){
        		$(this).prop('checked', true);
            });
        }
        else if($(this).prop("checked") == false){
        	$.each($("input[name='mail']"), function(){
        		$(this).prop('checked', false);
            });
        }
    });
    
 $("#emailAppr").click(function(){
        
        $.each($("input[name='mail']:checked"), function(){
        	var appid =$(this).val();
        	$.ajax({
	        type: "POST",
	        url: "/pathTDS/mailExmApprovalsIndv",
	        data: {app: appid}, // pass userid to controller.
	        success: function(data)
	        {        	
	        	alert(data);
	           //window.location.href = "pathTDS/Markattendence";	               
	        },
	         error: function(data){	     	   
	         		console.log("error");	        
	        }
	      }); 
        });
        
    });
    
 $("#emailRej").click(function(){
        
        $.each($("input[name='mail']:checked"), function(){
        	var appid =$(this).val();
        	$.ajax({
	        type: "POST",
	        url: "/pathTDS/mailExmRejectionsIndv",
	        data: {app: appid}, // pass userid to controller.
	        success: function(data)
	        {        	
	        	alert(data);
	           //window.location.href = "pathTDS/Markattendence";	               
	        },
	         error: function(data){	     	   
	         		console.log("error");	        
	        }
	      }); 
        });
        
    });
    
 
     function sendEmailApprovals(){   	  
 	   var exid=$("#exmid").val(); 	
	      $.ajax({
	        type: "POST",
	        url: "/pathTDS/mailExmApprovals",
	        data: {examId: exid}, // pass userid to controller.
	        success: function(data)
	        {	        	
	        	alert(data);
	           //window.location.href = "pathTDS/Markattendence";	               
	        },
	         error: function(data){	     	   
	         		console.log("error");	        
	        }
	      }); 
    }
    
    function sendEmailRejections(){ 
    	
 	    var exid=$("#exmid").val(); 	  
	      $.ajax({
	        type: "POST",
	        url: "/pathTDS/mailExmRejections",
	        data: {examId: exid}, // pass userid to controller.
	        success: function(data)
	        {        	
	        	alert(data);
	           //window.location.href = "pathTDS/Markattendence";	               
	        },
	         error: function(data){	     	   
	         		console.log("error");	        
	        }
	      }); 
    }   
   
    
    
</script>


<script>
    //document.getElementsById("${applicantData.approvalStatus}${applicantData.id}").selected = true;
    <c:forEach items="${applicantList}" var="applicantData" varStatus="myIndex">
        $("#applicantStatus${applicantData.id}").val('${applicantData.approvalStatus}');
       
    </c:forEach>
</script>


</html>
