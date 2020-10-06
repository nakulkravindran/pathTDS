<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <div class="wrapper ">
        <div class="container-fluid">
            <!-- End Navbar -->
            <div class="panel-header panel-header-sm" style="height:60px;">
                <button class="btn btn-sm btn-info" style="margin-left:1380px;" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">

                        <div class="card" id="printarea" style="height:250px;">
                            <div class="card-header">
                                <h3 class="ribbon3" style="text-align: center;">

                          <hr> Answer Sheet
                            <hr>
                            </h3>

                                <!-- <div class="row">
                                <div class="col-md-6">
                                        <div class="form-group">
                                          <h5>
                                            <label>Enter Question Paper Number</label><br>
                                            <input list="questionPaperNumberList"  autocomplete="off" id="questionPaperNumber" name="questionPaperNumber" value="" class="form-control col-md-4" placeholder="Question Paper number...">
                                            <datalist id="questionPaperNumberList">
                                                <c:forEach items="${questionPaperNumberList}" var="questionPaperNumber" varStatus="myIndex">
                                                    <option value="${questionPaperNumber}"></option>
                                                </c:forEach>
                                            </datalist>
                                          </h5>
                                        </div>
                                </div>
                            </div> -->

                                <table border="0" width="100%" style="height:60px;">

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Candidate Name:</b></label>&nbsp;&nbsp;
                                            <c:out value="${finalResult.applicantName}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Total Score:</b></label>&nbsp;&nbsp;
                                            <c:out value="${scoretotal}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>No.of Questions:</b></label>&nbsp;&nbsp;
                                            <c:out value="${fn:length(questionsList)}" />
                                        </td>
                                    </tr>

                                    <tr>

                                        <td height="25" align="left">
                                            <label><b>Exam Id:</b></label>&nbsp;&nbsp;
                                            <c:out value="${finalResult.examId}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Maximum Score:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.maximumScore}" /> </td>
                                        <td height="25" align="left">
                                            <label><b>No.ofQuestion Attempted:</b></label>&nbsp;&nbsp;
                                            <c:out value="${finalResult.questionsAttempted}" />
                                        </td>

                                    </tr>

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Exam Class:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.className}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Score % required to pass:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.passPercentage} %" />
                                            </b>
                                            </label>&nbsp;</td>
                                        <td height="25" align="left">
                                            <label><b>No.of correct answers:</b>&nbsp;&nbsp;</label>
                                            <c:out value="${finalResult.correctAnswers}" />
                                        </td>
                                        <!--  <td height="25"align="left"> <label><b>Score Obtained:</b></label>&nbsp;&nbsp;<c:out value="${finalResult.totalScore} "/></td>
                               -->
                                    </tr>

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Exam Name:</b></label>&nbsp;&nbsp;
                                            <c:out value="${exmname}" />
                                        </td>

                                        <td height="25" align="left">
                                            <label><b>Score Obtained:</b></label>&nbsp;&nbsp;
                                            <c:out value="${finalResult.totalScore} " />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Time Allowed:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.totalTimeAllowedForExam}" /> Min </td>
                                    </tr>

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Applicant Id:</b></label>&nbsp;&nbsp;
                                            <c:out value="${finalResult.applicantId} " />
                                        </td>

                                        <td id="test" height="25" align="left">
                                            <label><b>Score % obtained:</b>&nbsp;&nbsp;</label>
                                            <c:set var="Income" scope="session" value="${(finalResult.totalScore/questionHeader.maximumScore)*100}" />
                                            <!--   <c:out value="${Income}"/>%-->
                                            <fmt:formatNumber maxIntegerDigits="3" value="${Income}" />% </td>

                                        <td height="25" align="left">
                                            <label><b>Time Utilised:</b></label>&nbsp;&nbsp;
                                            <c:out value="${timeTaken}" />
                                        </td>

                                    </tr>

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Question Paper Number:</b></label>&nbsp;&nbsp;
                                            <c:out value="${finalResult.questionPaperNumber}" />
                                        </td>

                                        <td height="25" align="left">
                                            <label><b>Result:</b></label>&nbsp;&nbsp;
                                            <c:if test="${finalResult.status eq 'Failed'}">

                                                <font color="red">  <b><c:out value="${finalResult.status}"/></b></font>
                                            </c:if>

                                            <c:if test="${finalResult.status ne 'Failed'}">

                                                <font color="green">  <b><c:out value="${finalResult.status}"/></b></font>
                                            </c:if>

                                        </td>

                                    </tr>
                                </table>

                                <!-- <div class="row" id="Cname" style="margin-left:40px;  height:35px;">
                            <div class="col-md-3">
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Candidate Name:</b></label>&nbsp;&nbsp;&nbsp;&nbsp;
                                       <c:out value="${finalResult.applicantName}"/>
                                       </h5>
                                    </div>
                                </div>

                                 <div class="col-md-3" id="totscore" style="margin-left:150px;" >
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Total Score:</b></label>&nbsp;
                                       <c:out value="${finalResult.totalScore}"/>
                                       </h5>
                                    </div>
                                </div>

                                 <div class="col-md-3"  style="margin-left:100px;">
                                    <div class="form-group">
                                       <h5>
                                       <label>No.of Questions:</label>&nbsp;
                                       <c:out value="${fn:length(questionsList)}"/>
                                       </h5>
                                    </div>
                                </div>
                                </div> -->
                                <!--  <div class="row"  id="Cname"style="margin-left:40px; height:35px;">
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Exam Id:</b></label>&nbsp;
                                       <c:out value="${finalResult.examId}"/>
                                       </h5>
                                    </div>
                                </div>
                                 <div class="col-md-3" style="margin-left:150px;">
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Pass Percentage:</b></label>&nbsp;
                                       <c:out value="${questionHeader.passPercentage} %"/>
                                       </h5>
                                    </div>
                                </div>

                                 <div class="col-md-3" style="margin-left:100px;" >
                                    <div class="form-group">
                                       <h5>
                                       <label>Time Allowed:</label>&nbsp;
                                      <c:out value="${questionHeader.totalTimeAllowedForExam}"/> Min
                                       </h5>
                                    </div>
                                </div>
                                </div>  -->
                                <!-- <div class="row"  style="margin-left:40px; height:35px;">
                                  <div class="col-md-3" >
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Exam Name:</b></label>&nbsp;
                                       <c:out value="${examName} "/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-3" style="margin-left:150px;" >
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Score Obtained:</b></label>&nbsp;
                                       <c:out value="${finalResult.totalScore} "/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-3" style="margin-left:100px;">
                                    <div class="form-group">
                                       <h5>
                                       <label>Time Utilised:</label>&nbsp;
                                       <c:out value="${timeTaken}"/>
                                       </h5>
                                    </div>
                                </div>
                                </div>  -->
                                <!-- <div class="row" style="margin-left:40px; height:35px;">

                                 <div class="col-md-3" >
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Exam Class:</b></label>&nbsp;
                                      <c:out value="${questionHeader.className}"/>
                                       </h5>
                                    </div>
                                </div>
                                 <div class="col-md-3" style="margin-left:150px;" >
                                    <div class="form-group">
                                       <h5>
                                       <label><b>% of score obtained:</b></label>&nbsp;
                                      <c:out value="${percentage}%"/>
                                       </h5>
                                    </div>
                                </div>
                                 <div class="col-md-3" style="margin-left:100px;" >
                                    <div class="form-group">
                                       <h5>

                                       <label>Result:</label>&nbsp;
                                         <c:if test="${finalResult.status eq 'Failed'}">

                                  <font color="red">  <c:out value="${finalResult.status}"/></font>
                                   </c:if>

                                        <c:if test="${finalResult.status ne 'Failed'}">

                                  <font color="green">  <c:out value="${finalResult.status}"/></font>
                                   </c:if>

                                       </h5>
                                    </div>
                                </div>
                                </div>  -->
                                <!--  <div class="row" style="margin-left:40px;height:35px;">
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Question Paper Number:</b></label>&nbsp;
                                       <c:out value="${finalResult.questionPaperNumber}"/>
                                       </h5>
                                    </div>
                                 </div>
                                <div class="col-md-3" style="margin-left:150px;">
                                    <div class="form-group">
                                       <h5>
                                       <label><b>Maximum Score:</b></label>&nbsp;
                                      <c:out value="${questionHeader.maximumScore}"/>
                                       </h5>
                                    </div>

                                </div>

                                <div class="col-md-3" style="margin-left:100px;">
                                    <div class="form-group">
                                       <h5>
                                       <label>Rank:</label>
                                       <c:out value="${finalResult.rank}"/>
                                       </h5>
                                    </div>
                                </div>

                              </div>  -->

                            </div>
                            <br>
                            <br>
                            <hr>

                            <br>

                            <div class="card-body">
                                <div class="container-fuid">
                                    <table border="0" width="102%" cellpadding="0">
                                        <tr>
                                            <th height="25" align="center" style=" text-align:center;font-size:18px; padding-left:0px; "><b>QNo. </b></th>
                                            <th height="25" style="text-align:center;font-size:18px; padding-left:50px;"><b>Questions & Answers </b></th>
                                            <th height="25" align="right" style=" font-size:18px; padding-right:30px;"><b>&nbsp;Score<br>Obtained</b></th>
                                            <th height="25" align="right" style=" font-size:18px; padding-right:10px;"><b>Score of<br>Question</b></th>

                                        </tr>


                                        <c:set var = "resultCount" scope = "request" value = "0"/>

                                        <c:forEach items="${questionsList}" var="question" varStatus="count">
                                            <tr>
                                                <td align="center" height="60" width="10">
                                                    <p style="font-size:16px;height:0px; ">
                                                      <b>
                                                        <c:out value="${count.index + 1}. "/>
                                                      </b>
                                                    </p>
                                                  &nbsp;&nbsp;
                                                </td>
                                                <td height="1" width="auto-width">
                                                    <p style="font-size:16px; height:0px; ">
                                                     
                                                      <b>
                                                        <c:out value="${question.question}"/>
                                                       
                                                       
                                                         
                                                      </b>
                                                    </p>
                                                    <img src="${question.questionImg}"></img>
                                                </td>

                                                <td align="center" height="1" width="10">
                                                    <p style="font-size:16px; height:0px; padding-right:50px;">
                                                      <b>
                                                        <c:choose>
                                                          <c:when test="${examResult[resultCount].questionId eq question.questionId}">
                                                            <c:if test="${question.correctAnswer == examResult[resultCount].selectedOption}">
                                                              <font color="green">  <c:out value="${question.score}"/></font>
                                                            </c:if>
                                                            <c:if test="${question.correctAnswer != examResult[resultCount].selectedOption}">
                                                              <font color="red">  <c:out value="0"/></font>
                                                            </c:if>
                                                          </c:when>

                                                          <c:otherwise>
                                                            <font color="red">  <c:out value="0"/></font>
                                                          </c:otherwise>
                                                        </c:choose>
                                                      </b>
                                                    </p>
                                                </td>
                                                <td align="center" height="1" width="10">
                                                    <p style="font-size:16px; height:0px;">
                                                      <b>
                                                        <c:out value="${question.score}"/>
                                                      </b>
                                                    </p>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td></td>

                                                <c:if test="${question.correctAnswer eq 1}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${question.correctAnswer}."/>
                                                        <c:out value="${question.option1}"/>
                                                        <img src="${question.optionImg1}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${question.correctAnswer eq 2}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${question.correctAnswer}."/>
                                                        <c:out value="${question.option2}"/>
                                                        <img src="${question.optionImg2}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${question.correctAnswer eq 3}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${question.correctAnswer}."/>
                                                        <c:out value="${question.option3}"/>
                                                        <img src="${question.optionImg3}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${question.correctAnswer eq 4}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${question.correctAnswer}."/>
                                                        <c:out value="${question.option4}"/>
                                                        <img src="${question.optionImg4}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${question.correctAnswer eq 5}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${question.correctAnswer}."/>
                                                        <c:out value="${question.option5}"/>
                                                      </h5>
                                                    </td>
                                                </c:if>
                                            </tr>

                                            <tr>
                                                <td>

                                                </td>
                                               
                                                <c:choose>
                                                 
                                                    <c:when test="${examResult[resultCount].questionId eq question.questionId}">
                                                        <c:if test="${examResult[resultCount].selectedOption eq 1}">
                                                            <td>
                                                              <h5 style="font-size:16px;">
                                                                <label>Marked Option:</label>
                                                                <c:out value="${examResult[resultCount].selectedOption}."/>
                                                                <c:out value="${question.option1}"/>
                                                                <img src="${question.optionImg1}"></img>
                                                              </h5>
                                                            </td>
                                                        </c:if>

                                                        <c:if test="${examResult[resultCount].selectedOption eq 2}">
                                                            <td>
                                                              <h5 style="font-size:16px;">
                                                                <label>Marked Option:</label>
                                                                <c:out value="${examResult[resultCount].selectedOption}."/>
                                                                <c:out value="${question.option2}"/>
                                                                <img src="${question.optionImg2}"></img>
                                                              </h5>
                                                            </td>
                                                        </c:if>

                                                        <c:if test="${examResult[resultCount].selectedOption eq 3}">
                                                            <td>
                                                              <h5 style="font-size:16px;">
                                                                <label>Marked Option:</label>
                                                                <c:out value="${examResult[resultCount].selectedOption}."/>
                                                                <c:out value="${question.option3}"/>
                                                                <img src="${question.optionImg3}"></img>
                                                              </h5>
                                                            </td>
                                                        </c:if>

                                                        <c:if test="${examResult[resultCount].selectedOption eq 4}">
                                                            <td>
                                                              <h5 style="font-size:16px;">
                                                                <label>Marked Option:</label>
                                                                <c:out value="${examResult[resultCount].selectedOption}."/>
                                                                <c:out value="${question.option4}"/>
                                                                <img src="${question.optionImg4}"></img>
                                                              </h5>
                                                            </td>
                                                        </c:if>

                                                        <c:if test="${examResult[resultCount].selectedOption eq 5}">
                                                            <td>
                                                              <h5 style="font-size:16px;">
                                                                <label>Marked Option:</label>
                                                                <c:out value="${examResult[resultCount].selectedOption}."/>
                                                                <c:out value="${question.option5}"/>
                                                              </h5>
                                                            </td>
                                                        </c:if>
                                                        <c:set var = "resultCount" scope = "request" value = "${resultCount + 1}"/>
                                                    </c:when>
                                            
                                                    <c:otherwise>
                                                        <td>
                                                          <h5 style="font-size:16px;">
                                                           
                                                            <label>Marked Option:</label>
                                                            <c:out value="Not Answerd"/>
                                                          </h5>
                                                        </td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                           </c:forEach>
                                    </table>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style tyle="text/css">
    @media print {
            #row1 {
                max-width: 100px;
            }
        }
    }
    </style>

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
<script src="js/viewQuestionsHelper.js"></script>

<script>
    function printQuestions() {
        var toPrint = document.getElementById('printarea');
        var popupWin = window.open('', '_blank', 'width=2480,height=3508');
        popupWin.document.open();

        popupWin.document.write("<br>");

        popupWin.document.write('<html><head><link rel="stylesheet" type="text/css" href="css/style.print.css"></head><body onload="window.print()" ><div id="pwrap" style=font-size:18;>' + toPrint.innerHTML + '</div>');

        popupWin.document.write('</body></html>');
        popupWin.document.close();
    }
</script>

</html>