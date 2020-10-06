

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




  $("#examRegisterButton").click(function(e){
	  e.preventDefault();
	  var email12same=Email12same();
	  var emailvalidate1=EmailValidate1();
	  var emailexist1=Emailexist1();
	  if(email12same && emailvalidate1 && !emailexist1){
	  var delVal = confirm("Are you sure to submit ?. Click 'OK' to confirm.");
  	if(delVal==true){
	    var candidateName= $("#candidateName").val();
	    var companyName=$("#companyName").val();
	    var location=$("#location").val();
	    var department=$("#department").val();
	    var jobTitle=$("#jobTitle").val();
	    var emailId=$("#emailId").val();
	    var emailId1=$("#emailId1").val();
	    var y="notempty";
	    var checked = $('#pathEmployee').is(':checked');
	    if(checked){
	    	var employeid= $("#employeid").val();
	    	var lineManager= $("#lineManager").val();
	    	var lineManagerEmail= $("#lineManagerEmail").val();
	    	var serviceDuration= $("#serviceDuration").val();
	    	if(employeid !=""&&lineManager!=""&&lineManagerEmail!=""&&serviceDuration!=""){	    		
	    	}else{y="";}
	    	var z="notempty";
		    var k=$("input[name='approvedByLineManager']:checked").val();
			if(k==undefined){
				 z="";
			}
	    }
	    		
	     if(candidateName !=""&&companyName!=""&&location!=""&&department!=""&&jobTitle!=""&&emailId!=""&&emailId1!=""&&y!=""&&z!=""){
	    	
	  
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
  	
	  }else{  // email alerts
		  if(!email12same){
			  alert("Please make sure the two emails are same");
		  }
		  if(!emailvalidate1){
			  alert("Please type in valid email");
		  }
		  if(emailexist1){
			  alert("Please type in email that does not exists");
		  }
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
  
  function EmailValidate1() {
 		$('#exstemail1').hide();
 	    var x = $("#emailId1").val();
 	    var atpos = x.indexOf("@");
 	    var dotpos = x.lastIndexOf(".");
 	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
 	    	//$('#valiemail1').show();	
 	    	//document.getElementById("examRegisterButton").disabled = true;
 	        return false;
 	    }
 	    else{
 	    	//$('#valiemail1').hide();	
 	    	//document.getElementById("examRegisterButton").disabled = false;
 	    	return true;
 	    }
  }
  
  function Emailexist1(){	 
 		 $('#email1').hide(); 
    	 $('#valiemail1').hide();
 		 var x = $("#emailId1").val();
 		 var inps = document.getElementsByName('appemail[]');
 		 var flag=false;  
 		 var inp;
 		 for (var i = 0; i <inps.length; i++) {
 			 inp=inps[i];		    
 			 if(inp.value==x){			
 				 //$('#exstemail1').show();
 				 //document.getElementById("examRegisterButton").disabled = true;
 				 return true;
			}
		
 		 }
  
	 }
  
  function Email12same(){
	  var x = $("#emailId").val();
	  var x1 = $("#emailId1").val();
	  if(x==x1){
		  return true;
	  }else{
		  return false;
	  }
	  
  }