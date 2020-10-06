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

<style>
    .hideData{
        display : none;
    }
</style>

<body class="">
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
                <div class="row" >
                    <div class="col-md-12">
                        <div class="card scrollmenu">
                            <div class="card-header">
                                <h5 class="title">Evaluation Report </h5>
                                
                            </div>
                            <div class="card-body" style="height:auto; ">
                                
                                <div class="row">
                                <div class="col-md-3"> <span class="text-info">Training ID </span></div>
                                <div class="col-md-8">        
                                            <input list="trainingList"  autocomplete="off"  id="trainingNumber" name="trainingNumber" value="" class="form-control col-md-4"  placeholder="Training ID">
                                            <datalist id="trainingList">
                                                <c:forEach items="${trainingLst}" var="training" varStatus="myIndex">
                                                   <option value="${training.getId()}">${training.getName()}</option>                                                  
                                                </c:forEach>
                                            </datalist>                                        
                                </div>
                                </div>
                                <br/>
                                <div class="row"> <div class="col-md-12"> </div> </div>
                                <div class="row" style="padding-top: 5px;padding-bottom: 5px;">
                                    <div class="col-md-2"><span class="text-info"> Training ID :</span></div>
                                    <div class="col-md-2">   
                                        <span style="color:red"><c:out value="${trainingModel.getId()}"/></span> 
                                    </div>  
                                    <div class="col-md-2"><span class="text-info"> Trainer Name :</span></div>
                                    <div class="col-md-2">   
                                        <span style="color:red"><c:out value="${trainingModel.getTrainername()}"/></span> 
                                    </div>                                                        
                                    <div class="col-md-2"> <span class="text-info"> Total Number of attendees : </span></div>
                                    <div class="col-md-2">
                                       <span style="color:red"> <c:out value="${totAttnds}"/></span> 
                                    </div>
                                </div>    
                                <div class="row" style="padding-top: 5px;padding-bottom: 5px;"> 
                                    <div class="col-md-2"><span class="text-info"> Training Name :</span></div>
                                    <div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getName()}"/></span> </div>
                                    <div class="col-md-2"><span class="text-info"> Training Dept :</span></div>
                                    <div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getDepartment()}"/></span> </div>                                    
                                    <div class="col-md-2"> <span class="text-info"> Response received : </span></div>
                                    <div class="col-md-2">
                                       <span style="color:red"><c:out value="${responseRcvd}"/></span> 
                                    </div>
                                </div>    
                                <div class="row" style="padding-top: 5px;padding-bottom: 5px;">  
                                	<div class="col-md-2"><span class="text-info"> Training Start Date :</span></div>
                                    <div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getStartdt()}"/></span></div>    
                                    <div class="col-md-2"><span class="text-info"> Training Period :</span></div>
                                    <div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getPeriod()}"/></span></div>    
                                    
                                    <div class="col-md-2">
                                        <span class="text-info">   Response Pending :   </span>
                                    </div>
                                    <div class="col-md-2">                                      
                                      <span style="color:red">  <c:out value="${responsePnd}"/> </span> 
                                    </div>
                                   
                                    
                                </div>
                                <!--<div class="col-md-10">
                                    <button class="btn btn-primary btn-block" >SEARCH</button>
                                </div> -->
                                
                            
								<div class="row">  
                                	<div class="col-md-4">Attendees</div>
                                </div>	

                                <div class="table-responsive">
                                    <table id="MyTable" class="table table-sm" >
                                        <thead id='headers' class=" text-primary" style="background-color: #3498db">
                                        <tr>
                                            <th style="text-align:left;">
                                                Sl#
                                            </th>
                                            <th style="text-align:left;">
                                                Trainee Name
                                            </th>
                                            <th style="text-align:left;">
                                                Bank/Company
                                            </th>                                            
                                            <th style="text-align:left;">
                                                Country
                                            </th>
                                            <th style="text-align:left;">
                                                Department
                                            </th>                                          
                                            <th style="text-align:left;">
                                                Email ID
                                            </th>
                                            <th style="text-align:left;">
                                            
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody style="text-align: left;">
                                            <c:forEach items="${TrainingRegstrationModel}" var="traReg" varStatus="myIndex">
                                                <tr>
                                                   	<td><c:out value="${myIndex.index + 1}. "/></td>
                                                   	<td><c:out value="${traReg.getCandidateName()}"/></td>
                                                   	<td><c:out value="${traReg.getCompanyName()}"/></td>
                                                   	<td><c:out value="${traReg.getLocation()}"/></td>
                                                    <td><c:out value="${traReg.getDepartment()}"/></td>
                                                    <td><a href="mailto:${traReg.getEmail()}"><c:out value="${traReg.getEmail()}"/></a></td>                                                
                                                    <c:set var="chk" value="false"/>
                                                     <c:forEach items="${EvaluationModel}" var="evalM" varStatus="Indx">
                                                    	<c:set var="evalRegID" value="${evalM.getTrainingRegistrationId()}"/>
                                        				<c:set var="traRegID" value="${traReg.getId()}"/>
                                        				<c:if test="${traRegID eq evalRegID && chk eq 'false'}">                                        				
                                         				   <td> <a href="/pathTDS/TrainingRptIndv?traId=${trainingModel.getId()}&traRegId=${traReg.getId()}">Evaluation Sheet</a>  </td> 
                                         				  
                                         				  <c:set var="chk" value="true"/>
                                         				</c:if>
                                                    </c:forEach>
                                                    <c:if test="${ chk eq 'false'}"><td hidden> No </td> </c:if>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                 </div>   
                                    <!-- <button class="btn btn-sm btn-success"   id="export">Export Result</button> -->
                                   
                                   <c:if test="${chkEval eq 'false'}"> 
                                    <div class="row">  
                                   	 <div class="col-md-2">
                                    	<button onclick='expRpt("${trainingModel.getId()}")' class="btn btn-sm btn-success"   id="exportRpt">View Report</button>
									   </div>
									   <div class="col-md-2">
                                    	<button onclick='summRpt("${trainingModel.getId()}")'  class="btn btn-sm btn-success"   id="summRpt">View Summary Report</button>
									   </div>	 
									   <div class="col-md-2">
									     <button class="btn btn-sm btn-success" onclick="exportRpt()"  id="exportRpt">Export to Excel</button>							   
									   </div>
									</div>
								  </c:if>
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

<script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script>
 
function expRpt(tainingId){
	window.location.href = "/pathTDS/TrainingRptExp?traId=" + tainingId;
}
function summRpt(tainingId){
	window.location.href = "/pathTDS/TrainingRptSumm?traId=" + tainingId;
}

function exportRpt(){
		$("#MyTable").table2excel({
		       // exclude CSS class
		       //exclude: ".noExl",
		       name: "Worksheet Name",
		       filename: "results" //do not include extension
		     });
}
</script>
<script>
$("#trainingNumber").change(function(){

    var tainingId = $("#trainingNumber").val();  		

    window.location.href = "/pathTDS/TrainingRptEv?traId=" + tainingId;

});


</script>




</html>
