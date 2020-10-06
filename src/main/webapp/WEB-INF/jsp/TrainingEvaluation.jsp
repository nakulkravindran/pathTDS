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
        <body >
        <% 
response.setHeader("Cache-control","no-store"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP1.0 
response.setDateHeader("Expire",0); //prevents caching at the proxy server 
%>
            <div class="container-fluid">
              <!-- End Navbar -->
              
              <div class="panel-header panel-header-sm">
          
              </div>
              <div class="content" >
              
                <div class="row" >
                  <div class="col-md-12">
                    <div class="card" style="height: auto;">
                    <div class="ribbon4">
                    <div class="row">
                        
                    
                    </div>
                   </div>
                  
                      <div class="card-header" >      
                           
                            <div class="card-body" >
                              <div class="container-fuid" >                         
                              
                             <input id="traId" type="hidden" value="${traId}"/>
                             <input id="traRegId" type="hidden" value="${traRegId}"/>
                             
                             <c:if test="${submitted eq 'true'}">
                               <div  class="row" style="border: 1px solid #DCDCDC;">
                                 <div class="col-md-12 ribbon2" style="text-align:center;font-weight:800;font-size:27px;color: white;"><b><c:out value="${message}"/></b></div>
                               </div>
                             </c:if>
                              
                             <c:if test="${submitted eq 'false' && traId ne '0'}">
                               <c:if test="${submitdt eq 'true'}">
                                  <div  class="row" style="border: 1px solid #DCDCDC;">
                                 <div class="col-md-12 ribbon2" style="text-align:center;font-weight:800;font-size:27px;color: white;"><b><c:out value="${message}"/></b></div>
                               </div>
                               </c:if>
                               
                               <c:if test="${submitdt eq 'false'}">
                              <div  class="row" style="border: 1px solid #DCDCDC;">
                                <div class="col-md-12 ribbon2" style="text-align:center;font-weight:800;font-size:27px;color: white;background-color:#3498DB;"><b>Training Evaluation</b></div>
                              </div>
                              
                                 <div class="row" style="font-size:22px; border-left: 1px solid #DCDCDC;border-right: 1px solid #DCDCDC;">
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                       <label><b> Training Name:</b></label>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >                                       
                                         <%-- <c:out value="${traheader1Model.getFormName()}"/> --%>
                                         <c:out value="${trainingModel.getName()}"/>
                                       </div>
                                    </div>
                                    <div class="col-md-3" >
                                       <div class="form-group" >
                                        <label style=" color: red;"><b> Last date of submission</b></label><br>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                        <span  style=" color: red;"><b><c:out value="${trainingModel.getSubmitdate()}"/></b></span>
                                       </div>
                                    </div>
                                 </div> 
                                 <div class="row" style="font-size:22px;border-left: 1px solid #DCDCDC;border-right: 1px solid #DCDCDC;">
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                       <label><b> Date of Training:</b></label>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                       <%-- <c:out value="${trainingModel.getPeriod()}"/> --%>
                                       <c:out value="${trainingModel.getStartdt()}"/>
                                       </div>
                                    </div>
                                    <div class="col-md-3" >
                                       <div class="form-group" >
                                        <label ><b> Trainer Name</b></label><br>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                        <c:out value="${trainingModel.getTrainername()}"/>
                                       </div>
                                    </div>
                                  </div> 
                                  <div  class="row" style="font-size:22px;">
                                   <div class="col-md-3">
                                       <div class="form-group" >
                                       <label><b> Your Name:</b></label>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >                                       
                                       <c:out value="${YourName}"/>
                                       </div>
                                    </div>
                                    <div class="col-md-3" >
                                       <div class="form-group" >
                                        <label ><b> Trainer Dept</b></label><br>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                        <c:out value="${trainingModel.getDepartment()}"/>
                                       </div>
                                    </div>
                                  </div> 
                                  
                                  <div  class="row" style="font-size:22px;">
                                   <div class="col-md-3">
                                       <div class="form-group" >
                                       <label><b> </b></label>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >                                       
                                       
                                       </div>
                                    </div>
                                    <div class="col-md-3" >
                                       <div class="form-group" >
                                        <label ><b> Training Period</b></label><br>
                                       </div>
                                    </div>
                                    <div class="col-md-3">
                                       <div class="form-group" >
                                        <c:out value="${trainingModel.getPeriod()}"/>
                                       </div>
                                    </div>
                                  </div> 
                                  <div  class="row"><div class="col-md-12 "><br/></div></div>
                                  <div  class="row"><div class="col-md-12 "></div></div>
                                  <div  class="row" style="border: 1px solid #DCDCDC;">
                                	<div class="col-md-12 " style="text-align:left;font-weight:342;font-size:20px;color: black;background-color:#e1f0fa;">
                                		<!-- <b>Please fill up and submit this training evaluation sheet. Your evaluation will help us to improve the training program.</b> -->
                                		<%-- <span style="white-space:pre;overflow-wrap:break-all;"><c:out value="${traheader1Model.getDetails()}"/></span> --%>
                                		<table style="width:100%;table-layout: fixed;"><tr><td style="word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;"><b><c:out value="${traheader1Model.getDetails()}"/></b></td></tr></table>
                                    </div>
                              	  </div>
                                   <table class="table table-bordered" style="table-layout: fixed;width:100%;" >
                                    
                                    <tbody>
                                    <c:set var="strr" value="-" />
                                    <c:forEach items="${traheader2Model}" var="trahdr2Mdl" varStatus="count2">
                                      <tr>                                         
                                         <td style="width:40%;font-size: 18px;"><b><c:out value="(${count2.index + 1}) . "/><c:out value="${trahdr2Mdl.getSection() }"/></b></td>
                                         <td style="width:60%;font-size: 18px;">
                                           <c:if test="${trahdr2Mdl.getAnswertype() eq 'Rating' }">
                                              <c:forEach items="${traheader4Model}" var="tra4M" varStatus="">
                                   				<c:forEach items="${paramList}" var="paramval" >                                   				
                                        			<c:set var="tra4MitemId" value="${tra4M.getItem()}"/>
                                        			<c:set var="paramvalId" value="${paramval.getId()}"/>
                                        				<c:if test="${tra4MitemId eq paramvalId }">
                                        					<%-- <b><c:out value="    ${paramval.getPrm_sort()}${strr}${paramval.getPrm_shortname()}     "/></b> --%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        				</c:if>
                                   			  </c:forEach>
                                 			</c:forEach>                                           
                                           </c:if>                                 
                                         </td>
                                      </tr>
                                      
                                      <c:forEach items="${traheader3Model}" var="trahdr3Mdl" varStatus="count4">
                                        <c:set var="trahdr2MdlID" value="${trahdr2Mdl.getId()}"/>
                                        <c:set var="trahdr3Mdltra2id" value="${trahdr3Mdl.getTra2id()}"/>
                                        <c:if test="${trahdr2MdlID eq trahdr3Mdltra2id }">
                                             <tr>                                               
                                             	 <td style="width:40%;font-size: 18px;padding-left: 40px;word-wrap:break-word; -ms-word-wrap:break-word; overflow-wrap:break-word;"><c:out value="${trahdr3Mdl.getQuestion() }"/></td> 
                                             	  
                                             	 <td style="width:60%;font-size: 18px;"> 
                                             	    <c:if test="${trahdr2Mdl.getAnswertype() eq 'Rating' }">
                                             	    <c:forEach items="${traheader4Model}" var="tra4M" varStatus="">
                                   						<c:forEach items="${paramList}" var="paramval" >                                   				
                                        					<c:set var="tra4MitemId" value="${tra4M.getItem()}"/>
                                        					<c:set var="paramvalId" value="${paramval.getId()}"/>
                                        						<c:if test="${tra4MitemId eq paramvalId }">
                                        						<input type="radio" class="${trahdr3Mdl.getId()}" name="${trahdr3Mdl.getId()}" data-name="radio" value="${paramval.getPrm_sort()}" >
                                        							<c:out value="${paramval.getPrm_shortname()}"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        						</c:if>
                                   			  			</c:forEach>
                                 					</c:forEach>  
                                             	    
                                             	    </c:if>
                                             	    <c:if test="${trahdr2Mdl.getAnswertype() eq 'descriptive' }">
                                             	         <textarea  id="${trahdr3Mdl.getId()}" data-name="text" class="form-control" style="border:1px solid gray;border-radius: 1rem;" placeholder="Answer" value="" maxlength="200"></textarea>
                                               	    </c:if>
                                                 </td>
                                              </tr>  
                                        </c:if>
                                      </c:forEach> 
                                    </c:forEach>
                                    <tr><td colspan="2"></td></tr>
                                    <tr><td colspan="2" style="text-align: center; ">
                                    <button id="submitEvaluation"  class="btn btn-sm btn-success" style="font-weight:250;font-size:15px;color:white;"><b>Submit Training Evaluation</b></button>
                                    </td></tr> 
                                    </tbody>
                                 </table>      
                               </c:if>
                            </c:if>
                                
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
                $(document).ready(function(){
                	$("#submitEvaluation").click(function(e){ 
                		var chk="false";                		
                	    $(':radio').each(function () {
                	        name = $(this).attr('name');
                	        if (!$(':radio[name="' + name + '"]:checked').length) {  chk="true";}
                	     });
                	    
               		  if(chk=="false"){      
                		var retVal = confirm("Are you sure to submit the Training Evaluation? Once submitted, you may not be able to make changes. Click 'OK' to confirm.");
                        if(retVal == true){ 
                		var traRegId= $("#traRegId").val();
           		        var traId=$("#traId").val();
                		var err="false";
                		$('input').each(function (e){          		     
                		     var typ=$(this).attr('data-name');  
                		     if(typ=="radio"){ 
                		        if ($(this).prop('checked')) {
                		    	  var qnId=$(this).attr('class');
                		          var Cmnt=$(this).val();
                		          console.log("typ:"+ typ + " traRegId:" + traRegId + " traId:"+ traId + " qnId:"+qnId+ " Cmnt:"+Cmnt);
                		          $.ajax({
                		              type: "POST",
                		              url: "/pathTDS/submitTrainingEvaluation",
                		              //async: true,                		            
                		              data:{ trainingRegId:traRegId,trainingId:traId,questId:qnId,comment:Cmnt },
                		              //data: formData, // serializes the form's elements.
                		              success: function(data)
                		              {   
                		            	  if(data!="success"){
                		            		  err="true";
                		            	  }            		            	 	                 
                		              },
                		              error: function(data){                		            	 
                		                 console.log(JSON.stringify(data));
                		              }              
                		           });                		          
                		        } 
                		    } 
                		});  
                		
                		$('textarea').each(function (e){
                			var typ=$(this).attr('data-name');  
               		       if(typ=="text"){ 
               		    	var qnId=$(this).attr('id');
          		          	var Cmnt=$(this).val();
          		            console.log("typ:"+ typ + " traRegId:" + traRegId + " traId:"+ traId + " qnId:"+qnId+ " Cmnt:"+Cmnt);
          		            if(Cmnt!=""){
               		    	 $.ajax({
          		              	type: "POST",
          		              	url: "/pathTDS/submitTrainingEvaluation",
          		              	//async: true,                		            
          		              	data:{ trainingRegId:traRegId,trainingId:traId,questId:qnId,comment:Cmnt },
          		              	//data: formData, // serializes the form's elements.
          		              	success: function(data)
          		              	{   
          		            	  if(data!="success"){
          		            		  err="true";
          		            	  }            		            	 	                 
          		              	},
          		              	error: function(data){                		            	 
          		                 console.log(JSON.stringify(data));
          		              	}              
          		           	  });
          		          	}
               		       }
                		});
                		
                		if(err=="false"){
                			//alert("Evaluation has been successfully submitted. You may close this window. Thank you.");
                			alert("Evaluation has been successfully submitted.");
                			window.location.href = "/pathTDS/endTraining";
                		}else{
                			alert("Failed to submit the Training Evaluation.");
                		}
                		//window.location.href = "https://www.google.com/";	
                    }
               	   }else{
               		alert("Please fill in all fields.");
               	   }
                   });
                
                });   
                
            </script>
         </html>
