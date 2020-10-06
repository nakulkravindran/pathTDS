

$("#questionPaperNumber").change(function(){

        var questionPaperNumber = $("#questionPaperNumber").val();

      //  alert(questionPaperNumber);

        window.location.href = "/pathTDS/viewQuestions?questionPaperNumber=" + questionPaperNumber;

});

$("#questionPaperEditNumber").change(function(){

        var questionPaperNumber = $("#questionPaperEditNumber").val();

       // alert(questionPaperNumber);

        window.location.href = "/pathTDS" +
        		"/editQuestions?questionPaperNumber=" + questionPaperNumber;

});

/*
function deleteQuestion(questionId){
    alert("Deleting");
    $.ajax({
        type: "GET",
        url: "/editQuestions?questionId=" + questionId,
         // serializes the form's elements.
        success: function(data)
        {
           alert(data); // show response from the php script.
           if(data === "success"){
           //window.location.href = "/index";
            }
        },
        error: function(data){
           console.log("error");
        }
    });

}*/
