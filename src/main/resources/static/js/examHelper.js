$("#announceexam").click(function(e) {
     $(this).hide();
	 var examName=$("#examName").val();
	 var examId=$("#examId").val();
	 var questionPaperNumber=$("#questionPaperNumber").val(); 
	 var examDate=$("#examDate").val();
	 var finalExamDate=$("#finalExamDate").val();
	 var examTime=$("#examTime").val();
	 var accessibleTimeFrom=$("#accessibleTimeFrom").val();
	 var accessibletimeTo=$("#accessibletimeTo").val();
	 
if(examName!="" && examId==""&&questionPaperNumber!=""&&examDate!=""&&finalExamDate!=""&&examTime!=""&&accessibleTimeFrom!=""&&accessibletimeTo!=""){
	 
 var url = "/pathTDS/announceExam";
 var formData = $("#examannouncement").serializeArray();

 $.ajax({
  type: "POST",
  url: url,
  data: formData, // serializes the form's elements.
  success: function(data) {
   // show response from the php script.	  
   var succStr=data.substring(0, 6);
   var exidStr=data.substring(7, data.length);   
   if (succStr == "sucess") {
    //alert("Exam Created successfully.\nExam Id - " +examId+ "\nLink - http://localhost:8080/pathTDS/registrationDetails?examId=" + examId);
    alert("Exam Created successfully.\nExam Id - " +exidStr+ "\nLink - http://localhost:8080/pathTDS/registrationDetails?examId=" + examId);
	   
    window.location.href = "/pathTDS/index";
   }
   else{
   	alert("Exam Id Already exist.....");	
   	 console.log("error"); 
   }
  },
  error: function(data) {

   console.log("error");
  }
 });

 e.preventDefault();
 }
else{
	alert("please fill all the fields")
	return false;
}

});



 function updateExam(examId) {

    //alert("updating Exam");
    var url = "/pathTDS/announceExam?updateId=" + examId;
       var formData = $("#examannouncement").serializeArray();
       //alert("Exam details updated successfully.");

       $.ajax({
        type: "POST",
        url: url,
        data: formData, // serializes the form's elements.
        success: function(data) {
         // show response from the php script.
         if (data != null) {

          alert("Exam details updated successfully.");
          window.location.href = "/pathTDS/viewExam";
         }
        },
        error: function(data) {
         console.log("error");
        }
       });

       e.preventDefault();

  }