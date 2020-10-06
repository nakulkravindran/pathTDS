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
                        
                    
                    </div>
                   </div>
                  
                      <div class="card-header">      
                           
                            <div class="card-body" >
                              <div class="container-fuid">                         
                              
                                 
                                <table class="table table-bordered" style="width:100%;table-layout: fixed;">
    							  <tbody>     
    							      <c:set var="chk" value="false" />   
    							      <tr><td colspan="2" Style="text-align:center;font-weight:400;font-size:20px;background-color: #DAF7A6;color:purple;"><b>Individual Score Report<br/> <br/> Training ID : <c:out value="${trainingModel.getId()}"/> </b></td></tr>               
                                    <c:forEach items="${TrainingRegstrationModel}" var="traReg" varStatus="myIndex">
                                        <c:set var="traRegID" value="${traReg.getId()}"/>
                                        <c:set var="traRegTraID" value="${traReg.getTrainingid()}"/>
                                       <tr style="background-color:#eaf8cf;">
                                          <td Style="text-align:right;"><b>Name</b></td>
                                          <td><c:out value="${traReg.getCandidateName()}"/></td>
                                       </tr>
                                       <tr>
                                          <td Style="text-align:right;"><b>Company/Bank Name</b></td>
                                          <td><c:out value="${traReg.getCompanyName() }"/></td>
                                       </tr>
                                       <tr>
                                          <td Style="text-align:right;"><b>Country</b></td>
                                          <td><c:out value="${traReg.getLocation() }"/></td>
                                       </tr>
                                       <tr>
                                          <td Style="text-align:right;"><b>Department</b></td>
                                          <td><c:out value="${traReg.getDepartment() }"/></td>
                                       </tr>
                                    <c:forEach items="${traheader2Model}" var="trahdr2Mdl" varStatus="count2">
                                      <tr>                                         
                                         <td style="width:50%;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><b><c:out value="(${count2.index + 1}) ."/><c:out value="${trahdr2Mdl.getSection() }"/></b></td>                                         
                                      </tr>
                                      
                                      <c:forEach items="${traheader3Model}" var="trahdr3Mdl" varStatus="count4">
                                        <c:set var="trahdr2MdlID" value="${trahdr2Mdl.getId()}"/>
                                        <c:set var="trahdr3Mdltra2id" value="${trahdr3Mdl.getTra2id()}"/>
                                        <c:set var="trahdr3MdlId" value="${trahdr3Mdl.getId()}"/>
                                        <c:if test="${trahdr2MdlID eq trahdr3Mdltra2id }">
                                             <tr>                                               
                                             	 <td style="width:50%;padding-left: 40px;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><c:out value="${trahdr3Mdl.getQuestion() }"/></td> 
                                             	 
                                             	 <c:forEach items="${EvaluationModel}" var="evalM" varStatus="evalIndex">                                              	                                     	   
                                             	    <c:set var="evalRegID" value="${evalM.getTrainingRegistrationId()}"/>
                                                    <c:set var="evalTraID" value="${evalM.getTrainingId()}"/>
                                                    <c:set var="evalQnID" value="${evalM.getQuestionId()}"/>
                                             	  		<c:if test="${traRegID eq evalRegID  && traRegTraID eq evalTraID  && trahdr3MdlId eq evalQnID}">
                                             	  		 <td>  <c:out value="${evalM.getRatingComments() }"/> </td> 
                                             	  		</c:if>
                                             	 </c:forEach>     
                                             	                                     	 
                                              </tr>  
                                        </c:if>
                                      </c:forEach> 
                                    </c:forEach> 
                                         <c:set var="chk" value="true" />  
                                    </c:forEach>
                                    
                                    </tbody>
                              </table>      
                              
                            
                                
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

            <script>
               
            </script>
         </html>
