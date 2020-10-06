$("#classparamclick").click(function(e){
	var type=$("#prm_type").val().trim();
	 var name=$("#prm_shortname").val().trim();
	var sort=$("#prm_sort").val().trim();
	
	
	if(type!=""&&name!=""&&sort!=""){
	 var url = "/pathTDS/settraining";
     var formData = $("#classparameter").serializeArray();

     $.ajax({
   	  
         type: "POST",
         
         data: formData,
         url: url,
         // serializes the form's elements.
         success: function(data) {
      	  
             // show response from the php script.
             /*if (data !== null) {

              alert("Training evaluavtion details added sucessfully");
              window.location.href = "/pathTDS/trainingEval";
             }*/
             
             if(data=="duplicate"){
            	 alert("Duplicate entry.. Same entry exists for Indicator name and value.");
                 window.location.href = "/pathTDS/trainingEval";            	 
             }
             if(data=="sucess"){
            	 alert("Training evaluavtion details added sucessfully");
                 window.location.href = "/pathTDS/trainingEval";            	 
             }
            
         },
            error: function(data) {
             console.log("error");
            }
           });
     }
	
	else{
		alert("please fill the fields");
	}
      e.preventDefault();
          });
    




     function updateclass(userid) {
    	 var type=$("#prm_type").val().trim();
    	 var name=$("#prm_shortname").val().trim();
    	 var sort=$("#prm_sort").val().trim();
    		
    		
    	if(type!=""&&name!=""&&sort!=""){
    var url = "/pathTDS/settraining?userId=" + userid;
   
       var formData = $("#classeditparameter").serializeArray();
       //alert("user details updated successfully.");
       $.ajax({
    	  
           type: "POST",
           
           data: formData,
           url: url,
           // serializes the form's elements.
           success: function(data) {
        	  
               // show response from the php script.
               if (data !== null) {

                alert("Training evaluavtion details updated successfully.");
                window.location.href = "/pathTDS/trainingEval";
               }
              },
              error: function(data) {
               console.log("error");
              }
             });}
    	else{
    		alert("please fill the fields");
    		return false;
    
    	}

        e.preventDefault();


       }
    	 
     $(document).ready(function() {
		    $("#prm_sort").keydown(function (e) {
		        // Allow: backspace, delete, tab, escape, enter and .
		        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
		             // Allow: Ctrl+A, Command+A
		            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
		             // Allow: home, end, left, right, down, up
		            (e.keyCode >= 35 && e.keyCode <= 40)) {
		                 // let it happen, don't do anything
		                return;
		                
		        }
		        // Ensure that it is a number and stop the keypress
		        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
		            e.preventDefault();
		        }
		    });
		}); 
     
    	


 