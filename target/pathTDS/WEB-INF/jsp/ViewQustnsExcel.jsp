<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" /><%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
       
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
      <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>TDS</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
          <!-- CSS Files -->
          <link href="assets/css2/bootstrap.min.css" rel="stylesheet" />
          <link href="assets/css2/now-ui-dashboard.css?v=1.0.1" rel="stylesheet" />
          <!-- CSS Just for demo purpose, don't include it in your project -->
          <link href="assets/demo/demo.css" rel="stylesheet" />
        </head>
        
      <body>
        <div style="padding-left:1%";>
            <br/> <br/>
            	<button class="btn btn-success " onclick="exportRpt()"  id="exportRpt">Export to Excel</button>	
            <br/> <br/>
           <table id="MyTable" border="1px solid black" >
              <tr> <th colspan="3"><b>Question Paper Number</b></th> <td colspan="3"><c:out value="${questionpapermodel.getQuestionpaperid()}"/></td> </tr>
              <tr> <th colspan="3"><b>Class Name</b></th> <td colspan="3"><c:out value="${questionpapermodel.getclassname()}"/></td> </tr>
              <tr> <th colspan="3"><b>Total Score</b></th> <td colspan="3"><c:out value="${questionpapermodel.getTotal_score()}"/></td> </tr>
              <tr> <th colspan="3"><b>Maximum Score</b></th> <td colspan="3"><c:out value="${questionpapermodel.getMaximum_score()}"/></td> </tr>
              <tr> <th colspan="3"><b>Maximum Time(Min)</b></th> <td colspan="3"><c:out value="${questionpapermodel.getTotal_time_allowed()}"/></td> </tr>
              <tr> <th colspan="3"><b>No.of Questions</b></th> <td colspan="3"><c:out value="${questionpapermodel.getNo_of_question_for_evaluation()}"/></td> </tr>
           
              <tr>
                  <th><b>Question No.</b></th> <th><b>Question</b></th> <th><b>Question ID</b></th> <th><b>Score</b></th>
                  <th><b>Question Type</b></th> <th><b>Class</b></th> <th><b>Status</b></th> <th><b>Section</b></th>
                  <th><b>Time</b></th> <th><b>Area</b></th> <th><b>Difficulty Level</b></th> <th><b>Multiple Answer</b></th>
                  <th><b>Descriptive Answer</b></th> <th><b>Op1</b></th> <th><b>Op2</b></th> <th><b>op3</b></th>
                  <th><b>Op4</b></th> <th><b>op5</b></th>               
              </tr>
              
              <c:forEach items="${questionbankList}" var="question" varStatus="count">
                   <tr>
                   		<td><c:out value="${count.index + 1}. "/></td>
                   		<td><c:out value="${question.getQuestion()}"/></td>
                   		<td><c:out value="${question.getQuestionId()}"/></td>
                   		<td>
                   		 <c:forEach items="${questionpaperQn}" var="qn">
                          <c:if test="${qn.getquestionpaperid() == questionpapermodel.getQuestionpaperid()  && (qn.getQuestionbankid() == question.getQuestionId())}"> 
                            <c:out value="${qn.getScoreperquestion()}" />
                          </c:if>
                         </c:forEach>
                        </td>
                   		<td><c:out value="${question.getQn_type()}" /></td>
                   		<td><c:out value="${question.getClass_name()}" /></td>
                   		<td><c:out value="${question.getStatus()}" /></td>                   		
                   		<td><c:out value="${question.getSection()}"/></td>
                   		<td><c:out value="${question.getTime_per_question()}"/></td>
                   		<td><c:out value="${question.getArea()}"/></td>
                   		<td><c:out value="${question.getDifficultylevel()}"/></td>
                   		<td><c:out value="${question.getAnswer_multiple()}"/></td>
                   		<td><c:out value="${question.getAnswer_Descriptive()}"/></td>
                   		<td><c:out value="${question.getOp1()}"/></td>
                   		<td><c:out value="${question.getOp2()}"/></td>
                   		<td><c:out value="${question.getOp3()}"/></td>
                   		<td><c:out value="${question.getOp4()}"/></td>                   		
                   		<td><c:out value="${question.getOp5()}"/></td>
                   		
                   </tr>
              </c:forEach>
              
           </table>
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
                 $(document).ready(function(){
                	 
                 });
                 function exportRpt(){
                 	
             		$("#MyTable").table2excel({
             		       // exclude CSS class
             		       //exclude: ".noExl",
             		       name: "Worksheet Name",
             		       filename: "results" //do not include extension
             		     });
             		
             		
             }
                
                </script>
               



               
              </html>
