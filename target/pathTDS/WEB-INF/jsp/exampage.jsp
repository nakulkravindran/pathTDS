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

<body style="background-color: #ebecf1;"  onload="disable();" class="faq" onkeypress="return disableCtrlKeyCombination(event);"  onkeydown="return disableCtrlKeyCombination(event);">
    <div class="wrapper" style="width:1400px">
   
        <div class="sidebar" data-color="red">
            
            <div class="sidebar-wrapper">
                
                    <!-- <li><p class="table-success" align="center">Answered</p></li><br>
                    <li><p class="table-warning" align="center">For Review</p></li><br>
                    <li><p class="table-inverse" align="center">Unanswered</p></li> <br>
                     -->
                     
                <div class="row">
                        
	                        <div class="col-md-12">
	                       <br>
	                        <p class="table-inverse" style="color:#b97a57; font-weight:400; font-size:16px; text-align: center;"><c:out value="${applicantName}"/></p>
	                        </div>
                 </div>
                   
                <div class="row">
                       
                     <div class="col-md-12">
                    <h5 style="color:#000; font-weight:450; font-size:18px; text-align: center"> Status of Questions </h5>
                    </div>
                    </div>
                     <div class="row">
                        
                      <div class="col-md-12">
                        <img class="img img-responsive" src="assets/img/legend.png" style="align-content: center;">
                    </div>
                    </div>
                    <br>
                     <div class="row">
                        
                        <div class="col-md-12" >
                        <div id="questionList" class="table-responsive ">
                                    <table class="table table-inverse table-bordered">
                                        <tbody class="tbls">

                                        </tbody>
                                    </table>
                                </div>
                    </div>
                    </div>
                    
                     
                    <div class="fixed2">
                     <div class="col-md-12">   
                    
                     	<button style="text-align:center; font-weight:520;font-size:16px;"  id="endExam" name="endExam" data-toggle="modal" data-target=".bd-example-modal-sm" class="btn btn-md btn-danger">End And Submit Exam</button>
                       
                      </div>
                   </div>
                    
                     
                    
                    
                

            </div>
            
            
            
              
        </div>
        
        <div class="main-panel">
            <!-- Navbar -->
            
            <!-- End Navbar -->
            <br><br><br>
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card" >
                            
                                <div class="ribbon2">
                                 
                            
                                <hr>Name Of Examination : <c:out value="${examDetails.examName}"/><hr>
                                </div>
                                 
                                <div class="row ribbon" ><hr>
                                 <div class="col-md-3  style=" align="center" >
                                <h6>Answered  &emsp;</h6><h6 class="text-primary" id="answeredQuestions">0</h6>
                                </div>
                                <div class="col-md-2 style=" align="center"  >
                                <h6>For Review   &emsp;</h6><h6 class="text-primary" id="reviwedQuestions">0</h6>
                                </div>
                               
                                <div class="col-md-2 style=" align="center"  >
                                <h6>Un Answered   &emsp;</h6><h6 class="text-primary" id="unAnsweredQuestions">0</h6>
                                </div>
                                <div class="col-md-2 style=" align="center"  >
                                <h6>Not Visited   &emsp;</h6><h6 class="text-primary" id="notVisited">0</h6>
                                </div>
                                <div class="col-md-3 style=" align="center"  >
                              <%--  <h6>Time remaining  &emsp;</h6><h6 class="text-primary"> <c:out value="${totalTimeAllowedForExam}"/></h6> --%>
                                   <h6>Time remaining  &emsp;</h6> <span style="color:red;font-weight:550;font-size:20px;" class="timer" id="countdown"></span>
                                </div>
                                <input type="hidden" id="qnPaperNumber" value="${qnID}">
                                <hr>
                                </div><br>
                                <div class="row">
                                <div class="col-md-4">
                                <h6 class="text-primary">&emsp;&emsp; Question - <span id="questionNumber"></span>/<c:out value="${totalQuestions}"/></h6>
                                </div>
                                <div class="col-md-4"></div>
                                <div class="col-md-4">
                                
                                </div>
                                </div>
                            
                            <div class="card-body all-icons" style="height:500px; overflow-y:auto;">
                                <span style="white-space:pre-wrap;word-wrap:break-word;-ms-word-wrap:break-word;overflow-wrap:break-word;">
                                <p  style="color:#000;font-weight:400;font-size:17px;padding: 3px 15px 10px 15px; " id="question" class="blockquote blockquote-info">                                           

								<img id="questionImg" src="#" alt="Question image" />
                                </p>
                                </span>
                                    <form id="inputAnswerForm">
                                     
                                    </form>
                                                
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer">
                <div class="container">
					<div class="fixed">
                                                <div class="row">
                                                <div class="col-md-2">

                                               <button type="button"  id="calculate"  class="btn btn-md btn-warning" style="font-weight:400;font-size:16px;width: 120px;" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" data-color="blue">Calculator</button>
                                              
                                                </div>
                                                 <div class="col-md-3">
                                                </div>
                                                <div class="col-md-2">

                                                <div class="checkbox">
                                                  <p style="font-weight:400;font-size:16px;" class="btn btn-md btn-success"><input style="color:#fff ; size: 100px; " type="checkbox" id="markForReview" value="" disabled="disabled"> &nbsp; Mark For Review</p>
                                                </div>
                                                </div>

                                                 <div class="col-md-1">
                                                </div>
                                                <div class="col-md-2">

                                                <button style="font-weight:500;font-size:16px;width: 120px;" id="previous" class="btn btn-md btn-info" >Previous</button>&emsp;
                                                </div>
                                                <div class="col-md-2">
                                                <button style="font-weight:500;font-size:16px;width: 120px;" id="saveAndNext" class="btn btn-md btn-danger">Next</button>
                                                </div>
                                                </div>

                    </div>
                </div>
                <!-- <button id="launchIntoFullscreen" onClick="window.open('/startExam', 'test', 'fullscreen=yes')" >Full Screen</button> -->
            </footer>

        </div>
    </div>
  </div>
 
 
  
  
  
  
 <div class="DemoModal2">
 
    <div id="DemoModal2" class="modal fade " data-backdrop="static"> <!-- class modal and fade -->
      
    <div class="modal-dialog modal-lg" style="top:calc(40% - 170px);">
        <div class="modal-content">
          
           <div class="modal-header"> <!-- modal header -->
            
			 
                    
           </div>
		 
     <div class="modal-body"> <!-- modal body -->
     
       <p style="text-align:center; font-weight:600;font-size:15px;"><b>To Confirm Start Exam</b></p>
       <button type="button"  style="font-weight:800;font-size:20px;margin-left:300px;line-height:50px;"  class="btn btn-info "  onclick="show()" data-dismiss="modal"> <b><strong><u>Click Here</u></strong> <br> </b></button>
     </div>
	 
     <div class="modal-footer"> <!-- modal footer -->
       
      </div>
				
      </div> <!-- / .modal-content -->
      
    </div> <!-- / .modal-dialog -->
      
 </div><!-- / .modal -->
</div> 
  
  
  
  <div class="modal fade bd-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="false">
  <div class="modal-dialog modal-sm" style="top:calc(30% - 170px);">
    <div class="modal-content">
     <div class="modal-header">
        
          </div>
            <div class="modal-body"> <!-- modal body -->
            <p style=" font-weight:100;font-size:20px;font-color:black;">Are you sure to end exam ?</p>
            <div style="margin-left:80px; line-height:0px;">
       <button type="button"  style=" font-weight:100;font-size:15px;line-height:20px;"  class="btn btn-info" onClick="endExambtn();"  data-dismiss="modal"><b><strong>OK</strong></b></button>
     <button type="button"  style="right; font-weight:100;font-size:15px;line-height:20px;"  class="btn "   data-dismiss="modal"><b><strong>Cancel</strong></b></button>
     </div>
     </div>
       <div class="modal-footer"> <!-- modal footer -->
       
      </div>
      
    </div>
  </div>
</div>
  
  
  
     <div class="modal fade bd-timer-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" data-keyboard="false" data-backdrop="static">
  <div class="modal-dialog modal-sm" style="top:calc(30% - 170px);">
    <div class="modal-content">
     <div class="modal-header">
        
          </div>
            <div class="modal-body"> 
            <p align="center"style=" font-weight:100;font-size:14px;font-color:black;line-height:25px; "><b><strong>Time allowed for the exam is over !!<br>You will redirected to success page!!</b></strong></p>
            <div style="margin-left:80px; line-height:0px;">
       <button type="button"  style="font-weight:50px;font-size:18px;margin-left:-30px;line-height:30px;"  class="btn btn-danger" onClick="endExambtn();"  data-dismiss="modal"><b><strong>Submit Exam</strong></b></button>
     </div>
     </div>
       <div class="modal-footer"> 
       
      </div>
      
    </div>
  </div>
</div>
  
  
  
  
  
  
  
  
  <div class="modal custom fade" id="exampleModal" tabindex="-1" role="dialog"  data-keyboard="false" data-backdrop="false" >
  <div class="modal-dialog" role="document" style="top:calc(60% - 170px);" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" align="center">Calculator</h5>



      </div>
      <div class="modal-body" >
       <div class="form-group">


            <form name="calculator">
   &nbsp; &nbsp;<input type="textarea" id="ans" name="ans"  style="height: 40px; width: 200px ;margin-right:20px;" value=""><br><br>
<input type="button"  value="1" class="calculator" onClick="document.calculator.ans.value+='1'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="2" class="calculator" onClick="document.calculator.ans.value+='2'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="3" class="calculator" onClick="document.calculator.ans.value+='3'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="+"  style="height: 30px; width:30px ; background-color:#80d82fe6;"  onClick="document.calculator.ans.value+='+'"><br><br>
<input type="button" value="4" class="calculator" onClick="document.calculator.ans.value+='4'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="5" class="calculator" onClick="document.calculator.ans.value+='5'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="6" class="calculator" onClick="document.calculator.ans.value+='6'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="*"  style="height: 30px; width:30px ; background-color:#80d82fe6;"   onClick="document.calculator.ans.value+='*'"><br><br>
<input type="button" value="7"  class="calculator" onClick="document.calculator.ans.value+='7'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="8"  class="calculator" onClick="document.calculator.ans.value+='8'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="9"  class="calculator" onClick="document.calculator.ans.value+='9'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="/"  style="height: 30px; width:30px ; background-color:#80d82fe6;"  onClick="document.calculator.ans.value+='/'"><br><br>
<input type="button" value="-"  style="height: 30px; width:30px ; background-color:#80d82fe6;"   onClick="document.calculator.ans.value+='-'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;




<input type="button" value="0"   class="calculator"  onClick="document.calculator.ans.value+='0'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="button" value="="  style="height: 30px; width:30px ; background-color:#80d82fe6;"  onClick="document.calculator.ans.value=eval(document.calculator.ans.value)">&nbsp;&nbsp;&nbsp;
<input type="reset"  style="height: 30px; width:50px ;background-color:#80d82fe6;"value="Clear">
</form>

        </div>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>



</body>
<style>
/*.modal-backdrop{
  display: none !important;
} */




</style>


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

<!-- Chart JS -->
<script src="js/lockExamPage.js"></script>
<script src="js/newConductExamHelper.js"></script>






 <script>
  $("#ans").keypress(
		  function(event){
		    if (event.which == '13') {
		      event.preventDefault();
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





<script>

    $( document ).ready(function() {
        loadQuestionsFromDb("${examId}", "${totalQuestions}");
        $('#DemoModal2').modal('show');//calling confirm exam button(modal)
        window.history.pushState(null, "", window.location.href);        
        window.onpopstate = function() {
            window.history.pushState(null, "", window.location.href);
        };        
    });
</script>

<script>
//full screen code
    function show() {
    	var countdownTimer = setInterval('timer()', 1000);
        var elem = document.body;
        if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
            if (elem.requestFullScreen) {
                elem.requestFullScreen();
            } else if (elem.mozRequestFullScreen) {
                elem.mozRequestFullScreen();
            } else if (elem.webkitRequestFullScreen) {
                elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
            } else if (elem.msRequestFullscreen) {
                elem.msRequestFullscreen();
            }
        } else {
            if (document.cancelFullScreen) {
                document.cancelFullScreen();
            } else if (document.mozCancelFullScreen) {
                document.mozCancelFullScreen();
            } else if (document.webkitCancelFullScreen) {
                document.webkitCancelFullScreen();
            } else if (document.msExitFullscreen) {
                document.msExitFullscreen();
            }
            
        }

   }
</script>

<!-- <script type="text/javascript">
    window.onbeforeunload = function() {
        return "Dude, are you sure you want to leave? Think of the kittens!";
    }
</script> -->


<script>

var min = "${totalTimeAllowedForExam}";//timer code
var seconds = min * 60;

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
    if (seconds <= 0) {
        //clearInterval(countdownTimer);
        //document.getElementById('countdown').innerHTML = "Time up";
        //window.location = "/pathTDS/computeResult";
    	$('.bd-timer-modal-sm').modal('show');
    } else {
        seconds--;
        if(!navigator.onLine){  
        	 alert("You're offline. Please close this window and login to the exam portal again to finish the exam.");
        	 
        }
    }
}

</script>
<script type="text/javascript">

function disable()
{
 /* document.onkeydown = function (e) 
 {
  return false;
 } */
}

</script>
<script>
//disable right click
document.oncontextmenu = document.body.oncontextmenu = function() {return false;}
</script>


  
</html>
