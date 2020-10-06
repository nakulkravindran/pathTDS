$("#questionPaperNumberview").change(function(){

	 var questionPaperNumber = $("#questionPaperNumberview").val();

      //  alert(questionPaperNumber);

        window.location.href = "/pathTDS/Questionsview?questionPaperNumber=" + questionPaperNumber;

});