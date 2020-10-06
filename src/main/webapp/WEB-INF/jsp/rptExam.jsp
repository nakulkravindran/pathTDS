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
                    <div class="card"  style="height: auto;">
                    <div class="ribbon4">
                    <div class="row">
                    <div class="col-md-4">
                    <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                    <a href="/pathTDS/Questionsbank" class="btn btn-sm btn-info">Question Bank</a>
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
                    <div >
                     <div>
                      <div class="card-header">

                       <div id="headding"> <p class="ribbon2" style="height: 50px; padding-top:15px;" >

                          Certificate Exam Report<hr>
                            </p></div>

                            <br>
                            
                            <div class="row " style="margin-top: -1vw">
                                                               
                                 <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Class Name</b></label>
                                        <input list="qnclass"  autocomplete="off"  id="class" name="class"  class="form-control col-md-8" value="${classname}" placeholder="Class">
                                           <datalist id="qnclass">
                                                  <c:forEach items="${qnclass}" var="qnclass" >
                                                    <c:if test="${qnclass.prm_type eq 'class'}">
                                                      
                                                    	<option value="${qnclass.prm_shortname}">${qnclass.prm_name}</option>                                                       
                                                  
                                                     </c:if>
                                                  </c:forEach>
                                           </datalist>                                      
                                    </div>
                                </div>
                                <div class="col-md-3"  >
                                    <div class="form-group">
                                       <label><b>Date From:</b></label>                                    
                                       <input id="frmDate" name="frmDate" type="Date" class="form-control col-md-8" placeholder="Date From"   value="${frmdate }">
                                    </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>To Date:</b></label>                                    
                                       <input id="toDate" name="toDate" type="Date" class="form-control col-md-8" placeholder="To Date"   value="${todate }">
                                    </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Company</b></label>
                                        <input type="text"  id="company" name="company"  class="form-control col-md-8" placeholder="company" value="${company }">
                                                             
                                    </div>
                                </div>
                              </div> 
                              <br/> --
                            
                            <div class="row " style="margin-top: -1vw">
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Country</b></label>
                                        <input type="text"  id="country" name="country"  class="form-control col-md-8" placeholder="country" value="${country }">
                                                             
                                    </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Department</b></label>
                                        <input type="text"  id="department" name="department" value="" class="form-control col-md-8" placeholder="department" value="${department }">
                                                             
                                    </div>
                                </div>
                                <div class="col-md-3" >
                                    <div class="form-group">
                                       <label><b>Candidate name</b></label>
                                        <input type="text"  id="name" name="name" value="" class="form-control col-md-8" placeholder="name" value="${name }">
                                                             
                                    </div>
                                </div>
                                                            
                                <div class="col-md-3">
                                    <div class="form-group">
                                       <label><b>Show</b></label>
                                        <input list="show"  autocomplete="off"  id="qnshow" name="qnshow" value="${show }" class="form-control col-md-8" onblur="qusnValidate();" placeholder="show">
                                            <datalist id="show">                                                   
                                                   <option value="Passed"></option>
                                                   <option value="Failed"></option>
                                                   <!-- <option value="Both" ></option> --> 
                                                   <option value="Not Attended" ></option>
                                                   <option value="All" ></option>                                               
                                            </datalist>
                                             
                                      
                                    </div>
                                </div>                                
                              </div>  
                              <%-- <div class="row " style="padding-top:5px;">  
                                     <div class="col-md-3">
                                    <div class="form-group">
                                       <label><b>Show Registered but not attended</b></label>
                                        <input list="registered"  autocomplete="off"  id="qnregistered" name="qnregistered" value="${registered }" class="form-control col-md-8" onblur="qusnValidate();" placeholder="registered">
                                            <datalist id="registered">                                                   
                                                   <option value="yes"></option>
                                                   <option value="no"></option>                                                                                              
                                            </datalist>
                                             
                                      
                                    </div>
                                </div>      --%>                         
                                
                              </div> 
                               <div class="row " style="margin-top: -1vw">                                  
                                <div class="col-md-6"><span id="errDt" style="color: red;font-weight: bold;"></span></div>
                                <div class="col-md-6"><span id="errQn" style="color: red;font-weight: bold;"></span></div>
                               </div> 
                              <br/>
                              <div class="row " style="margin-top:5px;">                                  
                                <div class="col-md-3"></div>
                                    <div class="form-group col-md-6" style="text-align: center;">
                                        <button type="button"  name="search" id="search" class="btn btn-primary col-md-3">Search</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                    	<button class="btn btn-success col-md-3" onclick="exportRpt()"  id="exportRpt">Export to Excel</button>							   
									  
                                    </div>
                                <div class="col-md-3"></div>                               
                             </div>
                             <br/>
                           
 
                            
                            </div><hr style="margin-top: -1vw" class="ribbon2" id="hr1" >
                            </div>
                           
                            <div class="card-body" id="printarea" >
                              <div class="container-fuid">
                              	<!--excel table start here -->
					
					 	<div class="table-responsive"  >
                              <table id="MyTable" class="table table-striped table-bordered table-sm" >
                                        <thead id='headers' class=" text-primary" style="background-color: #3498db;">
                                        <tr>
                                            <th style="text-align:left;color:white;">
                                                Sl#
                                            </th>
                                            <th style="text-align:left;color:white;">
                                                Exam Class
                                            </th>
                                            <th style="text-align:left;color:white;">
                                                Exam ID
                                            </th>                                            
                                            <th style="text-align:left;color:white;">
                                                Date Of Exam
                                            </th>
                                            <th style="text-align:left;color:white;">
                                                Name of Candidate
                                            </th>                                          
                                            <th style="text-align:left;color:white;">
                                                Job Title
                                            </th>
                                            <th style="text-align:left;color:white;">
                                            	Company
                                            </th>                                                                                   
                                            <th style="text-align:left;color:white;">
                                                Department
                                            </th>
                                            <th style="text-align:left;color:white;">
                                            	Country 
                                            </th>
                                            <th style="text-align:left;color:white;">
                                            	Required Pass %
                                            </th>
                                            <th style="text-align:left;color:white;">
                                            	Maximum Score
                                            </th>
                                            <th style="text-align:left;color:white;">
                                                Score Obtained
                                            </th>   
                                            <th style="text-align:left;color:white;">
                                                % of Score Obtained
                                            </th>
                                            <th style="text-align:left;color:white;">
                                                Result
                                            </th>
                                            <th style="text-align:left;color:white;">
                                                CAD Remark
                                            </th>                                            
                                            
                                            
                                        </tr>
                                        </thead>
                                     <tbody style="text-align: left;">
                                        <c:forEach items="${rptexamList}" var="rpt" varStatus="count">
                                        <tr>
                                           	<td><c:out value="${count.index + 1}. "/></td>
                                           	<td> <c:out value="${rpt.getClassname()}"/></td>
                                           	<td><c:out value="${rpt.getExam_id()}"/></td>
                                           	<td><c:out value="${rpt.getExam_date()}"/></td>
                                           	<td><c:out value="${rpt.getCandidate_name()}"/></td>
                                           	<td><c:out value="${rpt.getJob_title()}"/></td>
                                           	<td><c:out value="${rpt.getCompany_name()}"/></td>
                                           	<td><c:out value="${rpt.getDepartment()}"/></td>
                                           	<td><c:out value="${rpt.getLocation()}"/></td>
                                           	<td><c:out value="${rpt.getPass_percentage()}"/></td>
                                           	<td><c:out value="${rpt.getMaximum_score()}"/></td>
                                           	<td><c:out value="${rpt.getTotal_score()}"/></td>
                                           	<td><c:out value="${rpt.getScorepercent()}"/></td>
                                           	<td><c:out value="${rpt.getStatus()}"/></td>
                                           	<td><c:out value="${rpt.getRemarks()}"/></td>                                           	
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
						   </div>
					     <!-- excel table end here --> 
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
                 $( document ).ready(function() {
                
                	 $("#errDt").text('');
                	 $("#errQn").text('');
                	 
                	 $("#search").click(function(e){               		
                		 
                         var classname=$("#class").val();                        
                         var frmDate=$("#frmDate").val();                		
                         var toDate=$("#toDate").val();
                         var company=$("#company").val();
                         var country=$("#country").val();
                         var department=$("#department").val();
                         var name=$("#name").val();
                         var qnshow=$("#qnshow").val();                        
                         var qnregistered=$("#qnregistered").val(); 
                          window.location.href = "/pathTDS/rptExam?classname=" + classname+ "&frmdate=" + frmDate+  "&todate=" +  toDate + "&company=" +company +"&country="+country+"&department="+department+"&name="+name+"&show="+qnshow+"&registered="+qnregistered;   
                	 
                	 
                	 });
                	 
                 });                 
                 
                  
                 </script>
              <!--    <style>
                 textarea {
  margin:0px 0px;
  padding:5px;
  height:20px;
  line-height:16px;
  width:96%;
  display:block;
  margin:0px auto;    
}
                 </style> -->
              <script>
             /* function expandTextarea(id) {
            	    document.getElementById(id).addEventListener('keyup', function() {
            	        this.style.overflow = 'hidden';
            	        this.style.height = 10;
            	        this.style.height = this.scrollHeight + 'px';
            	    }, false);
            	}

            	expandTextarea('txtarea');*/
              </script>
              
                <script>
               
                
                function exportRpt(){
                	$("#MyTable").show();
            		$("#MyTable").table2excel({
            		       // exclude CSS class
            		       //exclude: ".noExl",
            		       name: "Worksheet Name",
            		       filename: "results" //do not include extension
            		     });
            		
            }
                
                function printQuestions() {
                	 var toPrint = document.getElementById('printarea');
                     var popupWin = window.open('', '_blank', 'width=2480,height=3508');
                    popupWin.document.open();

                   // popupWin.document.write("<br>");
                    popupWin.document.write("<p style=text-align:center;font-size:30><b>Certificate Exam Report</b></p>");
                   
                    popupWin.document.write("<hr></hr>");
                    popupWin.document.write('<html><head><link rel="stylesheet" type="text/css" href="css/style.print.css"></head><body onload="window.print()" ><div id="pwrap" style=font-size:18;line-height: 0.5;>' +toPrint .innerHTML + '</div>');

                    popupWin.document.write('</body></html>');
                   popupWin.document.close();
                }
                </script>
                
              </html>
