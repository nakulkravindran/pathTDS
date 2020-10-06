package com.clizo.service;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.clizo.model.QuestionBankModel;
import com.clizo.model.QuestionsModel;
import com.clizo.model.UploadQuestionsModel;
import com.clizo.model.UploadQustnBankModel;
public class QuestionBankBuilder {
	public QuestionBankModel buildQuestionsbankDao(UploadQustnBankModel uploadQuestionsModel) {
		Date currentDate = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		QuestionBankModel questionsModel = new QuestionBankModel();

        questionsModel.setQuestion(uploadQuestionsModel.getQuestion());
       
       
        questionsModel.setDifficultylevel(uploadQuestionsModel.getDifficultylevel());
        questionsModel.setQn_type(uploadQuestionsModel.getQn_type());
        questionsModel.setOp1(uploadQuestionsModel.getOption1());
       
        questionsModel.setOp2(uploadQuestionsModel.getOption2());
        questionsModel.setOp3(uploadQuestionsModel.getOption3());
        questionsModel.setOp4(uploadQuestionsModel.getOption4());
        questionsModel.setOp5(uploadQuestionsModel.getOption5());
        questionsModel.setAnswer_multiple(uploadQuestionsModel.getAnswerMultiple());
        questionsModel.setAnswerImg(uploadQuestionsModel.getAnswerImg());
        questionsModel.setOptionImg1(uploadQuestionsModel.getOption1Img());
        questionsModel.setOptionImg2(uploadQuestionsModel.getOption2Img());
        questionsModel.setOptionImg3(uploadQuestionsModel.getOption3Img());
        questionsModel.setOptionImg4(uploadQuestionsModel.getOption4Img());
        questionsModel.setQuestionImg(uploadQuestionsModel.getQuestionImg());
       
        questionsModel.setSection(uploadQuestionsModel.getSection());
        questionsModel.setStatus(uploadQuestionsModel.getStatus());
        questionsModel.setClass_name(uploadQuestionsModel.getClassName());
        questionsModel.setTime_per_question(uploadQuestionsModel.getTimeperQuestion());
        questionsModel.setAnswer_Descriptive(uploadQuestionsModel.getAnswerDescrptive());
        questionsModel.setCreateddate(dateFormat.format(currentDate));
        questionsModel.setArea(uploadQuestionsModel.getArea());

        return questionsModel;
    }

}
