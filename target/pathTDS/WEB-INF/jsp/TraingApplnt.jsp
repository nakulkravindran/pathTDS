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
                    <li >
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
                                  <label>Select any Training</label>
                                   <input list="paramList" autocomplete="off" id="trainingid" name="trainingid" class="form-control validate" placeholder="category" value=""  maxlength="30" >
                                                  <datalist id="paramList">
                                                    <c:forEach items="${paramList}" var="parameters" >
                                                   
                                                        <option value="${parameters.id}"><c:out value="${parameters.name }"/></option>
                                                       
                                                      
                                                         
                                                    </c:forEach>
                                                </datalist>          
                                   
                                  </div>
                                  <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Training ID :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${TrainingID}"/></span></p>
                                    </div>
                               </div> 
                                <div class="row">                                    
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Training Name :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${TrainingName}"/></span></p>
                                    </div>
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Training Location :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${TrainingLocation}"/></span></p>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Training Type :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${TrainingType}"/></span></p>
                                    </div>
                                    <div class="col-md-3">
                                        <br><br>
                                        <p style="color:#2CA8FF;font-weight:600;font-size:17px;">Start Date :<span style="color:red;font-weight:400;font-size:17px;">  <c:out value="${TrainingStartdt}"/></span></p>
                                    </div>
                                </div>

   
                                <div class="table-responsive">
                                    <table id="applicantTable" class="table table-sm">
                                        <thead class="text-primary" style="background-color: #3498db">
                                            <th>
                                                Sl.no
                                            </th>
                                            <th>
                                                Status
                                            </th>
                                         	<th hidden>
                                            	Approval Status
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
                                            
                                            <th hidden >
                                                Path Employee
                                                yes/no
                                            </th>
                                             <th hidden >
                                               Line Manager Approved
                                                yes/no
                                            </th>
                                            <th hidden >
                                              Remarks
                                            </th>
                                             <th hidden >
                                              Employee Id
                                            </th>
                                            <th hidden >
                                           		Line Manager Email ID
                                            </th>
                                              <th hidden >
                                          		Service Duration
                                            </th>
                                            
                                            <th hidden >
                                          		Date Registered
                                            </th>                        

                                        </thead>
                                        <form id="applicantApprovalForm">
                                        <tbody>
                                           <c:forEach items="${applicantList}" var="applicantData" varStatus="myIndex">
                                               <tr>
                                               <td >

                                                   <c:out value="${myIndex.index+1}"/>

                                               </td>
                                               <td>
                                                <select id="applicantStatus${applicantData.id}" class=".applicantStatus${applicantData.id}" name="${applicantData.id}" >
                                                   
                                                    <option id="status" ><c:out value="${applicantData.approvalStatus}"/></option>
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
                                               <td>
                                                    <c:out value="${applicantData.email}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.phoneNumber}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.jobTitle}"/>
                                               </td>
                                                <td>
                                                  <c:out value="${applicantData.department}"/>
                                               </td>
                                               <td>
                                                    <c:out value="${applicantData.lineManager}"/>
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
                                                  <c:out value="${applicantData.remarks}"/>
                                               </td>
                                                <td hidden >
                                                  <c:out value="${applicantData.employeid}"/>
                                               </td>
                                               <td hidden >
                                                  <c:out value="${applicantData.lineManagerEmail}"/>
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

                                <button class="btn btn-info" id="saveStatusBtn"  onclick="myFunction()">Save changes</button>
                                <button class="btn btn-success" id="export">Export</button>

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
<script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>

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

</script>





</html>
