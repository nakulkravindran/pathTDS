

$(".pathEmployeeButton").click(function(){
    var checked = $('#pathEmployee').is(':checked');
    if(checked){
        $("#employeid").prop("disabled", false);
        $("#lineManager").prop("disabled", false);
        $("#lineManagerEmail").prop("disabled", false);
        $("#serviceDurationYear").prop("disabled", false);
        $("#serviceDurationMonth").prop("disabled", false);
        $("#approvedByLineManagerYes").prop("disabled",false);
        $("#approvedByLineManagerNo").prop("disabled",false);
    }
    else{
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

  $("#examRegisterButton").click(function(e){
	  var delVal = confirm("Are you sure to submit ?. Click 'OK' to confirm.");
  	if(delVal==true){
	  var candidateName= $("#candidateName").val();
	    var companyName=$("#companyName").val();
	     var location=$("#location").val();
	     var department=$("#department").val();
	   var jobTitle=$("#jobTitle").val();
	     var emailId=$("#emailId").val();
	  
	     if(candidateName !=""&&companyName!=""&&location!=""&&department!=""&&jobTitle!=""&&emailId!=""){
	    	
	  
            var url = "/pathTDS/registerApplicant";
             var formData = $("#examRegisterForm").serializeArray();
            
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
            	   alert("sucessfully Registered!!");
                   window.location.href = "/pathTDS/regisucess";
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
  
  
  $("#editApplicantButton").click(function(e){
	  var delVal = confirm("Are you sure to submit ?. Click 'OK' to confirm.");
  	if(delVal==true){
	  var candidateName= $("#candidateName").val();
	    var companyName=$("#companyName").val();
	     var location=$("#location").val();
	     var department=$("#department").val();
	   var jobTitle=$("#jobTitle").val();
	     var emailId=$("#emailId").val();
	  
	     if(candidateName !=""&&companyName!=""&&location!=""&&department!=""&&jobTitle!=""&&emailId!=""){
	    	
	  
            var url = "/pathTDS/registereditApplicant";
             var formData = $("#examRegisterForm").serializeArray();
             
            $.ajax({
               type: "POST",
               url: url,
               data: formData, // serializes the form's elements.
               success: function(data)
               {
            	  
                   window.location.href = "/pathTDS/viewApplicants?examId="+data;
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