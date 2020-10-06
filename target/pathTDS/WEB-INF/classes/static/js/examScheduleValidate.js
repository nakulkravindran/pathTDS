  
  function examnameFunction(){
	 var a= $("#examName").val();
	 if(a==""){
	 $('#exmname').show();
	 }
   }
  
  
  function hideexmname(){
	   $('#exmname').hide();
   }
	  
   
   
   
   function examidFunction(){
	   var a= $("#examName").val();
	   var b=$("#examId").val();
		 if(a==""&&b==""){
		 $('#exmname').show();
		 $('#exmid').show();
		 }
		 
		 else if(b==""){
			 $('#exmid').show(); 
		 }
     }
   
   
   
   
   function hideexmid(){
	   $('#exmid').hide();
   }
   
   
   function qnpaperFunction(){
	   var a= $("#examName").val();
	   var b=$("#examId").val();
	   var c=$("#questionPaperNumber").val();
		 if(a==""&&b==""&&c==""){
		 $('#exmname').show();
		 $('#exmid').show();
		 $('#qnno').show();
		 }
		 
		 else if(b==""&&c==""){
			
			 $('#exmid').show();
			 $('#qnno').show();
			 }
		 else if(c==""){
				
			
			 $('#qnno').show();
			 }
		 }
   
     function hideqnpaper(){
    	 $('#qnno').hide();
     }
     
     
     
     function exmdateFunction(){
    	 
      var a= $("#examName").val();
   	   var b=$("#examId").val();
   	   var c=$("#questionPaperNumber").val();
   	   var d=$("#examDate").val();
   		 if(a==""&&b==""&&c==""&&d==""){
   		 $('#exmname').show();
   		 $('#exmid').show();
   		 $('#qnno').show();
   		 $('#exmdate').show();
   		 }
   		else if(b==""&&c==""&&d==""){
      		
       		 $('#exmid').show();
       		 $('#qnno').show();
       		 $('#exmdate').show();
       		 }
   		 
   		else if(c==""&&d==""){
      		 
       		 $('#qnno').show();
       		 $('#exmdate').show();
       		 }
   		else if(d==""){
      		 
      		
      		 $('#exmdate').show();
      		 }
   		 
   		 
     }
     
     function hideexamdate(){
    	 $('#exmdate').hide();
     }
     
     
     
      function finalexmFunction(){
    		 
          var a= $("#examName").val();
       	   var b=$("#examId").val();
       	   var c=$("#questionPaperNumber").val();
       	   var d=$("#examDate").val();
       	   var e=$("#finalExamDate").val();
       		 if(a==""&&b==""&&c==""&&d==""&&e==""){
       		 $('#exmname').show();
       		 $('#exmid').show();
       		 $('#qnno').show();
       		 $('#exmdate').show();
       		 $('#finalexmdate ').show();
       		 }
       		 
       		 else if(b==""&&c==""&&d==""&&e==""){
           		 
           		 $('#exmid').show();
           		 $('#qnno').show();
           		 $('#exmdate').show();
           		 $('#finalexmdate ').show();
           		 }
       		 else  if(c==""&&d==""&&e==""){
           		 
           		 $('#qnno').show();
           		 $('#exmdate').show();
           		 $('#finalexmdate ').show();
           		 }
       		 else  if(d==""&&e==""){
           		
           		 $('#exmdate').show();
           		 $('#finalexmdate ').show();
           		 }
       		 else if(e==""){
           		
           		 $('#finalexmdate ').show();
           		 }
      }
     
      function hidefinalexamdate(){
     	 $('#finalexmdate').hide();
      }
      
      
      function starttimeFunction(){
    	  var a= $("#examName").val();
      	   var b=$("#examId").val();
      	   var c=$("#questionPaperNumber").val();
      	   var d=$("#examDate").val();
      	   var e=$("#finalExamDate").val();
      	   var f=$("#examTime").val();
      		 if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""){
      		 $('#exmname').show();
      		 $('#exmid').show();
      		 $('#qnno').show();
      		 $('#exmdate').show();
      		 $('#finalexmdate ').show();
      		$('#exmstart ').show();
      		 }
      		 
      		 
      		 else if(b==""&&c==""&&d==""&&e==""&&f==""){
          		
          		 $('#exmid').show();
          		 $('#qnno').show();
          		 $('#exmdate').show();
          		 $('#finalexmdate ').show();
          		 $('#exmstart ').show();
          		 }
      		else if(c==""&&d==""&&e==""&&f==""){
          		
         		 
         		 $('#qnno').show();
         		 $('#exmdate').show();
         		 $('#finalexmdate ').show();
         		 $('#exmstart ').show();
         		 }
      		 
      		else if(d==""&&e==""&&f==""){
          		
        		 
        		
        		 $('#exmdate').show();
        		 $('#finalexmdate ').show();
        		 $('#exmstart ').show();
        		 }
      		else if(e==""&&f==""){
            $('#finalexmdate ').show();
       		 $('#exmstart ').show();
       		 }
      		else if(f==""){
              
           		 $('#exmstart ').show();
           		 }
      }
      
       function hideexamstart(){
    	   $('#exmstart ').hide();
       }
      
       
       function acctimetoFunction(){
    	   var a= $("#examName").val();
      	   var b=$("#examId").val();
      	   var c=$("#questionPaperNumber").val();
      	   var d=$("#examDate").val();
      	   var e=$("#finalExamDate").val();
      	   var f=$("#examTime").val();
      	   var g=$("#accessibleTimeFrom").val();
      		 if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
      		 $('#exmname').show();
      		 $('#exmid').show();
      		 $('#qnno').show();
      		 $('#exmdate').show();
      		 $('#finalexmdate ').show();
      		$('#exmstart ').show();
      		$('#acctimefrom  ').show();
      		 }
      		 
      		 else  if(b==""&&c==""&&d==""&&e==""&&f==""&&g==""){
          		
          		 $('#exmid').show();
          		 $('#qnno').show();
          		 $('#exmdate').show();
          		 $('#finalexmdate ').show();
          		$('#exmstart ').show();
          		$('#acctimefrom  ').show();
          		 }
      		 else  if(c==""&&d==""&&e==""&&f==""&&g==""){
          		 
          		 $('#qnno').show();
          		 $('#exmdate').show();
          		 $('#finalexmdate ').show();
          		$('#exmstart ').show();
          		$('#acctimefrom  ').show();
          		 }
      		else  if(d==""&&e==""&&f==""&&g==""){
         		 
         		  $('#exmdate').show();
         		 $('#finalexmdate ').show();
         		$('#exmstart ').show();
         		$('#acctimefrom  ').show();
         		 }
      		else if(e==""&&f==""&&g==""){
        		 
       		  
       		 $('#finalexmdate ').show();
       		$('#exmstart ').show();
       		$('#acctimefrom  ').show();
       		 }
      		else if(f==""&&g==""){
                 $('#exmstart ').show();
          		$('#acctimefrom  ').show();
          		 }
      		else if(g==""){
              
         		$('#acctimefrom  ').show();
         		 }
       }
       
       
       function hideacctimefrom(){
    	   $('#acctimefrom ').hide();
       }
       
       
       
       
       function whoFunction(){
    	   var a= $("#examName").val();
      	   var b=$("#examId").val();
      	   var c=$("#questionPaperNumber").val();
      	   var d=$("#examDate").val();
      	   var e=$("#finalExamDate").val();
      	   var f=$("#examTime").val();
      	   var g=$("#accessibleTimeFrom").val();
      	   var h=$("#accessibletimeTo").val();
      		 if(a==""&&b==""&&c==""&&d==""&&e==""&&f==""&&g==""&&h==""){
      		 $('#exmname').show();
      		 $('#exmid').show();
      		 $('#qnno').show();
      		 $('#exmdate').show();
      		 $('#finalexmdate ').show();
      		$('#exmstart').show();
      		$('#acctimefrom').show();
      		$('#acctimeto').show();
      		 }
      		 
      		 else if(b==""&&c==""&&d==""&&e==""&&f==""&&g==""&&h==""){
          		
          		 $('#exmid').show();
          		 $('#qnno').show();
          		 $('#exmdate').show();
          		 $('#finalexmdate ').show();
          		$('#exmstart').show();
          		$('#acctimefrom').show();
          		$('#acctimeto').show();
          		 }
      		 else if(c==""&&d==""&&e==""&&f==""&&g==""&&h==""){
           		
          		
          		 $('#qnno').show();
          		 $('#exmdate').show();
          		 $('#finalexmdate ').show();
          		$('#exmstart').show();
          		$('#acctimefrom').show();
          		$('#acctimeto').show();
          		 }
      		 else if(d==""&&e==""&&f==""&&g==""&&h==""){
                 $('#exmdate').show();
          		 $('#finalexmdate ').show();
          		$('#exmstart').show();
          		$('#acctimefrom').show();
          		$('#acctimeto').show();
          		 }
      		else if(e==""&&f==""&&g==""&&h==""){
              
         		 $('#finalexmdate ').show();
         		$('#exmstart').show();
         		$('#acctimefrom').show();
         		$('#acctimeto').show();
         		 }
      		
      		else if(f==""&&g==""&&h==""){
                
        		 
        		$('#exmstart').show();
        		$('#acctimefrom').show();
        		$('#acctimeto').show();
        		 }
      		else if(g==""&&h==""){
                
       		 
        		
        		$('#acctimefrom').show();
        		$('#acctimeto').show();
        		 }
               else if(h==""){
                
            $('#acctimeto').show();
        		 }
      		 
       }
       
      
     function hideacctimeto(){
    	 $('#acctimeto').hide();
     }
    	 
    
   