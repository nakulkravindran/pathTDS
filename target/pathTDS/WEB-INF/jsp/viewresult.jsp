<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
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

<style>
    .hideData{
        display : none;
    }
</style>

<body class="">
    <div class="wrapper ">
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
                    <li >
                        <a href="/pathTDS/passwordMangement">
                            <i class="now-ui-icons ui-1_lock-circle-open"></i>
                            <p>Password Management</p>
                        </a>
                    </li>
                    <li >
                        <a href="/pathTDS/setuppara">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Parameter setup</p>
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
                    <li class="active">
                        <a href="/pathTDS/viewResults">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Old Results</p>
                        </a>
                    </li>
                    <li>
                        <a href="/pathTDS/UpgradeScoreResult">
                            <i class="now-ui-icons text_caps-small"></i>
                            <p>Results</p>
                        </a>
                    </li>
                     <li>
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
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="now-ui-icons location_world"></i>
                                    
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                
                                    <a class="dropdown-item" href="/pathTDS/logout">Logout</a>

                                </div>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="panel-header panel-header-sm">
            </div>
            <div class="content">
                <div class="row" >
                    <div class="col-md-12">
                        <div class="card scrollmenu">
                            <div class="card-header">
                                <h5 class="title">Results </h5>
                                <p class="category">

                                </p>
                                <div class="row">
                                    <div class="col-md-3">
                                       <p class="text-info"> Exam Name :
                                        <span style="color:red"><c:out value="${examName}"/></span> </p>
                                    </div>
                                   
                                    
                                    <div class="col-md-3">
                                       <p class="text-info"> Exam Id :
                                       <span style="color:red"> <c:out value="${examId}"/></span> </p>
                                    </div>
                                    <div class="col-md-3">
                                        <p class="text-info"> Question Paper Number :
                                       <span style="color:red"><c:out value="${questionPaperNumber}"/></span> </p>
                                    </div>
                                    <div class="col-md-3">
                                        <p class="text-info">   Exam Date :
                                        <span style="color:red"><c:out value="${examDate}"/> </span>  </p>
                                    </div>
                                    <div class="col-md-3">
                                      <p class="text-info">   Max. Score :
                                      <span style="color:red">  <c:out value="${maximumScore}"/> </span> </p>
                                    </div>
                                   
                                    <div class="col-md-3">
                                        <p class="text-info"> Score % required to pass :
                                        <span style="color:red"><c:out value="${passpercentage}"/>% </span>  </p>
                                    </div>
                                    <div class="col-md-3">
                                      <p class="text-info">   Allowed Time :
                                       <span style="color:red"> <c:out value="${totalExamDuration}"/> Min </span></p>
                                    </div>
                                    <div class="col-md-3">
                                      <p class="text-info">   Avg Time Taken :
                                     <span style="color:red"> <c:out value="${averageTimeTaken}"/> hrs </span> </p>
                                    </div>
                                    <div class="col-md-3">
                                        <p class="text-info">   No. Of Candidates :
                                        <span style="color:red"><c:out value="${noOfCandidates}"/> </span>  </p>
                                    </div>
                                    <div class="col-md-3">
                                         <p class="text-info">   Candidates Passed :
                                        <span style="color:red"><c:out value="${candidatesPassed}"/> </span>  </p>
                                    </div>
                                    <div class="col-md-3">
                                        <p class="text-info">   Candidates Failed :
                                        <span style="color:red"><c:out value="${candidatesFailed}"/>  </span> </p>
                                    </div>

                                </div>
                            </div>
                            <div class="card-body" style="height:500px; ">
                                <div class="row">
                                <div class="col-md-4">
                                        <!--  <div class="dropdown" >
                                          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Choose Exam
                                          </button>
                                          <div class="dropdown-menu " aria-labelledby="dropdownMenuButton" style=" height: 140px; width: 200px; overflow-y: scroll;">
                                             <c:forEach items="${examList}" var="exam">
                                                <a class="dropdown-item" href="/pathTDS/viewResults?examId=${exam.examId}"><c:out value="${exam.examId}"/></a>
                                            </c:forEach>
                                          </div>
                                        </div>-->
                                        
                                       
                                       
                                       
                                       
                                       
                                            <p class="text-info">   Choose Exam</p>
                                            <input list="questionPaperNumberList"  autocomplete="off"  id="questionPaperEditNumber" name="questionPaperEditNumber" value="" class="form-control col-md-4" onblur="qusnValidate();" placeholder="Question Paper Number">
                                            <datalist id="questionPaperNumberList">
                                                <c:forEach items="${examList}" var="exam" varStatus="myIndex">
                                                   <option value="${exam.examId}"></option>
                                                  
                                                </c:forEach>
                                            </datalist> 
                                        
                                </div>
                                <!--<div class="col-md-10">
                                    <button class="btn btn-primary btn-block" >SEARCH</button>
                                </div> -->
                                </div>
                                <br>


                                <div class="table-responsive ">
                                    <table id="MyTable" class="table table-sm">
                                        <thead id='headers'class=" text-primary" style="background-color: #3498db">
                                            <th>
                                                Sl.No
                                            </th>
                                            <th>
                                                Rank
                                            </th>
                                            <th>
                                                Applicant Name
                                            </th>
                                            <th>
                                                Bank Name
                                            </th>
                                            <th>
                                                Country Of Bank
                                            </th>
                                            <th>
                                                Department
                                            </th>
                                           <!--   <th class="hideData">
                                                Max Score
                                            </th >
                                            <th class="hideData">
                                                Pass Percentage
                                            </th>-->
                                            <th>
                                                Questions Attempted
                                            </th>
                                            <th>
                                                Correct Answers
                                            </th>
                                            <!-- <th>
                                                Section 1 : <c:out value="${sectionNames[0]}"/>
                                            </th> -->
                                            <th>
                                                Section 1 : <c:out value="${sectionNames[0]}"/>
                                            </th>
                                            <th>
                                                Section 2 : <c:out value="${sectionNames[1]}"/>
                                            </th>
                                            <th>
                                                Section 3 : <c:out value="${sectionNames[2]}"/>
                                            </th>
                                            <th >
                                                Total Score
                                            </th>
                                            <th >
                                                Status
                                            </th>
                                            <th >
                                                View Answer Sheet
                                            </th>

                                        </thead>
                                        <tbody>
                                            <c:forEach items="${results}" var="result" varStatus="myIndex">
                                                <tr>
                                                   <td>
                                                       <c:out value="${myIndex.index+1}"/>
                                                   </td>
                                                   <td>
                                                       <c:out value="${result.rank}"/>
                                                   </td>
                                                   <td>
                                                        <c:out value="${result.applicantName}"/>
                                                   </td>
                                                   <td>
                                                      <c:out value="${applicantDetails.get(result.applicantId).companyName}"/>
                                                   </td>
                                                   <td>
                                                      <c:out value="${applicantDetails.get(result.applicantId).location}"/>
                                                   </td>
                                                   <td>
                                                      <c:out value="${applicantDetails.get(result.applicantId).department}"/>
                                                   </td>
                                                  <!--   <td class="hideData">
                                                        <c:out value="${examId}"/>
                                                   </td>
                                                   <td class="hideData">
                                                        <c:out value="${examName}"/>
                                                   </td>
                                                   <td class="hideData">
                                                        <c:out value="${questionPaperNumber}"/>
                                                   </td>
                                                   <td class="hideData">
                                                        <c:out value="${maximumScore}"/>
                                                   </td>
                                                   <td class="hideData">
                                                        <c:out value="${passPercentage}"/>
                                                   </td>-->
                                                   <td>
                                                      <c:out value="${result.questionsAttempted}"/>
                                                   </td>
                                                    <td>
                                                       <c:out value="${result.correctAnswers}"/>
                                                   </td>
                                                   <td>
                                                       <c:out value="[${result.section1}]"/>/<c:out value="[${sectionData.get(sectionNames[0])}]"/>
                                                   </td>
                                                   <td>
                                                      <c:out value="[${result.section2}]"/>/<c:out value="[${sectionData.get(sectionNames[1])}]"/>
                                                   </td>
                                                   <td>
                                                      <c:out value="[${result.section3}]"/>/<c:out value="[${sectionData.get(sectionNames[2])}]"/>
                                                   </td>
                                                   <td>
                                                       <c:out value="${result.totalScore}"/>
                                                   </td>
                                                   <td>
                                                     <c:if test="${result.status eq 'Failed'}">
                                       
                                               <font color="red">  <c:out value="${result.status}"/></font>
                                                       </c:if>
                                                     <c:if test="${result.status ne 'Failed'}">
                                       
                                               <font color="green">  <c:out value="${result.status}"/></font>
                                                       </c:if>  
                                                       
                                                   </td>
                                                   <td>
                                                       <a href="/pathTDS/reportCard?examId=${examId}&applicantId=${result.applicantId}">Answer Sheet</a>
                                                   </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <button class="btn btn-sm btn-success"   id="export">Export Result</button>

                                </div>
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

<script src="http://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
<script>
 $("#export").click(function(){
      $("#MyTable").table2excel({
        // exclude CSS class
        exclude: ".noExl",
        name: "Worksheet Name",
        filename: "results" //do not include extension
      });
    });

</script>
<script>
$("#questionPaperEditNumber").change(function(){

    var examid = $("#questionPaperEditNumber").val();

   // alert(questionPaperNumber);

    window.location.href = "/pathTDS/viewResults?examId=" + examid;

});
</script>




</html>
