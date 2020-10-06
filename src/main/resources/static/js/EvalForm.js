$("#trainingview").change(function(){

	 var traingid = $("#trainingview").val();

       // alert(traingid);

        window.location.href = "/pathTDS/ViewEvalform?traingid=" + traingid;

});