<%-- <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>T&amp;D System</title>
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

<style>
    .btn-bs-file {
        position: relative;
    }

    .btn-bs-file input[type="file"] {
        position: absolute;
        top: -9999999;
        filter: alpha(opacity=0);
        opacity: 0;
        width: 0;
        height: 0;
        outline: none;
        cursor: inherit;
    }
</style>

<body class="">
    <%
response.setHeader("Cache-control","no-store"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP1.0
response.setDateHeader("Expire",0); //prevents caching at the proxy server
%>
        <div class="sidebar" data-color="blue">
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
            <div class="logo">

                <a href="#" class="simple-text logo-normal" style="text-align:center;font-weight:600;">
                    T&D System
                </a>
            </div>
            <div class="sidebar-wrapper">
                <ul class="nav">
                    <li>
                        <a href="/pathTDS/index">
                            <i class="now-ui-icons design_app"></i>
                            <p>Admin</p>
                        </a>
                    </li>
                    <!--    <li >
                        <a href="/pathTDS/privileges">
                            <i class="now-ui-icons education_atom"></i>
                            <p>Privileges</p>
                        </a>
                    </li>-->
                    <li>
                        <a href="/pathTDS/usermangmnt">
                            <i class="now-ui-icons location_map-big"></i>
                            <p>User Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/passwordMangement">
                            <i class="now-ui-icons ui-1_lock-circle-open"></i>
                            <p>Password Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/manageQuestions">
                            <i class="now-ui-icons ui-1_bell-53"></i>
                            <p>Questions</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/exammangmnt">
                            <i class="now-ui-icons users_single-02"></i>
                            <p>Exam Management </p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/viewApplicants">
                            <i class="now-ui-icons design_bullet-list-67"></i>
                            <p>Applications Management</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/viewResults">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Results</p>
                        </a>
                    </li>
                     <li class="active">
                        <a href="/pathTDS/TrainingModule">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Training</p>
                        </a>
                    </li>
                    
                </ul>
            </div>
        </div>
        <div class="main-panel">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-transparent  navbar-absolute bg-primary fixed-top">
                <div class="container-fluid">
                    <div class="navbar-wrapper">
                        <div class="navbar-toggle">
                            <button type="button" class="navbar-toggler">
                                <span class="navbar-toggler-bar bar1"></span>
                                <span class="navbar-toggler-bar bar2"></span>
                                <span class="navbar-toggler-bar bar3"></span>
                            </button>
                        </div>
                        <a class="navbar-brand" href="#pablo">USER: <%= session.getAttribute("uname") %></a>
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">

                        <ul class="navbar-nav">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="now-ui-icons location_world"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Change Password</span>
                                    </p>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">

                                    <a class="dropdown-item" href="/pathTDS/logout">Logout</a>

                                </div>
                            </li>
                            <!-- <li class="nav-item">
                                <a class="nav-link" href="#pablo">
                                    <i class="now-ui-icons users_single-02"></i>
                                    <p>
                                        <span class="d-lg-none d-md-block">Account</span>
                                    </p>
                                </a>
                            </li> -->
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="panel-header panel-header-sm">
            </div>
            <div class="content">
                <div id="questionHeader" class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="title">Evaluvation Form Setting</h5>
                            </div>
                           
                            <div class="card-body">
                            
                                <form id="uploadEvalForm">

                               <div class="row">
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;Enter Form Name: </label>
                                           </div>
                                             <div class="col-md-9 " style="padding-left:0px;">
                                             <div class="form-group" >
                                            
                                              <input id="formName" name="formName"  type="text" class="form-control"   placeholder="Name" maxlength="30" value="" >
                                            </div>
                                           </div>
                                        </div>   
                                     
                                         <div class="row">
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;Details &Instruction: </label>
                                           </div>
                                             <div class="col-md-9 " style="padding-left:0px;">
                                             <div class="form-group" >
                                            
                                                 <textarea id="Details" name="Details" class="form-control" placeholder="Details" value="" ></textarea>
                                            </div>
                                           </div>
                                        </div>  
                    </form>
                                    
               <button id="nextsection" class="btn btn-sm btn-primary " style="margin-left:50px;"> NEXT </button>
                                   
                            </div>
                        </div>
                    </div>

                </div>
          <div id="questionDetails" class="col-md-12">
                    <div class="card">
                       
                        <div class="card-body">
                             <form id="uploadsection">
                            <div class="row">
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Section: </label>
                                           </div>
                                             <div class="col-md-6 " >
                                             <div class="form-group" >
                                            
                                              <input id="section" name="section"  type="text" class="form-control"   placeholder="Section" maxlength="30" value="" >
                                            </div>
                                           </div>
                                        </div> 
                                        
                                         <div class="row" >
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Response Type: </label>
                                           </div>
                                             <div class="col-md-6 " >
                                             <div class="form-group" >
                                           <select class=" form-control validate " id="mySelect" onchange="myFunction()">
												  <option >Select</option>
												  <option value="Rating">Rating</option>
												  <option value="descriptive">Descriptive</option>
												
												     </select> 
                                              
                                            </div>
                                           </div>
                                        </div>  
                                        
                                        
                                          
                                        <div class="row" hidden>
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Response Type: </label>
                                           </div>
                                             <div class="col-md-6 " >
                                             <div class="form-group" >
                                            
                                              <input id="answertype" name="answertype"  type="text" class="form-control"   placeholder="Section" maxlength="30" value="" >
                                            </div>
                                           </div>
                                        </div>  
                                         <div class="row"  style="display:none;" id="Ratingcode" >
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rating: </label>
                                           </div>
                                           <c:forEach items="${paramList}" var="parmeter" >
                                                   <c:if test="${parmeter.prm_type eq 'Training Evaluation'}">
                                             <div>
                                  <input type="checkbox" name="ScreenId" value="${parmeter.prm_sort}">  
                                    <label for="coding">&nbsp;&nbsp;<c:out value="${parmeter.prm_shortname}"/>&nbsp;&nbsp;</label>
                              </div>
                        </c:if>
                          </c:forEach>
                                        </div> 
                                        </form>
                                         <button id="nextfield" class="btn btn-sm btn-primary " style="margin-left:10px;"> NEXT </button>
                                         </div>

                                       </div>
                            
                                              </div>   
                <div id="NextSection" class="col-md-12" >
                    <div class="card">
                       
                        <div class="card-body">
                             <form id="NextSection">
                            <div class="row">
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Section: </label>
                                           </div>
                                             <div class="col-md-6 " >
                                             <div class="form-group" >
                                            
                                              <input id="sect" name="sect"  type="text" class="form-control"   placeholder="Section" maxlength="30" value="" >
                                            </div>
                                           </div>
                                        </div> 
                                        
                                         <div class="row" >
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Response Type: </label>
                                           </div>
                                             <div class="col-md-6 " >
                                             <div class="form-group" >
                                           <select class=" form-control validate " id="rating" onchange="ratingFunction()">
												  <option >Select</option>
												  <option value="Rating">Rating</option>
												  <option value="descriptive">Descriptive</option>
												
												     </select> 
                                              
                                            </div>
                                           </div>
                                        </div>  
                                        
                                        
                                          
                                        <div class="row" hidden>
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Response Type: </label>
                                           </div>
                                             <div class="col-md-6 " >
                                             <div class="form-group" >
                                            
                                              <input id="responsetype" name="responsetype"  type="text" class="form-control"   placeholder="Section" maxlength="30" value="" >
                                            </div>
                                           </div>
                                        </div>  
                                         <div class="row"  style="display:none;" id="RatingFileds" >
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rating: </label>
                                           </div>
                                           <c:forEach items="${paramList}" var="parmeter" >
                                                   <c:if test="${parmeter.prm_type eq 'Training Evaluation'}">
                                             <div>
                                  <input type="checkbox" name="RatingId" value="${parmeter.prm_sort}">  
                                    <label for="coding">&nbsp;&nbsp;<c:out value="${parmeter.prm_shortname}"/>&nbsp;&nbsp;</label>
                              </div>
                        </c:if>
                          </c:forEach>
                                        </div> 
                                        </form>
                                       
                                         </div>

                                       </div>
                            
                                              </div>   
                                           
                                            <div class="card" id="question">
                       
                                         <div class="card-body">
                                          <form id="uploadquestion">
                                              <div class="row" >
                                             <div class="col-md-3" style="padding-left:4px;">
                                           <label>&nbsp;&nbsp;&nbsp;&nbsp;Question: </label>
                                           </div>
                                             <div class="col-md-9 " style="padding-left:0px;">
                                             <div class="form-group" >
                                            
                                                 <textarea id="quest" name="quest" class="form-control" placeholder="Question" value="" ></textarea>
                                             </div>
                                            </div>
                                             </div> 
                                             
                                          
                                             
                                             
                                             
                                             
                                             
                                             
                                             
                                             
                                             
                                             </form>
                                             
                                              <div class="form-group" style="margin-left:10px;">
                                      
                                         <button id="addnext" class="btn btn-primary ">SAVE &ADD NEXT QUESTION</button>
                                    </div> 
                                             </div>
                                             </div>
                           
                          
                             <style>
                                                .buttons1 {
												   
												   
	                                           background-color: #04c1a5;
	                                            color: #FFFFFF;
	                                            font-size: 1.0em;
                                                margin-bottom: 5px;
	                                            text-decoration: none;
	                                            position: relative;
	                                          
	                                            border-width: 2px;
											    font-weight: 400;
											  
											    line-height: 1.35em;
											    margin: 5px 1px;
											    border: none;
											    margin: 10px 1px;
											    border-radius: 0.1675rem;
											    padding: 5px 10px;
											    cursor: pointer;
											    width:42%;
                                                }   
                                                 .buttons2 {
											    font-size: 1.0em;
                                               margin-bottom: 5px;
	                                           text-decoration: none;
	                                            position: relative;
	                                           background-color: #ffb236;
	                                            color: #FFFFFF;
	                                            border-width: 2px;
											    font-weight: 400;
											  
											    line-height: 1.35em;
											    margin: 5px 1px;
											    border: none;
											    margin: 10px 1px;
											    border-radius: 0.1675rem;
											    padding: 5px 10px;
											    cursor: pointer;
											    width:42%;
											  
																							    
                                                }   
                                                  
                                                             
                                                
                                                </style>

                           

                            </form>

                       

            </div>

            <div class="col-md-12">
                <div class="card" id="submitbuton">

                    <div class="card-body">
                        <form id="uploadQuestionsForm2">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="form-group" style="margin-left:35px;">
                                        <button id="Submitsection"   class="btn btn-info ">SAVE & ADD  NEXT SECTION</button>
                                       &nbsp;&nbsp;&nbsp;  
                                    </div>
                                </div>
                            </div>

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
<script src="js/EvaluvationHelper.js"></script>

<script>
$('#questionDetails').hide(); 
$('#question').hide(); 
$('#submitbuton').hide(); 
$('#NextSection').hide();
</script>
<script>
function ratingFunction(){  // onchange of ADD NEXT SECTION new section,answertype ,rating fields added
	 var x = document.getElementById("rating").value;
	    //alert(x);
	   document.getElementById("responsetype").value = x;
	 //  alert(x);
	  if(x!="descriptive"){
		   $('#RatingFileds').show(); 
		
	   }
	   else{
		  
		   $('#RatingFileds').hide();
		 
	   }
	   
}

</script>
<script>
function myFunction() { //onchange event of rating type
    var x = document.getElementById("mySelect").value;
    //alert(x);
   document.getElementById("answertype").value = x;
   if(x=="Rating"){
	   $('#Ratingcode').show(); 
	  
	  
   }
   else{
	  
	   $('#Ratingcode').hide();
	   
   }
}
</script>

</html> --%>