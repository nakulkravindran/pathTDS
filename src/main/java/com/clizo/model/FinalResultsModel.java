package com.clizo.model;

import javax.persistence.*;

@Entity
@Table (name = "finalResuts")
public class FinalResultsModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private Long applicantId;
    private String applicantName;
    private int totalScore;
    private int correctAnswers;
    private String examId;
    private String questionPaperNumber;
    private int questionsAttempted;
    private long timeTaken;
    private String status;
    private Integer section1 = 0;
    private Integer section2 = 0;
    private Integer section3 = 0;

    @Transient
    private int rank;

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public Integer getSection1() {
        return section1;
    }

    public void setSection1(Integer section1) {
        this.section1 = section1;
    }

    public Integer getSection2() {
        return section2;
    }

    public void setSection2(Integer section2) {
        this.section2 = section2;
    }

    public Integer getSection3() {
        return section3;
    }

    public void setSection3(Integer section3) {
        this.section3 = section3;
    }

    public long getTimeTaken() {
        return timeTaken;
    }

    public void setTimeTaken(long timeTaken) {
        this.timeTaken = timeTaken;
    }

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Long getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(Long applicantId) {
        this.applicantId = applicantId;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public int getCorrectAnswers() {
        return correctAnswers;
    }

    public void setCorrectAnswers(int correctAnswers) {
        this.correctAnswers = correctAnswers;
    }

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public String getQuestionPaperNumber() {
        return questionPaperNumber;
    }

    public void setQuestionPaperNumber(String questionPaperNumber) {
        this.questionPaperNumber = questionPaperNumber;
    }

    public int getQuestionsAttempted() {
        return questionsAttempted;
    }

    public void setQuestionsAttempted(int questionsAttempted) {
        this.questionsAttempted = questionsAttempted;
    }
}
