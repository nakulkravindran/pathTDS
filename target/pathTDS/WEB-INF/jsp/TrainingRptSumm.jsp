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
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                                <h5 class="title">Summary Report </h5>
                                
                            </div>
                            <div class="card-body" >
                                
                                <%-- <div class="row">
                                <div class="col-md-3"> <span class="text-info">Training ID</span></div>
                                <div class="col-md-3">        
                                            <input list="trainingList"  autocomplete="off"  id="trainingNumber" name="trainingNumber" value="" class="form-control col-md-4"  placeholder="Training ID">
                                            <datalist id="trainingList">
                                                <c:forEach items="${trainingLst}" var="training" varStatus="myIndex">
                                                   <option value="${training.getId()}">${training.getName()}</option>                                                  
                                                </c:forEach>
                                            </datalist>                                        
                                </div>
                                </div> --%>
                                <div class="row"> <div class="col-md-10"> </div> 
                                 	<div class="col-md-2"> <button class="btn btn-sm btn-success"   id="exportRpt">Export to Excel</button>  </div>
                                </div>
                                <div class="row"> <div class="col-md-12"> </div> </div>
                                                                
                                <c:if test="${chk eq 'false'}">
                                <div class="row" style="padding-top: 5px;padding-bottom: 5px;">
                                    <div class="col-md-2"><span class="text-info"> Training ID :</span></div>
                                    <div class="col-md-2">   
                                        <span style="color:red"><c:out value="${trainingModel.getId()}"/></span> 
                                    </div>  
                                    <div class="col-md-2 text-info" style="text-align: right;">Training Name:</div>
                                	<div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getName()}"/></span></div>                                                           
                                    <div class="col-md-2"> <span class="text-info"> Total Number of attendees : </span></div>
                                    <div class="col-md-2">
                                       <span style="color:red"> <c:out value="${totAttnds}"/></span> 
                                    </div>
                                </div>    
                                <div class="row" style="padding-top: 5px;padding-bottom: 5px;"> 
                                    <div class="col-md-2"><span class="text-info"> Training Name :</span></div>
                                    <div class="col-md-2">   
                                        <span style="color:red"><c:out value="${trainingModel.getName()}"/></span> 
                                    </div>   
                                    <div class="col-md-2 text-info" style="text-align: right;">Trainer Name:</div>
                                	<div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getTrainername()}"/></span></div>                                                          
                                    <div class="col-md-2"> <span class="text-info"> Response received : </span></div>
                                    <div class="col-md-2">
                                       <span style="color:red"><c:out value="${responseRcvd}"/></span> 
                                    </div>
                                </div>    
                                <div class="row" style="padding-top: 5px;padding-bottom: 5px;">  
                                	<div class="col-md-2"><span class="text-info"> Training Start Date :</span></div>
                                    <div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getStartdt()}"/></span></div>
                                    <div class="col-md-2 text-info" style="text-align: right;">Trainer Dept:</div>
                                	<div class="col-md-2"><span style="color:red"><c:out value="${trainingModel.getDepartment()}"/></span></div>                                
                                    <div class="col-md-2">
                                        <span class="text-info">   Response Pending :   </span>
                                    </div>
                                    <div class="col-md-2">                                      
                                      <span style="color:red">  <c:out value="${responsePnd}"/> </span> 
                                    </div>                                  
                                    
                                </div>
                                <div class="row" style="padding-top: 20px;padding-bottom: 5px;">  
                                	<div class="col-md-2 text-info">Ratings:</div>
                                	<div class="col-md-10"> <span style="color:red">
                                    <c:forEach items="${prmLst}" var="prm" varStatus="myIndex">
                                     	
                                  		<c:out value="${prm.prm_sort}-${prm.prm_shortname}"/> &nbsp;&nbsp;&nbsp;
                                      </c:forEach> </span>
                                </div>  
                                </div>
                                
                                <!--<div class="col-md-10">
                                    <button class="btn btn-primary btn-block" >SEARCH</button>
                                </div> -->
                                
                              <br/>
                                <div class="table-responsive ">
                                    <table id="MyTable" class="table table-bordered " style="width:100%;table-layout:fixed;">
                                                                          
                                        <tbody style="text-align: center;">
                                        <tr hidden><td><b>Training ID :</b></td> <td><c:out value="${trainingModel.getId()}"/></td>   <td><b> Training Name:</b></td> <td><c:out value="${trainingModel.getName()}"/></td>                    <td><b>Total Number of attendees :</b></td> <td><c:out value="${totAttnds}"/></td></tr>
                                        <tr hidden ><td><b>Training Name :</b></td> <td><c:out value="${trainingModel.getName()}"/></td>    <td><b> Trainer Name:</b></td> <td><c:out value="${trainingModel.getTrainername()}"/></td>             <td><b>Response received :</b></td> <td><c:out value="${responseRcvd}"/></td></tr>
                                        <tr hidden ><td><b>Training Start Date :</b></td> <td><c:out value="${trainingModel.getStartdt()}"/></td>   <td><b> Trainer Dept:</b></td> <td><c:out value="${trainingModel.getDepartment()}"/></td>      <td><b>Response Pending :</b></td> <td><c:out value="${responsePnd}"/></td></tr>
                                        
                                         <c:set var="trainingID" value="${trainingModel.getId()}"/>
                                        
                                        <c:forEach items="${Training}" var="tra1" >
                                          <c:if test="${tra1.getType() eq 'section'}">
                                             <tr style="background-color:#D6EAF8;">
                                                  <td style="width:800px;text-align:left;"><b><c:out value="${tra1.getName() }"/></b></td>
                                                  <td colspan="2" style="text-align:right;"><b>Section Score</b></td>
                                         		  <%-- <td><c:out value="${tra1.getAvgScore() }"/></td> --%>
                                         		  <td><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${tra1.getAvgScore()}"/></td>
                                             </tr>
                                             <tr>
                                               <td style="width:800px;"> &nbsp; </td>
                                               <td style="width:50px;"><b>No. of Ratings</b></td>
                                               <td style="width:50px;"><b>Total Score</b></td>
                                               <td style="width:50px;"><b>Average Score</b></td>
                                               
                                            </tr>
                                                 <c:forEach items="${Training}" var="tra2" >
                                                    <c:set var="tra1Id" value="${tra1.getId()}"/>
                                        		    <c:set var="tra2SectionId" value="${tra2.getSectionId()}"/>                                        		
                                                    <c:if test="${tra2.getType() eq 'question' && tra1Id eq tra2SectionId}">
                                                    <tr>
                                                       <td style="width:800px;text-align:left;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${tra2.getName() }"/></td>
                                                       
                                         		       <td style="width:50px;"><fmt:formatNumber type="number" maxFractionDigits="0" minFractionDigits="0" value="${tra2.getRatings()}"/></td>
                                         		       <td style="width:50px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${tra2.getTotScore()}"/></td>
                                         		       <td style="width:50px;"><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${tra2.getAvgScore()}"/></td>
                                         		    </tr>   
                                                    </c:if>
                                                 </c:forEach>
                                           </c:if>
                                        </c:forEach>
                                        
                                        
                                    <c:forEach items="${traheader2ModelD}" var="trahdr2Mdl" varStatus="count2">
                                      <tr style="background-color:#D6EAF8;">                                         
                                         <td colspan="4" style="text-align: left;"><b><c:out value="${trahdr2Mdl.getSection() }"/></b></td>                                         
                                      </tr>
                                      
                                      <c:forEach items="${traheader3ModelLst}" var="trahdr3Mdl" varStatus="count4">
                                        <c:set var="trahdr2MdlID" value="${trahdr2Mdl.getId()}"/>
                                        <c:set var="trahdr3Mdltra2id" value="${trahdr3Mdl.getTra2id()}"/>
                                        <c:set var="trahdr3MdlId" value="${trahdr3Mdl.getId()}"/>
                                        <c:if test="${trahdr2MdlID eq trahdr3Mdltra2id }">
                                             <tr>                                               
                                             	 <td colspan="4" style="padding-left: 20px;text-align: left;word-wrap:break-word;-ms-word-wrap:break-word; overflow-wrap:break-word;"><b><c:out value="${trahdr3Mdl.getQuestion() }"/></b></td> 
                                             </tr>	 
                                             	                                   
                                             	 <c:forEach items="${EvaluationModel}" var="evalM" varStatus="evalIndex">                                              	                                     	   
                                             	   
                                                    <c:set var="evalTraID" value="${evalM.getTrainingId()}"/>
                                                    <c:set var="evalQnID" value="${evalM.getQuestionId()}"/>
                                             	  		<c:if test="${trainingID eq evalTraID  && trahdr3MdlId eq evalQnID}">
                                             	  		 <tr><td colspan="4" style="padding-left: 60px;text-align: left;">  <c:out value="${evalM.getRatingComments() }"/> </td> </tr>
                                             	  		</c:if>
                                             	 </c:forEach> 
                                             	
                                             	                                     	 
                                               
                                        </c:if>
                                      </c:forEach> 
                                    </c:forEach> 
                                        
                                          
                                     </tbody>
                                        
                                    </table>
                                 </div>   
                                    <!-- <button class="btn btn-sm btn-success"   id="export">Export Result</button> -->
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

<script src="assets/js/jquery.table2excel.min.js"></script>
<script>

 $("#exportRpt").click(function(){
     $("#MyTable").table2excel({
       // exclude CSS class
       //exclude: ".noExl",
       name: "Worksheet Name",
       filename: "results" //do not include extension
     });
   });

</script>
<script>
$("#trainingNumber").change(function(){

    var tainingId = $("#trainingNumber").val();  		

    window.location.href = "/pathTDS/TrainingRptSumm?traId=" + tainingId;

});


</script>




</html>
