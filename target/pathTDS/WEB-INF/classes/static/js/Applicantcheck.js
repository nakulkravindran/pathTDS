
$("#examidview").change(function(){ // change examid

	 var examId = $("#examidview").val();

      //  alert(questionPaperNumber);

        window.location.href = "/pathTDS/viewApplicants?examId=" + examId;

});


$("#trainingid").change(function(){ // change trainingid

	 var traingid = $("#trainingid").val();

     //  alert(questionPaperNumber);

       window.location.href = "/pathTDS/ViewTrainingApplicant?traingid=" + traingid;

});