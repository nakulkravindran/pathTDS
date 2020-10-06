

$("#saveChangesButton").click(function(e){
	
	
	var exmid=$("#exmid").val();
            var url = "/pathTDS/approveApplicants";
            var formData = $("#applicantApprovalForm").serializeArray();

            console.log(formData);

            var requestDataToSend = [];
            var requestData = {};

            $.each(formData, function(data){

                requestData = {};
                requestData["applicantId"] = formData[data].name;
                requestData["status"] = formData[data].value;
                requestDataToSend.push(requestData);




            });
            requestData = {};
            requestData["applicantsList"] = requestDataToSend;

            console.log("requestData : " + JSON.stringify(requestData));
            console.log("requestDataToSend : " + JSON.stringify(requestDataToSend));


            $.ajax({
               type: "POST",
               url: url,
               data: JSON.stringify(requestDataToSend),

               contentType:'application/json',
               success: function(data)
               {

                   if(data === "success"){
                    alert("Changes saved successfully.");
                    window.location.href = "/pathTDS/viewApplicants?examId="+exmid;
                   }
               },
               error: function(data){
                alert("Error occured while making changes.");
                console.log("error : " + JSON.stringify(data));
               }
             });

             e.preventDefault();

    });








$("#saveStatusBtn").click(function(e){
	
	
	var exmid=$("#exmid").val();
            var url = "/pathTDS/approvetrainingApplicants";
            var formData = $("#applicantApprovalForm").serializeArray();

            console.log(formData);

            var requestDataToSend = [];
            var requestData = {};

            $.each(formData, function(data){

                requestData = {};
                requestData["applicantId"] = formData[data].name;
                requestData["status"] = formData[data].value;
                requestDataToSend.push(requestData);




            });
            requestData = {};
            requestData["applicantsList"] = requestDataToSend;

            console.log("requestData : " + JSON.stringify(requestData));
            console.log("requestDataToSend : " + JSON.stringify(requestDataToSend));


            $.ajax({
               type: "POST",
               url: url,
               data: JSON.stringify(requestDataToSend),

               contentType:'application/json',
               success: function(data)
               {

                   if(data === "success"){
                    alert("Changes saved successfully.");
                    //window.location.href = "/pathTDS/viewApplicants?examId="+exmid;
                   }
               },
               error: function(data){
                alert("Error occured while making changes.");
                console.log("error : " + JSON.stringify(data));
               }
             });

             e.preventDefault();

    });














