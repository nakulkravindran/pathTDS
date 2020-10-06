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
              <div class="content" >
              
                <div class="row" >
                  <div class="col-md-12">
                    <div class="card" style="height: auto;">
                    <div class="ribbon4">
                    <div class="row">
                    <div class="col-md-4">
                    <a href="/pathTDS/index" class="btn btn-sm btn-info">Home</a>&emsp;
                    <a href="/pathTDS/TrainingModule" class="btn btn-sm btn-info">Training</a>
                    <!-- <button class="btn btn-sm btn-info" id="printButton" onclick="printQuestions()"><span class="glyphicon glyphicon-print"></span>Print</button> -->
                    <button class="btn btn-sm btn-info" id="printButton" onclick="window.print()"><span class="glyphicon glyphicon-print"></span>Print</button>
                       
                                   
                            
                    </div>
                    <div class="col-md-7">
                       
                    </div>
                    <div class="col-md-1"><br>
                        
                     <a   href="/pathTDS/logout"><font color="white">Logout</font></a>
                    
                      </div>
                    </div>
                   </div>
                    <div id="printarea">
                     <div>
                      <div class="card-header">

                       <div id="headding">
                          <p class="ribbon2" style="height: 50px; padding-top:15px;" >

                          		Create / Edit Evaluation Form<hr>
                            </p> </div>

                             
                            
                             <br>
                             <hr class="ribbon2" id="hr1"> 
                              
                            <div class="row" >
                                <div class="col-md-1" id="lab">
                                       <label><b>Form ID</b></label>
                                </div>
                                <div class="col-md-4">                                                                               
                                            
                                            <input list="trainingLst"  autocomplete="off"  id="trainingNumber" name="trainingNumber"  value="" class="form-control col-md-4"  placeholder="Training ID/Name" >
                                            <datalist id="trainingLst">
                                                    <option value="0" > Create New Form</option> 
                                                <c:forEach items="${trainingLst}" var="trainingVal" >
                                                    <option value="${trainingVal.getId()}">${trainingVal.getFormName()}</option>                                                   
                                                </c:forEach>                                                
                                            </datalist>
                                             <div id=qnErr style=display:none;color:red ><i><font size="2">You must enter a valid question number</font> </i></div>
                                     
                                </div>
                                
                                <div class="col-md-3">                                    
                                </div>
                                <div class="col-md-2">
                                        
                                </div>
                            </div>
                            <hr class="ribbon2" id="hr1"> 
                     
                            </div>
                           
                            <div class="card-body" >
                              <div class="container-fuid">
                              <input id="traId" type="hidden" value="${traId}"/>
                               <c:if test="${traId eq '0'}">
                                <div class="row">                                    
                                    <div class="col-md-4">
                                       <div class="form-group" >
                                       <label><b> Form Name:</b></label><br>
                                       <input id="traName" name="traName"  type="text" class="form-control"   placeholder="Name"  value="" maxlength="200">                                                            
                                     </div>
                                    </div>
                                    <div class="col-md-7">
                                       <div class="form-group" >
                                       <label><b> Details</b></label><br>
                                         <textarea id="traDtls" name="traDtls" class="form-control" style="border:1px solid gray;border-radius: 1rem;" placeholder="Details" value="" maxlength="400"></textarea>
                                       </div>
                                    </div>
                                 </div>  
                                <hr class="ribbon2" id="hr1">
                                <div class="row"><div class="col-md-4"> <b>Rating Code:</b> </div> </div> <br/> 
                                <div class="row">                                    
                                    <div class="col-md-2">     
                                    	  <c:set var="str" value="-"/>                                  
                                          <input list="param1List"  autocomplete="off"  id="param1Number" name="param1Number"  value="" class="form-control validate selector"  placeholder="Rating Code"  >
                                            <datalist id="param1List">                                                    
                                                <c:forEach items="${paramList}" var="param1Val" >                                                 
                                                 <option value="${param1Val.getId()}">${param1Val.getPrm_sort()} ${str} ${param1Val.getPrm_shortname()}</option>  
                                                 </c:forEach>                                                
                                            </datalist>                                  
                                    </div>
                                    <div class="col-md-2">                                       
                                          <input list="param2List"  autocomplete="off"  id="param2Number" name="param2Number"  value="" class="form-control validate selector"  placeholder="Rating Code"  >
                                            <datalist id="param2List">                                                    
                                                <c:forEach items="${paramList}" var="param2Val" >                                                 
                                                 <option value="${param2Val.getId()}">${param2Val.getPrm_sort()} ${str} ${param2Val.getPrm_shortname()}</option>  
                                                 </c:forEach>                                                
                                            </datalist>                                  
                                    </div>
                                    <div class="col-md-2">                                       
                                          <input list="param3List"  autocomplete="off"  id="param3Number" name="param3Number"  value="" class="form-control validate selector"  placeholder="Rating Code" >
                                            <datalist id="param3List">                                                    
                                                <c:forEach items="${paramList}" var="param3Val" >                                                 
                                                 <option value="${param3Val.getId()}">${param3Val.getPrm_sort()} ${str} ${param3Val.getPrm_shortname()}</option>  
                                                 </c:forEach>                                                
                                            </datalist>                                  
                                    </div>
                                    <div class="col-md-2">                                       
                                          <input list="param4List"  autocomplete="off"  id="param4Number" name="param4Number"  value="" class="form-control validate selector"  placeholder="Rating Code" >
                                            <datalist id="param4List">                                                    
                                                <c:forEach items="${paramList}" var="param4Val" >                                                 
                                                 <option value="${param4Val.getId()}">${param4Val.getPrm_sort()} ${str} ${param4Val.getPrm_shortname()}</option>  
                                                 </c:forEach>                                                
                                            </datalist>                                  
                                    </div>
                                    <div class="col-md-2">                                       
                                          <input list="param5List"  autocomplete="off"  id="param5Number" name="param5Number"  value="" class="form-control validate selector"  placeholder="Rating Code" >
                                            <datalist id="param5List">                                                    
                                                <c:forEach items="${paramList}" var="param5Val" >                                                 
                                                 <option value="${param5Val.getId()}">${param5Val.getPrm_sort()} ${str} ${param5Val.getPrm_shortname()}</option>  
                                                 </c:forEach>                                                
                                            </datalist>                                  
                                    </div>
                                    <div class="col-md-2">                                       
                                          <input list="param6List"  autocomplete="off"  id="param6Number" name="param6Number"  value="" class="form-control validate selector"  placeholder="Rating Code" >
                                            <datalist id="param6List">                                                    
                                                <c:forEach items="${paramList}" var="param6Val" >                                                 
                                                 <option value="${param6Val.getId()}">${param6Val.getPrm_sort()} ${str} ${param6Val.getPrm_shortname()}</option>  
                                                 </c:forEach>                                                
                                            </datalist>                                  
                                    </div>
                                </div>    
                                <hr class="ribbon2" id="hr1">    
                                 <div class="row">                                    
                                    <div class="col-md-8"> 
                                        <button onclick='addTraButtonClick()' class="btn btn-sm btn-success" style="font-size: 18px;">Save and Add Sections/Questions</button>                                                                               
                                    </div>
                                 </div>
                                <hr class="ribbon2" id="hr1">    
                              </c:if>
                              <c:if test="${traId ne '0'}">
                                 <div class="row">
                                    <div class="col-md-2">
                                       <div class="form-group" >
                                       <label><b> Form ID:</b></label><br>
                                          <c:out value="${traheader1Model.getId()}"/>                            
                                       </div>
                                    </div>
                                    <div class="col-md-4">
                                       <div class="form-group" >
                                       <label><b> Form Name:</b></label><br>
                                         <c:out value="${traheader1Model.getFormName()}"/>
                                       </div>
                                    </div>
                                    <div class="col-md-6">
                                       <div class="form-group" style="width:auto;">
                                       	  <label><b> Details</b></label><br>
                                          <span  style="word-wrap:break-word; -ms-word-wrap:break-word; overflow-wrap:break-word;"><c:out value="${traheader1Model.getDetails() }"/></span>                                       
                                        </div>
                                    </div>
                                 </div>   
                             
                             <div class="row" ><div class="col-md-6"> 
                              <b>Rating Code:</b>
                             </div></div> <br/>
                             <div class="row" >
                               <div class="col-md-6"> <c:set var="strr" value="-"/>
                                 <c:forEach items="${traheader4Model}" var="tra4M" varStatus="">
                                   <c:forEach items="${paramList}" var="paramval" >
                                        <c:set var="tra4MitemId" value="${tra4M.getItem()}"/>
                                        <c:set var="paramvalId" value="${paramval.getId()}"/>
                                        <c:if test="${tra4MitemId eq paramvalId }">
                                        		<c:out value="${paramval.getPrm_sort()} ${strr} ${paramval.getPrm_shortname()}"/>
                                        </c:if>
                                   </c:forEach>
                                 </c:forEach>
                              </div>
                              <div class="col-md-4"> &nbsp;</div>
                              <div class="col-md-2"> 
                                <c:if test="${del eq 'false'}">
                              		<button onclick='deleteTraButtonClick("${traId}")' class="btn btn-danger btn-sm disableOnInput " >Delete</button>
                                </c:if>
                              </div>
                            </div> 
                            <hr class="ribbon2" id="hr1">             
                            <div class="row" >
                               <div class="col-md-1" >
                                       <label><b>Section</b></label>
                                </div>
                                <div class="col-md-6">                                                                           
                                              <input id="sect" name="sect"  type="text" class="form-control"   placeholder="Section" maxlength="150" value="" >
                                                            
                                </div>
                                <div class="col-md-1" >
                                       <label><b>Answer Type</b></label>
                                </div>
                                <div class="col-md-2">                                    
                                           <select class=" form-control validate " id="rating" onchange="ratingFunction()">
												  <option >Select</option>
												  <option value="Rating">Rating</option>
												  <option value="descriptive">Descriptive</option>												
											</select>                                               
                                                              
                                </div>
                                <div class="col-md-2">     
                                     <c:if test="${del eq 'false'}">                              
                                           <button onclick='addSectButtonClick("${traId}")' class="btn btn-info btn-sm enableOnInput col-md-4" >Add </button>                                                                                      
                                     </c:if>                             
                                </div>
                            </div>
                            
                            <hr class="ribbon2" id="hr1"> 
                              
                            <div class="row" >
                               <div class="col-md-1" >
                                       <label><b>Section ID</b></label>
                                </div>
                                <div class="col-md-2">                                                                           
                                              <input id="sectNum" name="sectNum"  type="text" class="form-control"   placeholder="Section" maxlength="10" value="" oninput="chkNum()" >
                                                            
                                </div>
                                <div class="col-md-1" >
                                       <label><b>Question</b></label>
                                </div>
                                <div class="col-md-6">                                    
                                       <textarea id="Quest" name="Quest" class="form-control" style="border:1px solid gray;border-radius: 1rem;" placeholder="Question" maxlength="200" value="" ></textarea>
                                             	                                          
                                                              
                                </div>
                                <div class="col-md-2">  
                                    <c:if test="${del eq 'false'}">                                 
                                       <button onclick='addQnButtonClick("${traId}")' class="btn btn-info btn-sm enableOnInput col-md-4" >Add </button>                                                                                      
                                    </c:if>                             
                                </div>
                            </div>
                            
                             <hr class="ribbon2" id="hr1">
                                 
                                   <table class="table table-bordered" style="table-layout: fixed;width:100%;">
                                    <thead class=" text-primary" style="vertical-align:left;font-weight:800;font-size:12px; background-color: #85C1E9;color: white; ">
                                     	<tr style="color:white;">
                                     	  <!-- <th style="width:8%;"><b>Section ID</b></th>
                                     	  <th style="width:22%;"><b>Section</b></th>
                                     	  <th style="width:8%;"><b>Answer Type</b></th>                                     	  
                                     	  <th style="width:55%;"><b>Questions</b></th>
                                     	  <th style="width:5%;"> &nbsp; </th>  -->
                                     	  
                                     	   <th style="width:50px;"><b>Section ID</b></th>
                                     	  <th style="width:50px;"><b>Section</b></th>
                                     	  <th style="width:20px;"><b>Answer Type</b></th>                                     	  
                                     	  <th style="width:150px;"><b>Questions</b></th>
                                     	  <th style="width:30px;"> &nbsp; </th> 
                                     	</tr>
                                     </thead>
                                    <tbody>
                                    <c:forEach items="${traheader2Model}" var="trahdr2Mdl" varStatus="count2">
                                      <tr>
                                         <td><c:out value="${trahdr2Mdl.getId() }"/></td>
                                         <td><c:out value="${trahdr2Mdl.getSection() }"/></td>
                                         <td><c:out value="${trahdr2Mdl.getAnswertype() }"/></td>
                                         <%-- <c:if test="${trahdr2Mdl.getAnswertype() eq 'Rating' }">
                                           <td><c:out value="1-Poor, 2-Average, 3-Good, 4-Very Good, 5-Excellent, 6-Not Applicable/No Comments"/></td>
                                         </c:if>
                                         <c:if test="${trahdr2Mdl.getAnswertype() ne 'Rating' }">
                                           <td> &nbsp; </td>
                                         </c:if> --%>
                                         <td> &nbsp; </td>
                                         <td>  &nbsp;
                                          <c:if test="${del eq 'false'}">
                                          <button onclick='deleteSectButtonClick("${traId}","${trahdr2Mdl.getId()}")' class="btn btn-danger btn-sm disableOnInput " >Delete</button>
                                          </c:if>
                                           </td>
                                      </tr>
                                      
                                      <c:forEach items="${traheader3Model}" var="trahdr3Mdl" varStatus="count3">
                                        <c:set var="trahdr2MdlID" value="${trahdr2Mdl.getId()}"/>
                                        <c:set var="trahdr3Mdltra2id" value="${trahdr3Mdl.getTra2id()}"/>
                                        <c:if test="${trahdr2MdlID eq trahdr3Mdltra2id }">
                                             <tr>   
                                                 <td> &nbsp; </td>                                     
                                            	 <td> &nbsp; </td>
                                            	 <td> &nbsp; </td>
                                            	 <!-- <td> &nbsp; </td> -->
                                             	 <td style="word-wrap:break-word; -ms-word-wrap:break-word; overflow-wrap:break-word;"><c:out value="${trahdr3Mdl.getQuestion()}"/></td> 
                                             	 
                                             	 <td>
                                             	  &nbsp;
                                             	  <c:if test="${del eq 'false'}">
                                                  <button onclick='deleteQnButtonClick("${traId}","${trahdr3Mdl.getId()}")' class="btn btn-danger btn-sm disableOnInput " >Delete</button>
                                                  </c:if> 
                                             	 </td>
                                              </tr>  
                                        </c:if>
                                      </c:forEach> 
                                    </c:forEach> 
                                    <tr><td colspan="5"></td></tr>
                                    <tr><td colspan="5" style="text-align: center; ">
                                    <button id="svAttn"  class="btn btn-sm btn-success" style="font-weight:250;font-size:18px;color:white;"><b>Save Form and Exit</b></button>
                                    </td></tr> 
                                    </tbody>
                                 </table>      
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
                	
                	$("#trainingNumber").change(function(){                        
                   	  var trainingID=$("#trainingNumber").val();                   	 
                   	  window.location.href="/pathTDS/TrainingEvalView?traId=" + trainingID ;
                    }); 
                	
                	$('.selector').change(function () {	                		
                		  var changedItem = $(this);	  
                		  var otherSelectors = $(".selector").not(changedItem);	  
                		  var matchingItemPresent = [];
                		  $.each(otherSelectors, function (count, item) {                			 
                		   if( $(item).val().trim()== changedItem.val().trim()){
                		    matchingItemPresent.push($(item));	    
                		    }
                		  });	  
                		  //matchingItemPresent.length > 0 ? alert("Duplicate entry..same value exists in another section") : $.noop();
                		  if(matchingItemPresent.length > 0)
                		  { alert("Duplicate entry..same value exists for another rating") ;
                		      $(this).val('');
                		  }
                		  
                		  matchingItemPresent[0].focus();	  
                		  console.log(matchingItemPresent[0]);
                	 });
                	
                	$("#svAttn").click(function(){
                		alert("Saved successfully.");
                		window.location.href="/pathTDS/TrainingEvalView";
                	});
                	                	
                });
                
                function deleteTraButtonClick(trainingID){
                	 var retVal = confirm("Are you sure to delete this training form ?. Click 'OK' to confirm.");
                     if(retVal == true){    
                    	 $.ajax({
                 		       type: "POST",
                 		       url: "/pathTDS/delTrainingFrm",
                 		       data: {traId:trainingID}, // serializes the form's elements.
                 		       success: function(data)
                 		       {          		    	  
                 		    	   if(data=="success"){                 		    	     
                 		    	      window.location.href="/pathTDS/TrainingEvalView";
                 		           } else{
                 		        	   alert(data);
                 		           }
                 		       },
                 		       error: function(data){
                 		    	   
                 		        console.log("error");
                 		       
                 		      }
                 		});
                     }
                }
                
                 function addTraButtonClick(){
                  if($("#traName").val()!="" && $("#traDtls").val()!=""){
                	$.ajax({
           		       type: "POST",
           		       url: "/pathTDS/createTrainingFrm",
           		       data: {traName:$("#traName").val(),traDtls:$("#traDtls").val(),rating1:$("#param1Number").val(),rating2:$("#param2Number").val(),rating3:$("#param3Number").val(),rating4:$("#param4Number").val(),rating5:$("#param5Number").val(),rating6:$("#param6Number").val()}, // serializes the form's elements.
           		       success: function(data)
           		       {          		    	  
           		    	   if(data=="Failed"){
           		    	     alert(data);
           		    	   } else{
           		    	      window.location.href="/pathTDS/TrainingEvalView?traId=" + data ;
           		           } 
           		       },
           		       error: function(data){
           		    	   
           		        console.log("error");
           		       
           		       }
           		   });
                 }else{
                	alert("Please fill in the fields");
                 }
                	
               }
                
               function deleteSectButtonClick(trainingID,sectionID){
                	var retVal = confirm("Are you sure to delete this Section ?. Click 'OK' to confirm.");
                    if(retVal == true){    
                	$.ajax({
          		       type: "POST",
          		       url: "/pathTDS/delTrainingSec",
          		       data: {traId:trainingID,secId:sectionID}, // serializes the form's elements.
          		       success: function(data)
          		       {          		    	  
          		    	   if(data=="Failed"){
          		    	     alert(data);
          		    	   } else{
          		    	      window.location.href="/pathTDS/TrainingEvalView?traId=" + data ;
          		           } 
          		       },
          		       error: function(data){
          		    	   
          		        console.log("error");
          		       
          		       }
          		   });
                 }
                }
                
                function deleteQnButtonClick(trainingID,questID){
                    var retVal = confirm("Are you sure to delete this question ?. Click 'OK' to confirm.");
                    if(retVal == true){                    	
                    	$.ajax({
               		       type: "POST",
               		       url: "/pathTDS/delTrainingQn",
               		       data: {traId:trainingID,qnId:questID}, // serializes the form's elements.
               		       success: function(data)
               		       {          		    	  
               		    	   if(data=="Failed"){
               		    	     alert(data);
               		    	   } else{
               		    	      window.location.href="/pathTDS/TrainingEvalView?traId=" + data ;
               		           } 
               		       },
               		       error: function(data){
               		    	   
               		        console.log("error");
               		       
               		       }
               		   });
                   }
                }
                
                function addSectButtonClick(trainingID){
                	var sect=$("#sect").val();
                	var ratingCode=$("#rating").val();
                	if(sect!="" && ratingCode!="" && ratingCode!="Select"){
                		$.ajax({
                		       type: "POST",
                		       url: "/pathTDS/addTrainingSec",
                		       data: {traId:trainingID,section:sect,rating:ratingCode}, // serializes the form's elements.
                		       success: function(data)
                		       {
                		    	   if(data=="Failed"){
                		    	     alert(data);
                		    	   }else{
                		    	      window.location.href="/pathTDS/TrainingEvalView?traId=" + data ;
                		           }
                		       },
                		       error: function(data){
                		    	   
                		        console.log("error");
                		       
                		       }
                		     });
                	}
                	else{
                		alert("please fill in the section and select a answer type.");
                	}
                }
                
                function addQnButtonClick(trainingID){                	
                	if(isNaN(parseInt($("#sectNum").val()))){
                		alert("Section ID should be a number");
                	}else{
                		
                	var sectN=$("#sectNum").val();
                	var qn=$("#Quest").val();
                	if(sect!="" && rating!=""){
                		$.ajax({
                		       type: "POST",
                		       url: "/pathTDS/addTrainingQn",
                		       data: {traId:trainingID,secId:sectN,quest:qn}, // serializes the form's elements.
                		       success: function(data)
                		       {
                		    	   if(data=="Failed"){
                		    	     alert(data);
                		    	   }else{
                		    	      window.location.href="/pathTDS/TrainingEvalView?traId=" + data ;
                		           }
                		       },
                		       error: function(data){
                		    	   
                		        console.log("error");
                		       
                		       }
                		     });
                	}
                	else{
                		alert("please fill in the fields.");
                	}
                	
                  }
                } 
                
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
