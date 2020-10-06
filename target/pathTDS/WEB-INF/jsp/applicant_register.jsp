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
                            
                                <h5 class="title">Register for Examination ( Exam Name :  <c:out value="${examName}"/> ) </h5>
                                
                                 <h6 class="title"></h6>
                            </div>
                            <div class="card-body">
                                <form id="examRegisterForm">

                                <div class="row"  >
                                <div class="col-md-4">
                                </div>
                                <div class="col-md-4">
                                   <span style="color:red;">*</span>
                                   <font color="#007bff"> Path Employee</font> &emsp;                                
                                   <input checked="true"  id="pathEmployee" name="pathEmployee" type="radio" value="Y" class="pathEmployeeButton radio-inline"  /><font color="#007bff">Yes</font>
                                   <input id="pathEmployee" name="pathEmployee" type="radio" value="N" class="pathEmployeeButton radio-inline" /><font color="#007bff">No</font>
								 <div id="pathempl" style=display:none;color:red ><i><font size="2">please select path employee </font> </i></div>
								</div>
								<div class="col-md-2">
								 		<div class="form-group">
								 		    <span class="pathdtls" style="color:red;">*</span>
                                                <font color="#007bff">Employee ID :</font>
											</div>	
								</div>
								<div class="col-md-2">
								<input disabled="disabled" id="employeid" name="employeid" type="text" class="form-control input-sm"  placeholder="Employee ID"/>
                                  <div id="emid" style=display:none;color:red ><i><font size="2">please enter employee id</font> </i></div>		
                                   
								</div>
								<div class="col-md-2">
								</div>
								</div> <hr>
								
                              
                                <div class="row">
                                <div class="col-md-4">
                                    <div class="col-xs-12">
                                    <span style="color:red;">*</span>
                                   <font color="#007bff"> Candidate Name</font>
                                    <input id="candidateName" name="candidateName" type="text" class="form-control input-sm"   placeholder=""/>
                                    </div>
                                     
                                    <div id="cname" style=display:none;color:red ><i><font size="2">please enter candidate name </font> </i></div>
                                    <br>
                                    <div class="col-xs-12">
                                    <span style="color:red;">*</span>
                                   <font color="#007bff"> Bank/Company Name</font>
                                    <input id="companyName" name="companyName" type="text" class="form-control input-sm"   placeholder="" />
                                    </div>
                                  <div id="cmpnyname" style=display:none;color:red ><i><font size="2">please enter bank/company name </font> </i></div>
                                    <br>
                                    <div class="col-xs-12">
                                    <span style="color:red;">*</span>
                                    <font color="#007bff">  Country of Bank/Company </font> 
                                    <input id="location" name="location" type="text" class="form-control input-sm"   placeholder=""/>
                                      <form:errors path="companyLocation" cssStyle="color: #ff0000;"/>
                                     <div id="loc" style=display:none;color:red ><i><font size="2">please enter country of bank/company </font> </i></div>
                                    </div>
                                   
                                    <br>
                                    <div class="col-xs-12"> 
                                    <span style="color:red;">*</span>    
                                    <font color="#007bff">  Department</font>
                                    <input id="department" name="department" type="text" class="form-control input-sm"  placeholder=""/>
                                    <div id="dept" style=display:none;color:red ><i><font size="2">please enter department </font> </i></div>
                                    </div>

                                    <br>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-12"> 
                                    <span style="color:red;">*</span>
                                    <font color="#007bff">Job Title</font>
                                    <input id="jobTitle" name="jobTitle" type="text" class="form-control input-sm"   placeholder=""/>
                                    <div id="job" style=display:none;color:red ><i><font size="2">please enter job title </font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                    <span style="color:red;">*</span>
                                    <font color="#007bff">Email ID</font>
                                    <input id="emailId1" name="emailId1" type="email" class="form-control input-sm"   placeholder=""/>
                                    <div id="email1" style=display:none;color:red ><i><font size="2">please enter email id </font> </i></div>
                                     <div id="valiemail1" style=display:none;color:red ><i><font size="2">Not a valid e-mail address </font> </i></div>
                                      <div id="exstemail1" style=display:none;color:red ><i><font size="2"> e-mail address already exist!!</font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12"> 
                                    <span style="color:red;">*</span>
                                    <font color="#007bff">ReType Email ID</font>
                                    <input id="emailId" name="emailId" type="email" class="form-control input-sm"   placeholder=""  autocomplete="off" oncontextmenu="return false;" onkeypress="return disableCtrlKeyCombination(event);"  onkeydown="return disableCtrlKeyCombination(event);"/>
                                    <div id="email" style=display:none;color:red ><i><font size="2">please enter email id </font> </i></div>
                                     <div id="valiemail" style=display:none;color:red ><i><font size="2">Not a valid e-mail address </font> </i></div>
                                      <div id="exstemail" style=display:none;color:red ><i><font size="2"> e-mail address already exist!!</font> </i></div>
                                    </div><br>                                    
                                    <div class="col-xs-12"> 
                                   <font color="#007bff"> Phone Number</font>
                                    <input  id="phoneNumber" name="phoneNumber"type="text" class="form-control input-sm" onfocus="phoneFunction()" onblur="Hidephn()" onkeyup="myFunction()" placeholder=""/>
                                    
                                    </div><!-- <br>
                                    <div class="col-xs-12"> 
                                  <font color="#007bff">  Remarks</font>
                                    <input id="remarks" name="remarks" type="text" class="form-control input-sm"  onfocus="remarkfunction()"placeholder=""/><br>
                                    </div><br> -->
                                    
                                    
                                </div>
                                <div class="col-md-4">
                                    <div class="col-xs-12">
                                    <span class="pathdtls" style="color:red;">*</span>
                                   <font color="#007bff"> Line Manager</font>
                                    <input disabled="disabled" id="lineManager" name="lineManager"    type="text" class="form-control input-sm"    placeholder=""/>
                                     <div id="line" style=display:none;color:red ><i><font size="2">please enter line manager </font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12" >
                                    <span class="pathdtls" style="color:red;">*</span>
                                   <font color="#007bff"> Line Manager Email ID</font>
                                    <input disabled="disabled" id="lineManagerEmail" name="lineManagerEmail" type="text" class="form-control input-sm"  placeholder=""/>
                                    <div id="linemail" style=display:none;color:red ><i><font size="2">please enter line manager email id</font> </i></div>
                                    </div><br>
                                    <div class="col-xs-12" >
                                    <span class="pathdtls" style="color:red;">*</span>
                                   <font color="#007bff"> Service Duration with Path Solutions</font>
                                    <div class="row" style="margin-left:0px;margin-top:4px;"> 
                                 <font color="#007bff"> Year</font> <input disabled="disabled" id="serviceDurationYear" name="serviceDurationYear" type="number" class="form-control input-sm col-md-3"   onchange="yearFunction()"  placeholder="Year"/>
                                     &emsp;&emsp;
                                     <font color="#007bff"> Month</font><input disabled="disabled" id="serviceDurationMonth" name="serviceDurationMonth" type="number" class="form-control input-sm col-md-3"   onchange="monthFunction()" placeholder="Month"/>
                                    <div id="ser" style=display:none;color:red ><i><font size="2">please enter service duration with path solution </font> </i></div>
                                     <div id="yearvalidate" style=display:none;color:red ><i><font size="2">Year should be between 0 and 30 </font> </i></div>
                                    <div id="monthvalidate" style=display:none;color:red;margin-left:140px;  ><i><font size="2">Month should be less than 12 </font> </i></div>
                                    <input type="hidden" id="serviceDuration" name="serviceDuration" />
                                    </div></div><br>
                                    <div class="col-xs-12" disabled="disabled" id="appByLineManager">
                                    <span class="pathdtls" style="color:red;">*</span>
                                    <font color="#007bff">Approved By Line Manager</font><br>
                                    <input disabled="disabled" id="approvedByLineManagerYes" name="approvedByLineManager" type="radio" value="Y" class="approved radio-inline"/> <font color="#007bff">Yes</font>
                                    <input disabled="disabled" id="approvedByLineManagerNo" name="approvedByLineManager" type="radio" value="N" class=" approved radio-inline"/> <font color="#007bff">No</font>

                                    </div>
                                </div>
                                </div>                              
                                 <div class="col-xs-12"> 
                                  <font color="#007bff">  Remarks</font>
                                    <input id="remarks" name="remarks" type="text" class="form-control input-sm"  onfocus="remarkfunction()"placeholder=""/><br>
                                 </div>
                                <div class="row">
                                <div class="col-md-12" >
                                    <input type="hidden" name="examId" value="${examId}"/>
                                    <input id="examRegisterButton" type="submit" value="Submit" style="padding-left:20px;margin-left:10px;" name="add" class="btn btn-success "/>
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
    
    function disableCtrlKeyCombination(e)
    {   	
    //list all CTRL + key combinations you want to disable
    var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j', 'w','i','s','u','P','t');
    var key;
    var isCtrl;
    if(window.event)
    {
    key = window.event.keyCode;     //IE
    if(window.event.ctrlKey)
    isCtrl = true;
    else
    isCtrl = false;
    }
    else
    {
    key = e.which;     //firefox
    if(e.ctrlKey)
    isCtrl = true;
    else
    isCtrl = false;
    }

    if(isCtrl)
    {
    for(i=0; i<forbiddenKeys.length; i++)
    {
    //case-insensitive comparation
    if(forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase())
    {
    //alert('Key combination CTRL + '+String.fromCharCode(key) +' has been disabled.');
    return false;
    }
    }
    }
    return true;
    }  
</script>

</html>
