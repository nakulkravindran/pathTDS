$("#nextsection").click(function(e){
	 var formName=$("#formName").val();
	 var Details=$("#Details").val();
	
	 if(formName!=""&&Details!=""){
		 $('#questionDetails').show(); 
		 $('#nextsection').hide(); 
	 var url = "/pathTDS/Evalupload";
    //var formData = $("#uploadEvalForm").serializeArray();

     $.ajax({
        type: "POST",
        url: url,
        data: {formName:formName,Details:Details},
        //data: formData, // serializes the form's elements.
     success: function(data)
        {
    	 $("#formName").val(formName);	
    	 $("#Details").val(Details); 
    	 document.getElementById("formName").disabled = true;
    	 document.getElementById("Details").disabled = true;
    	 
        },
        error: function(data){
     	   
         console.log("error");
        
        }
      });
	 }
	 else{
		 alert("please fill fields");
	 }

      e.preventDefault();
	
    });



$("#nextfield").click(function(e){
	 var section=$("#section").val();
	 var answertype=$("#answertype").val();
	 var myParams = [];
     $.each($("input[name='ScreenId']:checked"), function(){            
    	 myParams.push($(this).val());
     });
	 
	 
	
	 if(section!=""&&answertype!=""){
		 $('#nextfield').hide(); 
		 $('#question').show();
		 $('#submitbuton').show(); 
	 var url = "/pathTDS/Evalsectionupload";
   var formData = $("#uploadsection").serializeArray();

    $.ajax({
       type: "POST",
       url: url,
      // data: {section:section,answertype:answertype,myParams:myParams},
       data: formData, // serializes the form's elements.
    success: function(data)
       {
    	 $("#section").val(section);	
    	 $("#answertype").val(answertype); 
    	 document.getElementById("section").disabled = true;
    	 document.getElementById("answertype").disabled = true;
    	
       },
       error: function(data){
    	   
        console.log("error");
       
       }
     });
	 }
	 else{
		 alert("please fill fileds");
	 }

     e.preventDefault();
	
   });



$("#addnext").click(function(e){                //for question Upload
	 var section=$("#section").val();
	 var answertype=$("#answertype").val();
	 var formName=$("#formName").val();
	 var Details=$("#Details").val();
     var question=$("#quest").val();
	 
	 //alert(question);
	
	 if(question!=""){
		 $('#nextfield').hide(); 
		 $('#question').show(); 
		 
	 var url = "/pathTDS/EvalQuestions";
 // var formData = $("#EvalQuestions").serializeArray();

   $.ajax({
      type: "POST",
      url: url,
      data: {question:question},
      //data: formData, // serializes the form's elements.
   success: function(data)
      {
	   alert("Sucessfully added Question");
	   $("#quest").val("");
         
      },
      error: function(data){
   	   
       console.log("error");
      
      }
    });
	 }
	 else{
		 alert("please fill fileds");
	 }

    e.preventDefault();
	
  });
 

$("#Submitsection").click(function(e){     //for adding another section 
	
	$('#questionDetails').hide();
	$('#NextSection').show();
	
	var sect=$("#sect").val();
	var responsetype=$("#responsetype").val();
	 var section=$("#section").val();
	 var answertype=$("#answertype").val();
	var question=$("#quest").val();
	
 if(question!=""){
	var url = "/pathTDS/EvalnextSection";
	$.ajax({
	      type: "POST",
	      url: url,
	      data: {sect:sect,responsetype:responsetype,question:question,section:section,answertype:answertype},
	     //data: formData, // serializes the form's elements.
	   success: function(data)
	      {
		   
		   alert("Sucessfully added Question");
		   $("#quest").val("");
		  
	    	 
	      },
	      error: function(data){
	   	   
	       console.log("error");
	      }
	
	   });
	
 }
 else{
	 alert("please fill the fields");
 }
	
	 e.preventDefault();
});
	/* var url = "/pathTDS/EvalnextSection";
	var formData = $("#NextSection").serializeArray();
	formData.append('question', question);
	   $.ajax({
	      type: "POST",
	      url: url,
	     // data: {question:question},
	     data: formData, // serializes the form's elements.
	   success: function(data)
	      {
		   alert("Sucessfully added Question");
		   $("#quest").val("");
	         
	      },
	      error: function(data){
	   	   
	       console.log("error");
	      }
	
	   });
	  
		
});*/
	
  





