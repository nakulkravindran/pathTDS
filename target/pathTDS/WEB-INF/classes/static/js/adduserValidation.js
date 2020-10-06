
  

function EmailValidate() {
   	    var x = $("#emailid").val();
   	    var atpos = x.indexOf("@");
   	    var dotpos = x.lastIndexOf(".");
   	    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
   	    	$('#valiemail').show();	
   	    
   	        return false;
   	    }
   	    else{
   	    	$('#valiemail').hide();		
   	    }
   	}