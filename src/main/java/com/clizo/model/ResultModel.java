package com.clizo.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name = "result")
public class ResultModel {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private Long applicantId;
    private String applicantName;
    private int totalScore;
    private int correctAnswers;
    private String examId;
    private int questionPaperId;
    private int questionsAttempted;
    private long timeTaken;
    private String status;
    private Integer section1 = 0;
    private Integer section2 = 0;
    private Integer section3 = 0;
    private Integer section4 = 0;    
    private String attendedDate;
    private String attendedTime;
    private String scoreType;
    private String finalResult;
    
        
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
    public Integer getSection4() {
        return section4;
    }

    public void setSection4(Integer section4) {
        this.section4 = section4;
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

    public int getQuestionPaperId() {
        return questionPaperId;
    }

    public void setQuestionPaperId(int questionPaperId) {
        this.questionPaperId = questionPaperId;
    }

    public int getQuestionsAttempted() {
        return questionsAttempted;
    }

    public void setQuestionsAttempted(int questionsAttempted) {
        this.questionsAttempted = questionsAttempted;
    }
    
    public String getAttendedDate() {
        return attendedDate;    	        
    }
    public void setAttendedDate(String attendedDate) {
        this.attendedDate = attendedDate;
    }
    
    public String getAttendedTime() {
        return attendedTime;
    }
    public void setAttendedTime(String attendedTime) {
        this.attendedTime = attendedTime;
    }
    
    public String getScoreType() {
        return scoreType;
    }
    public void setScoreType(String scoreType) {
        this.scoreType = scoreType;
    }
	
    public String getFinalResult() {
        return finalResult;
    }

    public void setFinalResult(String finalResult) {
        this.finalResult = finalResult;
    }
}