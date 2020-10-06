
$('input[type=text]').on('input',function(){
	var qnsc="#qnSc_"+$(this).attr('id');	
	var qnsc1=$(qnsc).attr("data_value");	
	var nwsc=$(this).val();		
	if(Number(nwsc)>Number(qnsc1)){
		alert("New score should be less than question score.");
		$(this).val('0');
	}
});

$("#saveChangesButton").click(function(e){		
            var url = "/pathTDS/updateUpgradeScores";
            var formData = $("#upgradeScoreForm").serializeArray();       
           
            //console.log(formData);
            var requestDataToSend = [];
            var requestData = {};           
            
            $('input[type=text]').each(function(){
        	    
        	    requestData = {};
                requestData["id"] = $(this).attr('id');;
                requestData["newScore"] = $(this).val();;
                requestDataToSend.push(requestData);
        	})
            
            requestData = {};
            requestData["resultDetailsList"] = requestDataToSend;

            //console.log("requestData : " + JSON.stringify(requestData));
            //console.log("requestDataToSend : " + JSON.stringify(requestDataToSend));


            $.ajax({
               type: "POST",
               url: url,
               data: JSON.stringify(requestDataToSend),

               contentType:'application/json',
               success: function(data)
               {
                   if(data === "success"){
                    alert("Changes saved successfully.");
                    window.location.href = "/pathTDS/UpgradeScoreResult";
                   }
               },
               error: function(data){
                alert("Error occured while making changes.");
                console.log("error : " + JSON.stringify(data));
               }
             });

             e.preventDefault();

});
