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
                                            <c:out value="${applicantName}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Total Score:</b></label>&nbsp;&nbsp;
                                            <c:out value="${scoretotal}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>No.of Questions:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionNo}" />
                                        </td>
                                    </tr>

                                    <tr>

                                        <td height="25" align="left">
                                            <label><b>Exam Id:</b></label>&nbsp;&nbsp;
                                            <c:out value="${examId}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Maximum Score:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.getMaximum_score()}" /> </td>
                                        <td height="25" align="left">
                                            <label><b>No.ofQuestion Attempted:</b></label>&nbsp;&nbsp;
                                            <c:out value="${result.getQuestionsAttempted()}" /> 
                                        </td>

                                    </tr>

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Exam Class:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.getclassname()}" />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Score % required to pass:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.getPass_percentage()} %" />
                                            </b>
                                            </label>&nbsp;</td>
                                        <td height="25" align="left">
                                            <label><b>No.of correct answers:</b>&nbsp;&nbsp;</label>
                                            <c:out value="${result.getCorrectAnswers()}" />
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
                                            <c:out value="${result.getTotalScore()} " />
                                        </td>
                                        <td height="25" align="left">
                                            <label><b>Time Allowed:</b></label>&nbsp;&nbsp;
                                            <c:out value="${questionHeader.getTotal_time_allowed()}" /> Min </td>
                                    </tr>

                                    <tr>
                                        <td height="25" align="left">
                                            <label><b>Applicant Id:</b></label>&nbsp;&nbsp;
                                            <c:out value="${result.getApplicantId()} " />
                                        </td>

                                        <td id="test" height="25" align="left">
                                            <label><b>Score % obtained:</b>&nbsp;&nbsp;</label>
                                            <c:set var="Income" scope="session" value="${(result.totalScore / questionHeader.maximum_score)*100}" />
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
                                            <c:out value="${result.getQuestionPaperId()}" />
                                        </td>

                                        <td height="25" align="left">
                                            <label><b>Result:</b></label>&nbsp;&nbsp;
                                                                                       
                                            <c:if test="${result.status eq 'Failed'}">

                                                <font color="red">  <b><c:out value="${result.status}"/></b></font>
                                            </c:if>

                                            <c:if test="${result.status ne 'Failed'}">

                                                <font color="green">  <b><c:out value="${result.status}"/></b></font>
                                            </c:if>                                            
                                            

                                        </td>
                                         
                                    </tr>
                                </table>

                               

                            </div>
                            <br>
                            <br>
                            <hr>

                            <br>

                            <div class="card-body">
                                <div class="container-fuid">
                                    <table border="0" width="102%" cellpadding="0" style="table-layout: fixed;">
                                        <tr>
                                            <th height="25" width="10%" align="center" style=" text-align:center;font-size:18px;"><b>QNo. </b></th>
                                            <th height="25" width="70%" style="text-align:left;font-size:18px; padding-left:50px;"><b>Questions & Answers </b></th>
                                            <th height="25" width="10%" align="center" style=" text-align:center;font-size:18px;"><b>QnId </b></th>
                                            <th height="25" width="10%" align="right" style="text-align:center; font-size:18px;"><b>&nbsp;Score<br>Obtained</b></th>
                                            <th height="25" width="10%" align="right" style="text-align:center; font-size:18px;"><b>Score of<br>Question</b></th>

                                        </tr>


                                        <c:forEach items="${resultDetails}" var="resultD" varStatus="count">
                                           <c:forEach items="${questionbankList}" var="question" varStatus="count">
                                            <c:set var = "qnB"  value = "${question.getQuestionId()}"/>
                                            <c:set var = "qnR"  value = "${resultD.getQuestionId()}"/>
                                             <c:if test="${qnB==qnR}">
                                            <tr>
                                                <td align="center" height="60" >
                                                    <p style="font-size:16px;height:0px; ">
                                                      <b>
                                                        <c:out value="${count.index + 1}. "/>                                                        
                                                      </b>
                                                    </p>
                                                  &nbsp;&nbsp;
                                                </td>
                                                <td height="1" width="auto-width">
                                                    <p style="text-align:left;font-size:16px;white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word; ">
                                                     
                                                      <b>
                                                        <c:out value="${question.getQuestion()}"/>                                                      
                                                       
                                                         
                                                      </b>
                                                    </p>
                                                    <%-- <img src="${question.questionImg}"></img> --%>
                                                </td>
                                                <td align="center" height="1" >
                                                    <c:out value="${resultD.getQuestionId()}. "/>
                                                    
                                                </td>

                                                <td align="center" height="1" >
                                                    <c:out value="${resultD.getTotalScore()}"/> 
                                                    
                                                </td>
                                                <td align="center" height="1" >
                                                    <p style="font-size:16px; height:0px;">
                                                      <b>
                                                        <c:out value="${resultD.getQnScore()}"/>
                                                      </b>
                                                    </p>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <c:if test="${question.getQn_type() eq 'multiple'}">                                                 
                                               
                                                <c:if test="${resultD.getCorrectOption() eq 1}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${resultD.getCorrectOption()}."/>
                                                        <c:out value="${question.getOp1()}"/>
                                                        <img src="${question.getOptionImg1()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getCorrectOption() eq 2}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${resultD.getCorrectOption()}."/>
                                                        <c:out value="${question.getOp2()}"/>
                                                        <img src="${question.getOptionImg2()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getCorrectOption() eq 3}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${resultD.getCorrectOption()}."/>
                                                        <c:out value="${question.getOp3()}"/>
                                                        <img src="${question.getOptionImg3()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getCorrectOption() eq 4}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${resultD.getCorrectOption()}."/>
                                                        <c:out value="${question.getOp4()}"/>
                                                        <img src="${question.getOptionImg4()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getCorrectOption() eq 5}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Option:</label>
                                                        <c:out value="${resultD.getCorrectOption()}."/> 
                                                        <c:out value="${question.getOp5()}"/> 
                                                      </h5>
                                                    </td>
                                                </c:if> 
                                              </c:if>
                                              <c:if test="${question.getQn_type() eq 'descriptive'}">
                                                  <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Correct Answer:</label>
                                                        <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"> 
                                                        <c:out value="${resultD.getCorrectDesc()}."/>                                                        
                                                        </span>
                                                      </h5>
                                                    </td>
                                              </c:if>
                                            </tr>

                                            <tr>
                                                <td>

                                                </td>
                                               
                                         <c:if test="${question.getQn_type() eq 'multiple'}">                                                 
                                               
                                                 <c:if test="${resultD.getMarkedOption() eq 1}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Marked Option:</label>
                                                        <c:out value="${resultD.getMarkedOption()}."/>
                                                        <c:out value="${question.getOp1()}"/>
                                                        <img src="${question.getOptionImg1()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getMarkedOption() eq 2}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Marked Option:</label>
                                                        <c:out value="${resultD.getMarkedOption()}."/>
                                                        <c:out value="${question.getOp2()}"/>
                                                        <img src="${question.getOptionImg2()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getMarkedOption() eq 3}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Marked Option:</label>
                                                        <c:out value="${resultD.getMarkedOption()}."/>
                                                        <c:out value="${question.getOp3()}"/>
                                                        <img src="${question.getOptionImg3()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getMarkedOption() eq 4}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Marked Option:</label>
                                                        <c:out value="${resultD.getMarkedOption()}."/>
                                                        <c:out value="${question.getOp4()}"/>
                                                        <img src="${question.getOptionImg4()}"></img>
                                                      </h5>
                                                    </td>
                                                </c:if>

                                                <c:if test="${resultD.getMarkedOption() eq 5}">
                                                    <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Marked Option:</label>
                                                        <c:out value="${resultD.getMarkedOption()}."/>
                                                        <c:out value="${question.getOp5()}"/>
                                                      </h5>
                                                    </td>
                                                </c:if> 
                                              </c:if>
                                              <c:if test="${question.getQn_type() eq 'descriptive'}">
                                                  <td>
                                                      <h5 style="font-size:16px;">
                                                        <label>Marked Answer:</label>
                                                       <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"> 
                                                             <c:out value="${resultD.getMarkedDesc()}."/>  
                                                       </span>                                                            
                                                      </h5>
                                                    </td>
                                              </c:if>
                                            </tr>
                                            </c:if>
                                           </c:forEach>
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


