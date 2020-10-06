<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
     <script>
        history.forward();
    </script>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>TDS</title>
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

<body class="">
    <div class="wrapper bcks2">
        
        <div class="container">
           <br>
            <!-- End Navbar -->
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                             <c:forEach items="${applicantList}" var="applicantList" varStatus="Index">
                                            <input type="hidden" id="appemil" name="appemail[]" value="${applicantList.emailId}">
                                            
                                            </c:forEach>
                            
                                <h5 class="title">Register for Training <br/> &nbsp;&nbsp;&nbsp;&nbsp; ( Training Name :  <c:out value="${trainingList}"/> ) </h5>
                                
                                 <h6 class="title"></h6>
                            </div>
                            <div class="card-body">
                                <form id="TrainingRegisterForm">

                                <div class="row"  >
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                   <font color="#007bff"> Path Employee</font> &emsp;   
                                      <c:choose>
    									<c:when test="${applicant.pathEmployee eq 'Y'}">
		        								<input  checked="true"  id="pathEmployee" name="pathEmployee" type="radio" value="Y" class="pathEmployeeButton radio-inline"  /><font color="#007bff">Yes</font>
                                   				<input id="pathEmployee" name="pathEmployee" type="radio" value="N" class="pathEmployeeButton radio-inline" /><font color="#007bff">No</font>								   
    									</c:when>    
    									<c:otherwise>
	     										<input id="pathEmployee" name="pathEmployee" type="radio" value="Y" class="pathEmployeeButton radio-inline"  /><font color="#007bff">Yes</font>
                                    			<input checked="true"  id="pathEmployee" name="pathEmployee" type="radio" value="N" class="pathEmployeeButton radio-inline" /><font color="#007bff">No</font>								  
    									</c:otherwise>
									</c:choose>
                                    
                             <div id="pathempl" style=display:none;color:red ><i><font size="2">please select path employee </font> </i></div>
								</div>
								<div class="col-md-2">
								 		<div class="form-group">
                                                <font color="#007bff">Employee ID :</font>
											</div>	
								</div>
								<div class="col-md-2">
								<input  id="employeid" name="employeid" type="text" class="form-control input-sm" onblur="HideEm()" placeholder="Employee ID" value="${applicant.employeid}"/>
                                  <div id="emid" style=display:none;color:red ><i><font size="2">please enter employee id</font> </i></div>		
                                   
								</div>
								<div class="col-md-2">
								</div>
								</div> <hr>
								
                              
                                <div class="row">
                                <div class="col-md-4">
                                    <div class="col-xs-12">
                                   <font color="#007bff"> Candidate Name</font>
                                    <input id="candidateName" name="candidateName" type="text" class="form-control input-sm"  onfocus="checkFunction()" onblur="Hidedname()" placeholder="" value="${applicant.candidateName}" />
                                    </div>
                                     
                                    <div id="cname" style=display:none;color:red ><i><font size="2">please enter candidate name </font> </i></div>
                                    <br>
                                    <div class="col-xs-12">
                                   <font color="#007bff"> Bank/Company Name</font>
                                    <input id="companyName" name="companyName" type="text" class="form-control input-sm"  onfocus="nameFunction()" onblur="Hidecmpnyname()" placeholder="" value="${applicant.companyName}"  />
                                    </div>
                                  <div id="cmpnyname" style=display:none;color:red ><i><font size="2">please enter bank/company name </font> </i></div>
                                    <br>
                                    <div class="col-xs-12">
                                  <font color="#007bff">  Country of Bank/Company </font> 
                                    <input id="location" name="location" type="text" class="form-control input-sm"  onfocus="countrynameFunction()" onblur="Hidecntryname()" placeholder="" value="${applicant.location}" />
                                      <form:errors path="companyLocation" cssStyle="color: #ff0000;"/>
                                     <div id="loc" style=display:none;color:red ><i><font size="2">please enter country of bank/company </font> </i></div>
                                    </div>
                                   
                                    <br>
                                    <div class="col-xs-12">     
                                  <font color="#007bff">  Department</font>
                                    <input id="department" name="department" type="text" class="form-control input-sm" onfocus="departFunction()"  onblur="Hidedeptname()" placeholder="" value="${applicant.department}" />
                                    <div id="dept" style=display:none;color:red ><i><font size="2">please enter department </font> </i></div>
                                    </div>

                                    <br>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-12"> 
                                    <font color="#007bff">Job Title</font>
                                    <input id="jobTitle" name="jobTitle" type="text" class="form-control input-sm"  onfocus="jobtitleFunction()" onblur="Hidejob()" placeholder="" value="${applicant.jobTitle}" />
                                    <div id="job" style=display:none;color:red ><i><font size="2">please enter job title </font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                    <font color="#007bff">Email ID</font>
                                    <input id="Email" name="Email" type="email" class="form-control input-sm"  onfocus="emailchecking()"  onkeypress="EmailValidate()" onkeyup="emailchecking()" onblur="Emailexist()"  placeholder="" value="${applicant.email}" />
                                    <div id="email" style=display:none;color:red ><i><font size="2">please enter email id </font> </i></div>
                                     <div id="emailvalid" style=display:none;color:red ><i><font size="2">Incorrect Email id </font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                   <font color="#007bff"> Phone Number</font>
                                    <input  id="phoneNumber" name="phoneNumber"type="text" class="form-control input-sm" onfocus="phoneFunction()" onblur="Hidephn()" onkeyup="myFunction()" placeholder="" value="${applicant.phoneNumber}" />
                                    
                                    </div><br>
                                    <div class="col-xs-12"> 
                                  <font color="#007bff">  Remarks</font>
                                    <input id="remarks" name="remarks" type="text" class="form-control input-sm"  onfocus="remarkfunction()"placeholder="" value="${applicant.remarks}" /><br>
                                    </div><br>
                                    
                                    
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-12">
                                   <font color="#007bff"> Line Manager</font>
                                    <input  id="lineManager" name="lineManager"    type="text" class="form-control input-sm"  onfocus="emplyidFunction()" onblur="Hideemid()"  placeholder="" value="${applicant.lineManager}" />
                                     <div id="line" style=display:none;color:red ><i><font size="2">please enter line manager </font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12" >
                                   <font color="#007bff"> Line Manager Email ID</font>
                                    <input  id="lineManagerEmail" name="lineManagerEmail" type="text" class="form-control input-sm" onfocus="lineFunction()" onblur="Hideline()" placeholder="" value="${applicant.lineManagerEmail}" />
                                    <div id="linemail" style=display:none;color:red ><i><font size="2">please enter line manager email id</font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12" >
                                   <font color="#007bff"> Service Duration with Path Solutions</font>
                                    <div class="row" style="margin-left:0px;margin-top:4px;"> 
                                 <font color="#007bff"> Year</font> <input  id="serviceDurationYear" name="serviceDurationYear" type="number" class="form-control input-sm col-md-3"  onfocus="lineemailFunction()" onblur="Hidelineemail()" onchange="yearFunction()"  placeholder="Year" value="${years}"/>
                                     &emsp;&emsp;
                                     <font color="#007bff"> Month</font><input  id="serviceDurationMonth" name="serviceDurationMonth" type="number" class="form-control input-sm col-md-3"  onfocus="lineemailFunction()" onblur="Hidelineemail()" onchange="monthFunction()" placeholder="Month" value="${months}" />
                                    <div id="ser" style=display:none;color:red ><i><font size="2">please enter service duration with path solution </font> </i></div>
                                     <div id="yearvalidate" style=display:none;color:red ><i><font size="2">Year should be between 0 and 30 </font> </i></div>
                                    <div id="monthvalidate" style=display:none;color:red;margin-left:140px;  ><i><font size="2">Month should be less than 12 </font> </i></div>
                                    <input type="hidden" id="serviceDuration" name="serviceDuration" />
                                    </div></div><br>
                                    <div class="col-xs-12"  id="appByLineManager">
                                    <font color="#007bff">Approved By Line Manager</font><br>
                                    
                                    <c:if test="${applicant.approvedByLineManager ne 'Y'}">
                                    <input  id="approvedByLineManagerYes" name="approvedByLineManager" type="radio" value="Y" class="approved radio-inline"/> <font color="#007bff">Yes</font>
                                    <input  id="approvedByLineManagerNo" name="approvedByLineManager" type="radio" value="N" class=" approved radio-inline"/> <font color="#007bff">No</font>
									</c:if>
									<c:if test="${applicant.approvedByLineManager eq 'Y'}">
									<input  checked="true"  id="approvedByLineManagerYes" name="approvedByLineManager" type="radio" value="Y" class="approved radio-inline"/> <font color="#007bff">Yes</font>
                                    <input  id="approvedByLineManagerNo" name="approvedByLineManager" type="radio" value="N" class=" approved radio-inline"/> <font color="#007bff">No</font>
									</c:if>
                                    
                                    </div>
                                </div>
                                </div>
                                <div class="col-xs-12"> 
                                    <font color="#007bff">CAD  Remarks</font>
                                    <input id="cadremarks" name="cadremarks" type="text" class="form-control input-sm"  placeholder="cad remarks" maxlength="450" value="${applicant.cadremarks}"/><br>
                                    </div><br>
                                <div class="row">
                                <div class="col-md-12" >
                                   <input hidden name="trainingid" id="trainingid" value="${traid}" >
                                   <input hidden name="id" id="id" value="${applicant.id}" >
                                    <input id="TrainingRegisterEditButton" type="submit" value="Submit" style="padding-left:20px;margin-left:10px;" name="add" class="btn btn-success "/>
                                </div>
                                </div>
                                <br>
                                 
                                
                            </form>
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
                            document.write(new Date().getFullYear())
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

<script src="js/applicantRegisterHelper.js"></script>
<script src="js/applicantRegisterValidate.js"></script>
<script>
$("#serviceDuration").val($("#serviceDurationYear").val() + "Years and " + $("#serviceDurationMonth").val() + "Months");
    $("#serviceDurationYear").change(function(){
        $("#serviceDuration").val($("#serviceDurationYear").val() + "Years and " + $("#serviceDurationMonth").val() + "Months");
    });
    $("#serviceDurationMonth").change(function(){
        $("#serviceDuration").val($("#serviceDurationYear").val() + "Years and " + $("#serviceDurationMonth").val() + "Months");
    });
    var checked = $('#pathEmployee').is(':checked');
    if(checked){
    	$(".pathdtls").show();
        $("#employeid").prop("disabled", false);
        $("#lineManager").prop("disabled", false);
        $("#lineManagerEmail").prop("disabled", false);
        $("#serviceDurationYear").prop("disabled", false);
        $("#serviceDurationMonth").prop("disabled", false);
        $("#approvedByLineManagerYes").prop("disabled",false);
        $("#approvedByLineManagerNo").prop("disabled",false);
    }
    else{
    	$(".pathdtls").hide();
        $("#employeid").val("");
        $("#employeid").prop("disabled", true);
        $("#lineManager").val("");
        $("#lineManager").prop("disabled", true);
        $("#lineManagerEmail").val("");
        $("#lineManagerEmail").prop("disabled", true);
        $("#serviceDurationYear").val("");
        $("#serviceDurationYear").prop("disabled", true);
        $("#serviceDurationMonth").val("");
        $("#serviceDurationMonth").prop("disabled", true);
        $("#approvedByLineManagerYes").prop("checked",false);
        $("#approvedByLineManagerNo").prop("checked",false);
        $("#approvedByLineManagerYes").prop("disabled",true);
        $("#approvedByLineManagerNo").prop("disabled",true);
        $("#serviceDuration").val("");
    }
    
    $(".pathEmployeeButton").click(function(){
        var checked = $('#pathEmployee').is(':checked');
        if(checked){
        	$(".pathdtls").show();
            $("#employeid").prop("disabled", false);
            $("#lineManager").prop("disabled", false);
            $("#lineManagerEmail").prop("disabled", false);
            $("#serviceDurationYear").prop("disabled", false);
            $("#serviceDurationMonth").prop("disabled", false);
            $("#approvedByLineManagerYes").prop("disabled",false);
            $("#approvedByLineManagerNo").prop("disabled",false);
        }
        else{
        	$(".pathdtls").hide();
            $("#employeid").val("");
            $("#employeid").prop("disabled", true);
            $("#lineManager").val("");
            $("#lineManager").prop("disabled", true);
            $("#lineManagerEmail").val("");
            $("#lineManagerEmail").prop("disabled", true);
            $("#serviceDurationYear").val("");
            $("#serviceDurationYear").prop("disabled", true);
            $("#serviceDurationMonth").val("");
            $("#serviceDurationMonth").prop("disabled", true);
            $("#approvedByLineManagerYes").prop("checked",false);
            $("#approvedByLineManagerNo").prop("checked",false);
            $("#approvedByLineManagerYes").prop("disabled",true);
            $("#approvedByLineManagerNo").prop("disabled",true);
            $("#serviceDuration").val("");
        }

    });
</script>
<script>
$("#TrainingRegisterEditButton").click(function(e){
	  var delVal = confirm("Are you sure to submit ?. Click 'OK' to confirm.");
	if(delVal==true){
	  var candidateName= $("#candidateName").val();
	    var companyName=$("#companyName").val();
	     var location=$("#location").val();
	     var department=$("#department").val();
	   var jobTitle=$("#jobTitle").val();
	     var emailId=$("#emailId").val();
	  
	     if(candidateName !=""&&companyName!=""&&location!=""&&department!=""&&jobTitle!=""&&emailId!=""){
	    	
	  
         var url = "/pathTDS/registerTrainingApplicantedit";
           var formData = $("#TrainingRegisterForm").serializeArray();
           
          $.ajax({
             type: "POST",
             url: url,
             data: formData, // serializes the form's elements.
             success: function(data)
             {
          	  
                 // show response from the php script.
                /* if(data === "success"){
                  window.location.href = "/index";
                 }*/
          	   //alert("sucessfully Registered!!");
                 window.location.href = "/pathTDS/ViewTrainingApplicant?traingid="+data;
             },
             error: function(data){
              console.log("error");
             }
           });

           e.preventDefault();
	     }
	     else{
	    	 alert("please fill all the fields");
	    	 return false;
	     }
	}
	else{
		return false;	
	}

  }); 


</script>





</html>
