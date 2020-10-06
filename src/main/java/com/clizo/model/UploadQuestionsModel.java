package com.clizo.model;

import java.util.ArrayList;

public class UploadQuestionsModel {

    private String examCategory;
    private String section = "Default";
    private String className;
    private String question;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String option5;
    private String answer;
    private String questionScore;
    private String timeAlowed;
    private String difficultyLevel;
    private String questionPaperNumber;
    private String questionImg;
    private String option1Img;
    private String option2Img;
    private String option3Img;
    private String option4Img;
    private double passPercentage;
    private String totalTimeAllowedForExam;
    private int noOfQuestionsForEvaluation;
    private int maximumScore;
    private String section1;
    private String section2;
    private String section3;
    private boolean editQuestion = false;

    public String getSection1() {
        return section1;
    }

    public void setSection1(String section1) {
        this.section1 = section1;
    }

    public String getSection2() {
        return section2;
    }

    public void setSection2(String section2) {
        this.section2 = section2;
    }

    public String getSection3() {
        return section3;
    }

    public void setSection3(String section3) {
        this.section3 = section3;
    }

    public int getMaximumScore() {
        return maximumScore;
    }

    public void setMaximumScore(int maximumScore) {
        this.maximumScore = maximumScore;
    }

    public int getNoOfQuestionsForEvaluation() {
        return noOfQuestionsForEvaluation;
    }

    public void setNoOfQuestionsForEvaluation(int noOfQuestionsForEvaluation) {
        this.noOfQuestionsForEvaluation = noOfQuestionsForEvaluation;
    }

    public String getTotalTimeAllowedForExam() {
        return totalTimeAllowedForExam;
    }

    public void setTotalTimeAllowedForExam(String totalTimeAllowedForExam) {
        this.totalTimeAllowedForExam = totalTimeAllowedForExam;
    }

    public double getPassPercentage() {
        return passPercentage;
    }

    public void setPassPercentage(double passPercentage) {
        this.passPercentage = passPercentage;
    }

    public String getQuestionImg() {
        return questionImg;
    }

    public void setQuestionImg(String questionImg) {
        this.questionImg = questionImg;
    }

    public String getOption1Img() {
        return option1Img;
    }

    public void setOption1Img(String option1Img) {
        this.option1Img = option1Img;
    }

    public String getOption2Img() {
        return option2Img;
    }

    public void setOption2Img(String option2Img) {
        this.option2Img = option2Img;
    }

    public String getOption3Img() {
        return option3Img;
    }

    public void setOption3Img(String option3Img) {
        this.option3Img = option3Img;
    }

    public String getOption4Img() {
        return option4Img;
    }

    public void setOption4Img(String option4Img) {
        this.option4Img = option4Img;
    }

    public String getQuestionPaperNumber() {
        return questionPaperNumber;
    }

    public void setQuestionPaperNumber(String questionPaperNumber) {
        this.questionPaperNumber = questionPaperNumber;
    }

    public String getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(String difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }

    public String getQuestionScore() {
        return questionScore;
    }

    public void setQuestionScore(String questionScore) {
        this.questionScore = questionScore;
    }

    public String getTimeAlowed() {
        return timeAlowed;
    }

    public void setTimeAlowed(String timeAlowed) {
        this.timeAlowed = timeAlowed;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getOption5() {
        return option5;
    }

    public void setOption5(String option5) {
        this.option5 = option5;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getExamCategory() {
        return examCategory;
    }

    public void setExamCategory(String examCategory) {
        this.examCategory = examCategory;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public boolean isEditQuestion() {
        return editQuestion;
    }

    public void setEditQuestion(boolean editQuestion) {
        this.editQuestion = editQuestion;
    }
}
