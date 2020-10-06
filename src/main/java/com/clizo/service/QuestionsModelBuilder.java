package com.clizo.service;

import com.clizo.model.QuestionHeaderModel;
import com.clizo.model.QuestionsModel;
import com.clizo.model.UploadQuestionsModel;

public class QuestionsModelBuilder {

    public QuestionsModel buildQuestionsDao(UploadQuestionsModel uploadQuestionsModel) {

        QuestionsModel questionsModel = new QuestionsModel();

        questionsModel.setQuestion(uploadQuestionsModel.getQuestion());
        questionsModel.setAllottedTime(uploadQuestionsModel.getTimeAlowed());
        questionsModel.setDifficultyLevel(uploadQuestionsModel.getDifficultyLevel());
        questionsModel.setOption1(uploadQuestionsModel.getOption1());
        questionsModel.setOption2(uploadQuestionsModel.getOption2());
        questionsModel.setOption3(uploadQuestionsModel.getOption3());
        questionsModel.setOption4(uploadQuestionsModel.getOption4());
        questionsModel.setOption5(uploadQuestionsModel.getOption5());
        questionsModel.setCorrectAnswer(uploadQuestionsModel.getAnswer());
        questionsModel.setOptionImg1(uploadQuestionsModel.getOption1Img());
        questionsModel.setOptionImg2(uploadQuestionsModel.getOption2Img());
        questionsModel.setOptionImg3(uploadQuestionsModel.getOption3Img());
        questionsModel.setOptionImg4(uploadQuestionsModel.getOption4Img());
        questionsModel.setQuestionImg(uploadQuestionsModel.getQuestionImg());
        questionsModel.setScore(Integer.parseInt(uploadQuestionsModel.getQuestionScore()));
        questionsModel.setSection(uploadQuestionsModel.getSection());
        questionsModel.setQuestionPaperNumber(uploadQuestionsModel.getQuestionPaperNumber());



        return questionsModel;
    }

    public QuestionHeaderModel buildQuestionHeaderDao(UploadQuestionsModel uploadQuestionsModel) {
        QuestionHeaderModel questionHeaderModel = new QuestionHeaderModel();

        questionHeaderModel.setQuestionPaperNumber(uploadQuestionsModel.getQuestionPaperNumber());
        questionHeaderModel.setSection1(uploadQuestionsModel.getSection1());
        questionHeaderModel.setSection2(uploadQuestionsModel.getSection2());
        questionHeaderModel.setSection3(uploadQuestionsModel.getSection3());
        questionHeaderModel.setExamCategory(uploadQuestionsModel.getExamCategory());
        questionHeaderModel.setPassPercentage(uploadQuestionsModel.getPassPercentage());
        questionHeaderModel.setTotalTimeAllowedForExam(uploadQuestionsModel.getTotalTimeAllowedForExam());
        questionHeaderModel.setNoOfQuestionsForEvaluation(uploadQuestionsModel.getNoOfQuestionsForEvaluation());
        questionHeaderModel.setMaximumScore(uploadQuestionsModel.getMaximumScore());
        questionHeaderModel.setClassName(uploadQuestionsModel.getClassName());

        return questionHeaderModel;
    }
}
