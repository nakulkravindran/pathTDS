$("#classparamclick").click(function(e){
	var type=$("#prm_type").val().trim();
	 var name=$("#prm_name").val().trim();
	var shortname=$("#prm_shortname").val().trim();
	
	
	if(type!=""&&name!=""&&shortname!=""){
	 var url = "/pathTDS/setparameter";
     var formData = $("#classparameter").serializeArray();

     $.ajax({
   	  
         type: "POST",
         
         data: formData,
         url: url,
         // serializes the form's elements.
         success: function(data) {
      	  
             // show response from the php script.
             if (data !== null) {

              alert("new class added sucessfully");
              window.location.href = "/pathTDS/parameter";
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
    	 var name=$("#prm_name").val().trim();
    	var shortname=$("#prm_shortname").val().trim();
    	
    	if(type!=""&&name!=""&&shortname!=""){
    var url = "/pathTDS/setparameter?userId=" + userid;
   
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

                alert("class details updated successfully.");
                window.location.href = "/pathTDS/parameter";
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
    	 
    	 
    function checkFunction(){
    	
    	 var qnno=$("#prm_shortname").val();
    	
    	 
    	  var inps = document.getElementsByName('checkshort[]');
    	 
    		var flag=false;
     
    		var inp;
       
       
       for (var i = 0; i <inps.length; i++) {
    			inp=inps[i];
    			    
    			if(inp.value==qnno){
    				flag=true;
    				break;
    			}
             }
    			
       if(flag==true){
    	   alert("Short name already exist !!");
     	  document.getElementById("classparamclick").disabled =true;
     	  
       }
       else{
     	  
     	  document.getElementById("classparamclick").disabled = false;
       }
       
      }

    	


 