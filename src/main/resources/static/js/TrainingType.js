$("#classparamclick").click(function(e){
	var type=$("#prm_type").val().trim();
	 var name=$("#prm_name").val().trim();
	
	
	
	if(type!=""&&name!=""){
	 var url = "/pathTDS/Trainingtypesetup";
     var formData = $("#Typeparameter").serializeArray();

     $.ajax({
   	  
         type: "POST",
         
         data: formData,
         url: url,
         // serializes the form's elements.
         success: function(data) {
      	  
             // show response from the php script.
             /*if (data !== null) {
              alert("Training type added sucessfully");
              window.location.href = "/pathTDS/TrainingType";
             }*/
             if (data == "duplicate") {
                 alert("Training type already exists.");
                 window.location.href = "/pathTDS/TrainingType";
             }else{
            	 alert("Training type added sucessfully");
                 window.location.href = "/pathTDS/TrainingType";
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
	
		
		
	if(type!=""&&name!=""){
var url = "/pathTDS/Trainingtypesetup?userId=" + userid;

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

           alert("Training type updated successfully.");
           window.location.href = "/pathTDS/TrainingType";
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
