<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>EXAMINATION</title>
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


                                           	  <% int i=1;
                                                 
                             String  appid="6",examid="DEMO1280897",score="10";
    	
            //appid=request.getParameter("appid").trim(); 
            // examid=request.getParameter("examid").trim(); %>
                     
            
            
       
           <% 
               try
           {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pathtds","root","root12tree!Q");
                 
                 Statement stmt=con.createStatement();
                 String  sql1="select * from exam where exam_id='"+examid+"'";//take examid from exam table
                 ResultSet rs=stmt.executeQuery(sql1);
                 if(rs.next())
                 {
                     System.out.println("Inside RS");
                    String qn_paper_no=rs.getString(4); //take question paper no from exam
                    String total_time=rs.getString(9); //take total time from exam 
                    String exam_name= rs.getString(10);
                        String  sql3="select * from questions where question_paper_number='"+qn_paper_no+"' "; //take questions from question table
                        ResultSet rs3=stmt.executeQuery(sql3);
                        rs3.last(); int no=rs3.getRow();
                       // String totno= session.getAttribute("totno").toString();
                        String  sql2="select * from questions where question_paper_number='"+qn_paper_no+"' limit 1  "; //take questions from question table
                       
                         ResultSet rs2=stmt.executeQuery(sql2);
                         
                         %>  
                      
                        
                        
                       <body class="">
    <div class="wrapper ">
        <div class="sidebar" data-color="orange">
            
            <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
            <!-- <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                    
                </a>
                <a href="" class="logo-normal">
                    TDS
                </a>
            </div> -->
            <div class="sidebar-wrapper">
                <ul class="nav">
                 
                    <li>
                    	<div class="table-responsive ">
                                    <table class="table table-inverse table-bordered">
                                        <tbody class="tbls">
                                            <tr>
                                            <td class="table-active">
                                                1
                                            </td>
                                            <td class="table-success">
                                                2
                                            </td>
                                            <td class="table-warning">
                                                3
                                            </td>
                                            <td class="table-danger">
                                                4
                                            </td>
                                        </tr>
                                        
                                            <tr>
                                                <td class="table-info">
                                                    5
                                                </td>
                                                <td class="table-active">
                                                    6
                                                </td>
                                                <td class="table-active">
                                                    7
                                                </td>
                                                <td class="table-active">
                                                    8
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">
                                                    9
                                                </td>
                                                <td class="table-active">
                                                    10
                                                </td>
                                                <td class="table-active">
                                                    11
                                                </td>
                                                <td class="table-active">
                                                    12
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">
                                                    13
                                                </td>
                                                <td class="table-active">
                                                    14
                                                </td>
                                                <td class="table-active">
                                                    15
                                                </td>
                                                <td class="table-active">
                                                    16
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">
                                                    17
                                                </td>
                                                <td class="table-active">
                                                    18
                                                </td>
                                                <td class="table-active">
                                                    19
                                                </td>
                                                <td	class="table-active">
                                                    20
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>
                                </div>
                    </li>
                    
                    <li><br>
                        <button name="endexam"	class="btn btn-md btn-warning">End The Exam And Submit</button>
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
                        <!-- <a class="navbar-brand" href="#pablo">Icons</a> -->
                    </div>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                        <span class="navbar-toggler-bar navbar-kebab"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-end" id="navigation">
                        <!-- <form>
                            <div class="input-group no-border">
                                <input type="text" value="" class="form-control" placeholder="Search...">
                                <span class="input-group-addon">
                                    <i class="now-ui-icons ui-1_zoom-bold"></i>
                                </span>
                            </div>
                        </form> -->
                        <ul class="navbar-nav">
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="panel-header panel-header-sm">
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header loc">
                                  <h5><% out.println(exam_name);%></h5><br><br>
                                <% while(rs2.next())
                                { System.out.println("Inside RS2");  String q_id=rs2.getString(1);  %>  
                                             <input type="hidden" name="appid" id="appid" value="<% out.println(appid);%>"/>
                 <input type="hidden" name="examid" id="examid" value="<% out.println(examid);%>"/>
             <input type="hidden" name="qid" id="qid" value="<% out.println(q_id); %>"/>
                                <div id="abc<%  out.println(i); %>" >
                                <div class="row ribbon">
                                <div class="col-md-3">
                                For Review<br>
                                3</div>
                                <div class="col-md-3">
                                Answered<br>
                                17</div>
                                <div class="col-md-3">
                                Unanswered<br>
                                23</div>
                                <div class="col-md-3">
                                Time remaining<br>
                                 <span id="countdown" class="timer"></span></div>
                                </div><br>
                                <div class="row">
                         
                                <div class="col-md-4">
                                <p class="text-primary">Question -<% out.println(i); session.setAttribute("totno", i); %>/<% out.println(no); %></p>
                                </div>
                         
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  
                       
                                <p class="text-primary">Score of this question -<% out.println(rs2.getString(16));  %>  </p>
                                </div>
                                </div>
                           
                            <div class="card-body all-icons">
                               
                             	
                  <div class="content-holder"><p class="blockquote blockquote-info">Question:<br>  
                          <% out.println(rs2.getString(3));     %>
                                  
                                <br>
                                            
                                
                                             <table class="table table-responsive-sm">
                                             	<tbody>
                                                			        
                                                                                                   <tr> 
                                                                                                  
											            <td class="pr-md-12 pr-5">
                                                                                                   
											              <input type="checkbox" class="filled-in" id="checkbox123">
											             <label for="checkbox123" class="label-table"></label>
											                </td>
											            <td><% out.println(rs2.getString(5)); %></td> 
                                                                                                  
											      </tr>
                                                                                                
                                                                                                <tr>
                                                                                                    
											            <td class="pr-md-12 pr-5">
                                                                                                       
											                <input type="checkbox" class="filled-in" id="checkbox124">
											                <label for="checkbox124" class="label-table"></label>
											                   </td>
											            <td><% out.println(rs2.getString(7)); %></td> 
                                                                                                    
                                                                                                 </tr>
											        <tr>
                                                                                                   
											            <td class="pr-md-3 pr-5">
											                
                                                                                                        <input type="checkbox" class="filled-in" id="checkbox125">
											                <label for="checkbox125" class="label-table"></label>
                                                                                                       </td>
											            <td><% out.println(rs2.getString(9)); %></td>  
                                                                                                    
											        </tr>
                                                                                                   
											        <tr>
                                                                                                    
											            <td class="pr-md-3 pr-5">
                                                                                                       
											                <input type="checkbox" class="filled-in" id="checkbox126">
											                <label for="checkbox126" class="label-table"></label>
                                                                                                         </td>
											            <td><% out.println(rs2.getString(11)); %> </td> 
                                                                                                   
											        </tr>
                                                                                                 <tr>
                                                                                                     </div>
											            <td class="pr-md-3 pr-5">
                                                                                                         
											                <input type="checkbox" class="filled-in" id="checkbox126">
											                <label for="checkbox126" class="label-table"></label>
											            </td>
                                                                                                    <td><% out.println(rs2.getString(13)); %></td>
                            </div>
											        </tr>
                                                                                          
											    </tbody>
											    </table>
											   
                                                                         <div class="panel" style="position:relative">&emsp;
											   
											    <p>Mark for review&emsp;<input type="checkbox" class="filled-in" id="checkbox123"></p>
                                                                                             <button type="submit" class="btn btn-xs btn-info " >Previous</button>
                                                                                            <button type="submit" class="btn btn-xs btn-primary" id="buttnnext">Next</button>
											     
                                	
                         </div>  
    
     </div> 
      
                                                                           
                                                                                                
      <script>
//var upgradeTime = 
 //var seconds = +document.getElementbyId("tot").value;
  var seconds = <% out.println(total_time); %>
//window.alert(seconds);
function timer() {
    var days        = Math.floor(seconds/24/60/60);
    var hoursLeft   = Math.floor((seconds) - (days*86400));
    var hours       = Math.floor(hoursLeft/3600);
    var minutesLeft = Math.floor((hoursLeft) - (hours*3600));
    var minutes     = Math.floor(minutesLeft/60);
    var remainingSeconds = seconds % 60;
    if (remainingSeconds < 10) {
        remainingSeconds = "0" + remainingSeconds; 
    }
    document.getElementById('countdown').innerHTML =  hours + ":" + minutes + ":" + remainingSeconds;
    if (seconds === 0) {
        clearInterval(countdownTimer);
        document.getElementById('countdown').innerHTML = "Completed";
         //window.location = "login.html"; 
    } else {
        seconds--;
    }
}
var countdownTimer = setInterval('timer()', 1000);
</script>
                       <%      
                  i++; }  %> </p>
                <% 
                 }
             }
             catch(Exception e)
                {
                 out.println("error"+e);
             }
            %>
                                              
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
                                <a href="https://www.path-solutions.com">
                                   
                                </a>
                            </li>
                            
                        </ul>
                    </nav><br><br>
                    <div class="copyright">
                    <img src="assets/img//logo2.png" alt="..."> <br>
                        &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script>, Ver 1.0 Beta
                    </div>
                </div>
            </footer>
        </div>
    </div>

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
<script type="text/javascript">
    $(document).ready(function(){
         $('#buttnnext').on('click', function () {
        var qid=$('#qid').val(); 
         var appid=$('#appid').val();
         var examid=$('#examid').val();
         
        //var json=JSON.stringify(Qarray);
        //alert(json);
    $.ajax({ type:"get",
        url: "examaction.jsp",
      context: document.body,
     
      data:{Qid:qid,Appid:appid,Examid:examid},
        success: function(data){
            console.log(data);
           alert("done");
        }});
     });
});
    </script>
</body>
</html>
