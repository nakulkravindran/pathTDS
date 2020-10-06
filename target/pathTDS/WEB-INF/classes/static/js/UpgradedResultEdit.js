
$('input[type=text]').on('change',function(e){
	var mark=isNaN(parseInt($(this).val()))?0:parseInt($(this).val());
	$(this).val(mark);
	var tot=isNaN(parseInt($(this).attr("data_secM")))?0:parseInt($(this).attr("data_secM"));
	
	if(mark>tot){
		alert("Obtained score cannot be greater than the section total score.");
		$(this).val('0');
	}
});

$(".btnSaveR").click(function(e){	
	
            var url = "/pathTDS/saveNewScore";
           
            var requestDataToSend = [];
            var requestData = {};           
            
            var chkId="false";            
            var idStr=$(this).attr('id');
            if(idStr==undefined){
            	idStr=$(this).attr('data_id');
            	chkId="true";
            }   	
        	    
        	    if(chkId=="true"){requestData["id"] = 0;}
        	    else{requestData["id"] =idStr;}        	    
                requestData["applicantId"] = $("#applicantId_"+idStr).val();
                requestData["applicantName"] = $("#applicantNm_"+idStr).val(); 
                requestData["section1"] = $("#1txt_"+idStr).val();
                requestData["section2"] = $("#2txt_"+idStr).val();
                requestData["section3"] = $("#3txt_"+idStr).val(); 
                requestData["section4"] = $("#4txt_"+idStr).val();                 
                requestData["examId"] = $("#examId").val();
                requestData["questionPaperId"] = $("#questionPaperNumber").val();
                requestData["scoreType"] = "new";
                requestData["finalResult"] = "yes";   
                requestData["correctAnswers"] =$("#correctAnswers_"+idStr).val();
                requestData["questionsAttempted"] =$("#questionsAttempted_"+idStr).val();
                requestData["timeTaken"] =$("#timeTaken_"+idStr).val();
                requestData["attendedDate"] =$("#attendedDate_"+idStr).val();
                requestData["attendedTime"] =$("#attendedTime_"+idStr).val();
                
            $.ajax({
               type: "POST",
               url: url,
               data: requestData,               
               //contentType:'application/json',
               success: function(data)
               { 
            	   var succStr=data.substring(0, 7);
            	   var exidStr=data.substring(8, data.length);  
                   if(succStr === "success"){
                    alert("Changes saved successfully.");
                    window.location.href = "/pathTDS/UpgradedResultEdit?examId="+exidStr;
                   }
               },
               error: function(data){
                alert("Error occured while making changes.");               
                console.log("error : " + JSON.stringify(data));
               }
             });

             e.preventDefault();

});