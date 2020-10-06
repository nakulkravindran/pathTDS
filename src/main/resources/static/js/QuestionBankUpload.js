
$("#saveandnxt").click(function(e) {

	var Qn_type=$("#Qn_type").val();
	var className=$("#className").val();
	var Section=$("#Section").val();
	var difficultylevel=$("#difficultylevel").val();
	var timeperQuestion=$("#timeperQuestion").val();

	var Question=$("#Question").val();
	var answerMultiple=$("#answerMultiple").val();
	var answerDescrptive=$("#answerDescrptive").val();
	
	
	
	if(Qn_type!=""&&className!=""&&Section!=""&&difficultylevel!=""&&timeperQuestion!=""&&Question!=""){
		
		if(Qn_type=="multiple"&&answerMultiple==null){
			alert("please fill the  fields");
		}
		else if(Qn_type=="descriptive"&&answerDescrptive==""){
			alert("please fill the fields");
		}
		else{
        var url = "/pathTDS/BankQuestions"; // the script where you handle the form input.

      

        var formData = $("#uploadQuestionsForm").serializeArray();

        $.ajax({
               type: "POST",
               url: url,
               async: false,
               data: formData, // serializes the form's elements.
               success: function(data)
               {
                   
                   alert("Question saved successfully.");
                  
                   window.location.href = "/pathTDS/CreateQuestions";
                 

               },
               error: function(data){
                console.log("error");
               }
             });
		}
        }
	
	
	else{
		alert("please fill the fields")
		return false;
	}


    });
$(document).ready(function() {
    $(".upload-file-input").on("change", uploadFile);
   
});
function uploadFile() {

    $.ajax({
        url: "/pathTDS/uploadFiles",
        type: "POST",
        data: new FormData($("#uploadQuestionsForm")[0]),
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        success: function(data) {
            // Handle upload success
            //          $("#upload-file-message").text("File successfully uploaded");
            //alert("File succesfully uploaded - " + data);
            $("#questionImg").val("");
            $("#option1Img").val("");
            $("#option2Img").val("");
            $("#option3Img").val("");
            $("#option4Img").val("");
            $("#upload-file-message-" + data).text("Success");
        },
        error: function(data) {
            // Handle upload error
            console.log("error : " + JSON.stringify(data));
            $("#upload-file-message").text(
                "File not uploaded (perhaps it's too much big)");
        }
       
        
    });
  
} // function uploadFile





//excel upload

$(document).ready(function() {
    $("#uploadButton").on("change", uploadQuestions);
});

function uploadQuestions() {

    alert("uploading");
    
    var formData = $("#uploadExcel").serializeArray();
   // alert(formData);

     $.ajax({
        type: "POST",
        url: "/pathTDS/uploadQuestionExcelUpload",
        data: formData, // serializes the form's elements.
        success: function(data) {
            if (data === "success") {
                uploadExcelFile();
            	//alert("sdf");
            }

        },
        error: function(data) {
            console.log("error");
        }
    });


}
//function uploadFile
function uploadExcelFile() {

    $.ajax({
        url: "/pathTDS/uploadqustnExcel",
        type: "POST",
        data: new FormData($("#uploadExcel")[0]),
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        cache: false,
        success: function(data) {
            // Handle upload success
            //          $("#upload-file-message").text("File successfully uploaded");
        	
            alert("File succesfully uploaded - " + data);
            window.location.href = "/pathTDS/QuestionBankExcel";
           
     		
        },
        error: function(data) {
            // Handle upload error
            console.log("error : " + JSON.stringify(data));
            $("#upload-file-message").text(
                "File not uploaded (perhaps it's too much big)");
        }
    });

}
