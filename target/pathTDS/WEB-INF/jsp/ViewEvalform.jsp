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
        <% 
response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server 
%>
            <div class="container-fluid">
              <!-- End Navbar -->
              
              <div class="panel-header panel-header-sm">
          
              </div>
              <div class="content">
              
                <div class="row" >
                  <div class="col-md-12">
                    <div class="card">
                    <div class="ribbon4">
                    <div class="row">
                    <div class="col-md-4">
                    <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                  
                    <button class="btn btn-sm btn-info" id="printButton" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button>
                 
                       
                                   
                            
                    </div>
                    <div class="col-md-7">
                       
                    </div>
                    <div class="col-md-1"><br>
                        
                     <a   href="/pathTDS/logout"><font color="white">Logout</font></a>
                    
                      </div>
                    </div>
                    <!-- <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                    <a href="/manageQuestions" class="btn btn-sm btn-info">Questions</a>
                    <button class="btn btn-sm btn-danger" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button> -->
                    </div>
                    <div id="printarea">
                     <div>
                      <div class="card-header">

                       <div id="headding"> <p class="ribbon2" style="height: 50px; padding-top:15px;" >

                       View Training Evaluation <hr>
                            </p></div>

                            <br>
                             
                            <div class="row">
                                <div class="col-md-6">
                                        <div class="form-group" id="questNumList">
                                        

                                            <label> Select Form Number</label>
                                            <input list="Traininglist"  autocomplete="off"  id="trainingview" name="trainingview" value="" class="form-control col-md-4"  placeholder="Question Paper Number">
                                            <datalist id="Traininglist">
                                                <c:forEach items="${Traininglist}" var="questionPaperNumber" varStatus="myIndex">
                                                   <option value="${questionPaperNumber.id}"></option>
                                                  
                                                </c:forEach>
                                            </datalist>
                                        </div>
                                </div>
                            </div>
               
                            <div class="row" id="hederDetails">
                             <div class="col-md-2" id="qestnno">
                                    <div class="form-group">
                                       <h5 >
                                       <label>Form No</label><br>
                                       <c:out value="${Training.id}"/>
                                       </h5>
                                    </div>
                                </div>
                                <div class="col-md-2" id="qestnno">
                                    <div class="form-group">
                                       <h5 >
                                       <label>Form Name</label><br>
                                       <c:out value="${Training.formName}"/>
                                       </h5>
                                    </div>
                                </div>
                                 <div class="col-md-2" id="class">
                                    <div class="form-group">
                                      <h5>
                                        <label>Details</label><br>
                                        <c:out value="${Training.details}"/>
                                      </h5>
                                    </div>
                                </div>
                                
                            
                              
                               
                            </div>
                          
                            </div><hr class="ribbon2" id="hr1">
                            </div>
                           
                            <div class="card-body" >
                              <div class="container-fuid">
                              
                               <c:forEach items="${trainingDetails}" var="formdetails" >
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group" >
                                          <p style="text-align: left ;align : justify; font-weight:510;line-height: 1.3;">
                                            <c:out value="${formdetails.section}"/>
                                      
                                          </p>
                                          
                                       	</div>
                                        </div>
                                     
                                      
                                        </div>
                                 </c:forEach>
                            
                                <c:forEach items="${questionsList}" var="question" varStatus="count">

                                    <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group" >
                                          <p style="text-align: left ;align : justify; font-weight:510;line-height: 1.3;"><c:out value="${count.index + 1}. "/> <span style="color: red">Q: </span>&nbsp;
                                            <c:out value=""/>
                                      
                                          </p>
                                          
                                       	</div>
                                        </div>
                                     
                                      
                                        </div>
                                         </c:forEach>
                                            
                                    </div>
                                   </div>
                                  
                                   
                                    <hr id="hr2">
                               
                              </div>
                                <style type="text/css">
                 @media print {
                 
                 
                   
                  #deleteButton {
                   display: none;
                  }
                  #hr1{
                   display: none;
                  }
                  
                   div {

      margin-top: -11px;
      margin-bottom: -11px;
      padding-left: 1px;


         }

                  #questNumList{
                  display: none;
                  }
                  #headding{
                   display: none;
                  }

                 #qestnno{
                  display: inline-block;
                  padding: 20px;
                   font-size: 24px;
                  list-style-type: none;
                 text-align: center;
                 margin-top: 0px;
                 line-height: 1.1;
                  padding-bottom:5px;
                  }
                  #class{
                   display: inline-block;
                    padding: 20px;
                  font-size: 24px;
                   list-style-type: none;
                   text-align: center;
                     line-height: 1.0;
                     padding-bottom:5px;
                  }
                  #maxscre{
                  display: inline-block;
                   padding: 20px;
                   font-size: 24px;
                   list-style-type: none;
                   text-align: center;
               line-height: 1.0;
               padding-bottom:5px;
                  }
                  #maxtime{
                  display: inline-block;
                   padding: 20px;
                  font-size: 24px;
                   list-style-type: none;
                   text-align: center;
                    line-height: 1.0;
                     padding-bottom:5px;
                  }
                  #section{
                   display: inline-block;

                  padding: 15px;
                  font-size: 20px;
                  text-align:center;
                   line-height: 1.0;
                  }
                  #answer{
                  display: inline-block;
                   padding: 15px;
                  font-size: 20px;
                  text-align:center;
                   line-height: 1.0;
                  }
                  #score{
                  display: inline-block;
                   padding: 15px;
                  font-size: 20px;
                  text-align:center;
                   line-height: 1.0;
                  }
                  #time{
                  display: inline-block;
                   padding: 15px;
                  font-size: 20px;
                 text-align:center;
                  line-height: 1.0;
                  }

                }
                </style>
                                  
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
                
                <script src="js/EvalForm.js"></script>
               

                




                <script>
                function printQuestions() {
                	 var toPrint = document.getElementById('printarea');
                     var popupWin = window.open('', '_blank', 'width=2480,height=3508');
                    popupWin.document.open();

                   // popupWin.document.write("<br>");
                    popupWin.document.write("<p style=text-align:center;font-size:30><b>Questions & Answers</b></p>");
                   
                    popupWin.document.write("<hr></hr>");
                    popupWin.document.write('<html><head><link rel="stylesheet" type="text/css" href="css/style.print.css"></head><body onload="window.print()" ><div id="pwrap" style=font-size:18;line-height: 0.5;>' +toPrint .innerHTML + '</div>');

                    popupWin.document.write('</body></html>');
                   popupWin.document.close();
                }
                </script>
              </html>
