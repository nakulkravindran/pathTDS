package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "question_header")
public class QuestionHeaderModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String questionPaperNumber;
    private String section1 = "Default";
    private String section2 = "Default";
    private String section3 = "Default";
    private String examCategory;
    private double passPercentage = 0;
    private String totalTimeAllowedForExam;
    private int noOfQuestionsForEvaluation = 0;
    private int maximumScore = 0;
    private String className;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getQuestionPaperNumber() {
        return questionPaperNumber;
    }

    public void setQuestionPaperNumber(String questionPaperNumber) {
        this.questionPaperNumber = questionPaperNumber;
    }

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

    public String getExamCategory() {
        return examCategory;
    }

    public void setExamCategory(String examCategory) {
        this.examCategory = examCategory;
    }

    public double getPassPercentage() {
        return passPercentage;
    }

    public void setPassPercentage(double passPercentage) {
        this.passPercentage = passPercentage;
    }

    public String getTotalTimeAllowedForExam() {
        return totalTimeAllowedForExam;
    }

    public void setTotalTimeAllowedForExam(String totalTimeAllowedForExam) {
        this.totalTimeAllowedForExam = totalTimeAllowedForExam;
    }

    public int getNoOfQuestionsForEvaluation() {
        return noOfQuestionsForEvaluation;
    }

    public void setNoOfQuestionsForEvaluation(int noOfQuestionsForEvaluation) {
        this.noOfQuestionsForEvaluation = noOfQuestionsForEvaluation;
    }

    public int getMaximumScore() {
        return maximumScore;
    }

    public void setMaximumScore(int maximumScore) {
        this.maximumScore = maximumScore;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
