<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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

<script>
    function convertMinsToHrsMins(minutes) {
      var h = Math.floor(minutes / 60);
      var m = minutes % 60;
      h = h < 10 ? '0' + h : h;
      m = m < 10 ? '0' + m : m;
      var response;
      response = h + ':' + m;
      return response;
    }
</script>


<body class="">
    <div class="wrapper bcks2 ">
    <div class="container">
        
        
            <br>
            <div class="content">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                            <div class="ribbon3"><br>
                          
                                
                                
                               
                                
                                <table border="0" align="center" width="99%" cellpadding="-8">
                                <tr>
                               
                                <td align="left"> <img height="170" width="160"  src="assets/img//Corporate-academy-logo.png" alt="..."></td>
                               
                                <td align="left"  ><b>
                             
                              <h6><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Path Solutions<br><br>
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Corporate Academy<br><br>
                               Training Announcement</h6> </b><br><br></td>
                                <td></td><td></td><td></td><td></td>
                                </tr>
                                
                                </table>
                                </div>
                            <h5 class="ribbon">&nbsp;&nbsp;Applicant Registration</h5>
                                <div class="ribbon3" style="text-align: center;">
                                <hr>
                               &nbsp;&nbsp;  &nbsp;&nbsp; 
                              
                               <b>Training Name : </b> <br/> <br/> <c:out value="${trainingList.getName()}"/>
                                <hr>
                                
                                </div>
                            </div>
                            <div class="card-body">
                            <div class="row">
                            <div class="col-md-4">
                             <p style="color:#0652DD;margin-left:40px;" > Training location </p> <p style="margin-left:40px;"><c:out value="${trainingList.getLocation()}"/> </p>&nbsp;
                               </div>
                               
                               <div class="col-md-4">
                                <p style="color:#0652DD;margin-left:-20px;" > Training Start Date (yyyy-mm-dd) </p> <p style="margin-left:-20px;"><c:out value="${trainingList.getStartdt()}"/></p>
                               </div>
                               
                               <div class="col-md-4">
                               <p style="color:#0652DD">Last Date For Registration (yyyy-mm-dd)</p> <c:out value="${trainingList.getRegfinal()}"/>
                               </div>
                            </div>
                            <hr>
                            <div class="row">
                            <div class="col-md-4">
                               <p style="color:#0652DD;margin-left:30px;"> Training Period and Time </p> <p style="margin-left:30px;"><c:out value="${trainingList.getPeriod()}"/>&nbsp; &nbsp; </p>
                            </div>
                            <div class="col-md-4">
                                  <p style="color:#0652DD;margin-left:30px;"> Time Zone </p> <p style="margin-left:30px;"><c:out value="${trainingList.getTimezone()}"/>&nbsp; &nbsp; </p>
                            </div>   
                            <div class="col-md-4">
                                <p style="color:#0652DD">Training Language </p> <c:out value="${trainingList.getLanguage()}"/> &nbsp; 
                            </div>
                               
                            
                             </div><br>
                            <div class="jumbotron" >
                               
                               <p style="color:#0652DD;font-weight:400;font-size:17px;margin-top:-50px;padding-bottom: 10px;">Trainer Details</p> 
                               <p style="line-height: 2.0;word-break: normal;"><span style="color:#0652DD;padding-left: 5px;">Name of the Trainer: </span><c:out value="${trainingList.getTrainername()}"/></p>
                               <p style="line-height: 2.0;word-break: normal;"><span style="color:#0652DD;padding-left: 5px;">Trainer's Department: </span><c:out value="${trainingList.getDepartment()}"/></p>
                               <p style="line-height: 2.0;word-break: normal;"><c:out value="${trainingList.getDetails()}"/></p>
                                
                                                              
                                <p style="color:#0652DD;font-weight:400;font-size:17px;padding-bottom: 10px;">Who can register ?</p> <p style="line-height: 2.0;word-break: normal;"><c:out value="${trainingList.getWhocan()}"/></p>
                               <!--  <p style="color:#0652DD;font-weight:400;font-size:17px;">Other Details</p> <p style="line-height: 2.0;word-break: normal;"><c:out value="${examDetails.otherDetails}"/></p>
                               <p style="color:#0652DD;font-weight:400;font-size:17px;">Other Details</p><p style="line-height: 1.5;word-break: normal;"><c:out value="${examDetails.additionalInstructions1}"/></p>
                              -->  
                              
                              <p style="color:#0652DD;font-weight:400;font-size:17px;padding-bottom: 10px;">Other Details</p> <p style="line-height: 2.0;word-break: normal;"><c:out value="${trainingList.getOtherdeatils()}"/></p>
                               <!--   <p><c:out value="${examDetails.additionalInstructions1}"/>&nbsp;<c:out value="${examDetails.additionalInstructions2}"/>&nbsp;<c:out value="${examDetails.additionalInstructions3}"/>&nbsp;<c:out value="${examDetails.additionalInstructions4}"/>&nbsp;<c:out value="${examDetails.additionalInstructions5}"/>&nbsp;<c:out value="${examDetails.additionalInstructions6}"/>&nbsp;<c:out value="${examDetails.additionalInstructions7}"/>&nbsp;<c:out value="${examDetails.additionalInstructions8}"/>&nbsp;<c:out value="${examDetails.additionalInstructions9}"/></p>-->
                                <p style="color:#0652DD;font-weight:400;font-size:17px;padding-bottom: 10px;">Agenda</p> <p style="line-height: 2.0;word-break: normal;"><c:out value="${trainingList.getAgenda()}"/></p>
                               
                               <c:if test="${reglink eq 'enable'}">
								<br>
                                <a href="/pathTDS/TrainingRegistration?traingid=${trainingList.id}"><button class="btn btn-info" id="applicantRegisterButton">Click here to register</button></a>
                               </c:if>
                               
                               <c:if test="${reglink eq 'disable'}">
                               <br>
								  <p style="color:red;font-weight:400;font-size:23px;text-align: center;"><b> Cannot register, Registration period is over. </b></p>							  
                               </c:if>
                               
                            </div>
                    </div>
                 </div>
                   
                </div>
            </div>
            
            <footer class="footer">
                <div class="container-fluid"><br>
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


</html>
