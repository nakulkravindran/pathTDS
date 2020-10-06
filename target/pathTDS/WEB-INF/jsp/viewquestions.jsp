<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
        <% 
response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server 
%>
          <div class="wrapper ">
            <div class="container-fluid">
              <!-- End Navbar -->
              <div class="panel-header panel-header-sm"></div>
              <div class="content">
                <div class="row">
                  <div class="col-md-12">
                    <div class="card">
                      <div class="card-header">
                        <h3 class="ribbon3" style="text-align: center;">
                          <hr> View Questions
                            <hr>
                            </h3>

                            <br>
                            <div class="row">
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
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <h5>
                                       <label>Question Paper Number</label><br>
                                       <c:out value="${questionPaperNumber}"/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <h5>
                                       <label>Maximum Score</label><br>
                                       <c:out value="${questionHeader.maximumScore}"/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <h5>
                                       <label>Maximum Time</label><br>
                                       <c:out value="${questionHeader.totalTimeAllowedForExam}"/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                      <h5>
                                        <label>Class</label><br>
                                        <c:out value="${questionHeader.className}"/>
                                      </h5>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                      <h5>
                                        <label>Total Score Of questions</label><br>
                                        <c:out value="${totalScoreOfQuestions}"/>
                                      </h5>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                      <h5>
                                        <label>Total Questions</label><br>
                                        <c:out value="${fn:length(questionsList)}"/>
                                      </h5>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                      <h5>
                                        <label>Pass Percentage</label><br>
                                        <c:out value="${questionHeader.passPercentage}"/>
                                      </h5>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                      <h5>
                                        <label>Total Time of Questions</label><br>
                                        <c:out value="${totalTimeOfQuestions}"/>
                                      </h5>
                                    </div>
                                </div>

                                <button class="btn btn-lg btn-info" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button>
                            </div>
                            <div class="card-body">
                              <div class="container-fuid">
                                <c:forEach items="${questionsList}" var="question" varStatus="count">
                                  <hr>
                                    <div class="row">
                                      <div class="col-md-8">
                                        <div class="form-group">
                                          <h5><c:out value="${count.index + 1}. "/> Question:&nbsp;
                                            <c:out value="${question.question}"/>
                                          </h5>
                                          <img src="${question.questionImg}" ></img>
                                        </div>
                                      </div>
                                      <div class="col-md-1">
                                         <div class="form-group">
                                           <h5>
                                             <label>Section</label>
                                           </h5>
                                           <p>
                                             <c:out value="${question.section}"/>
                                           </p>
                                         </div>
                                      </div>
                                      <div class="col-md-1">
                                         <div class="form-group">
                                           <h5>
                                             <label>Answer</label>
                                           </h5>
                                           <p>
                                             <c:out value="${question.correctAnswer}"/>
                                           </p>
                                         </div>
                                      </div>
                                      <div class="col-md-1">
                                        <div class="form-group">
                                          <h5>
                                            <label>Score</label>
                                          </h5>
                                          <p>
                                            <c:out value="${question.score}"/>
                                          </p>
                                        </div>
                                      </div>
                                      <div class="col-md-1">
                                        <div class="form-group">
                                          <h5>
                                            <label>Time(Sec) </label>
                                          </h5>
                                          <p>
                                            <c:out value="${question.allottedTime}"/>
                                          </p>
                                        </div>
                                      </div>
                                    </div>
                                    <c:if test="${(not empty question.option1) or (not empty question.optionImg1)}">
                                        <div class="row">
                                          <div class="form-group">
                                            <h5>
                                              <label>Option 1:</label>
                                              <c:out value="${question.option1}"/>
                                              <img src="${question.optionImg1}"></img>
                                            </h5>
                                          </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${(not empty question.option2) or (not empty question.optionImg2)}">
                                        <div class="row">
                                          <div class="form-group">
                                            <h5>
                                              <label>Option 2:</label>
                                              <c:out value="${question.option2}"/>
                                              <img src="${question.optionImg2}"></img>
                                            </h5>
                                          </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${(not empty question.option3) or (not empty question.optionImg3)}">
                                        <div class="row">
                                          <div class="form-group">
                                            <h5>
                                              <label>Option 3:</label>
                                              <c:out value="${question.option3}"/>
                                              <img src="${question.optionImg3}"></img>
                                            </h5>
                                          </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${(not empty question.option4) or (not empty question.optionImg4)}">
                                        <div class="row">
                                          <div class="form-group">
                                            <h5>
                                              <label>Option 4:</label>
                                              <c:out value="${question.option4}"/>
                                              <img src="${question.optionImg4}"></img>
                                            </h5>
                                          </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty question.option5}">
                                        <div class="row">
                                          <div class="form-group">
                                            <h5>
                                              <label>Option 5:</label>
                                              <c:out value="${question.option5}"/>
                                            </h5>
                                          </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
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
                <script src="js/viewQuestionsHelper.js"></script>

                <script>
                function printQuestions() {
                    window.print();
                }
                </script>
              </html>
