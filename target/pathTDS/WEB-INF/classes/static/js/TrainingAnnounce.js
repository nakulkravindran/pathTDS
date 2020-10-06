$("#training").click(function(e){
     //$(this).hide();	
	 var Name=$("#name").val().trim();
	 var trainingtype=$("#trainingtype").val().trim();
	 var period=$("#period").val().trim();
	 var location=$("#location").val().trim();
	 var language=$("#language").val().trim();
	 var Regfinal=$("#Regfinal").val().trim();
	
     
	 if(Name!=""&&trainingtype!=""&&period!=""&&location!=""&&Regfinal!=""){
		 
		    var g1=$("#startdt").val();
			var g2=$("#submitdate").val();
		    var d1 = new Date(g1); 
		    var d2 = new Date(g2); 
		    
		    if((d2.getTime() < d1.getTime()) ){

		    	  alert("Last date of evaluation submission should be equal to or greater than the training start date.");
		 
		    }else{  	
		    	var url = "/pathTDS/Trainingdata";
		    	var formData = $("#trainingannouncement").serializeArray();

		    	$.ajax({	   	  
		    		type: "POST",	         
		    		data: formData,
		    		url: url,
		    		// serializes the form's elements.
		    		success: function(data) {
		    			
		    		
		    			if (data !== null) {
		    				alert("Training added sucessfully");
		    				window.location.href = "/pathTDS/TrainingAnnouncementjsp";
		    			}
		    		},
		    		error: function(data) {
		    			console.log("error");
		    		}
	           });
		    }
	     }else{
			alert("please fill the fields");
		}
	 e.preventDefault();
	

    });

  
function updateuser(traingid) {
		var g1=$("#startdt").val();
		var g2=$("#submitdate").val();
	    var d1 = new Date(g1); 
	    var d2 = new Date(g2); 
	    
	    if((d2.getTime() < d1.getTime()) ){

	    	  alert("Last date of evaluation submission should be equal to or greater than the training start date.");
	 
	    }else{  	
	   	
	    	var url = "/pathTDS/Trainingdata?traingid=" +traingid;   
	    	var formData = $("#trainingannouncement").serializeArray();
       
	    	$.ajax({
    	  
	    		type: "POST",           
	    		data: formData,
	    		url: url,
	    		// serializes the form's elements.
	    		success: function(data) {        	  
               
                if (data !== null) {

                	alert("Training details updated successfully.");
                	window.location.href = "/pathTDS/TrainingLink";
                }
              },
              	error: function(data) {
              		console.log("error");
              	}
             });
       
	      }

        e.preventDefault();


   }







	     