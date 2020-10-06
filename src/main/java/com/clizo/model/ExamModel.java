package com.clizo.model;

import javax.persistence.*;

@Entity
@Table(name = "exam")
public class ExamModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String examName;
    private String examId;
    private String examDate;
    private String finalExamDate;
    private String examTime;
   // private String category;
    private String whoCanRegister;
    private String otherDetails;
   // private String examSheduleDate;
    private String questionPaperNumber;
    private String accessibleTimeFrom;
    private String accessibletimeTo;
    private String additionalInstructions1;
    private String additionalInstructions2;
    private String additionalInstructions3;
    private String additionalInstructions4;
    private String additionalInstructions5;
    private String additionalInstructions6;
    private String additionalInstructions7;
    private String additionalInstructions8;
    private String additionalInstructions9;


    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public String getExamDate() {
        return examDate;
    }

    public void setExamDate(String examDate) {
        this.examDate = examDate;
    }

    public String getFinalExamDate() {
        return finalExamDate;
    }

    public void setFinalExamDate(String finalExamDate) {
        this.finalExamDate = finalExamDate;
    }

    public String getExamTime() {
        return examTime;
    }

    public void setExamTime(String examTime) {
        this.examTime = examTime;
    }

   /* public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }*/

    public String getWhoCanRegister() {
        return whoCanRegister;
    }

    public void setWhoCanRegister(String whoCanRegister) {
        this.whoCanRegister = whoCanRegister;
    }

    public String getOtherDetails() {
        return otherDetails;
    }

    public void setOtherDetails(String otherDetails) {
        this.otherDetails = otherDetails;
    }

   /* public String getExamSheduleDate() {
        return examSheduleDate;
    }

    public void setExamSheduleDate(String examSheduleDate) {
        this.examSheduleDate = examSheduleDate;
    }*/

    public String getQuestionPaperNumber() {
        return questionPaperNumber;
    }

    public void setQuestionPaperNumber(String questionPaperNumber) {
        this.questionPaperNumber = questionPaperNumber;
    }

    public String getAccessibleTimeFrom() {
        return accessibleTimeFrom;
    }

    public void setAccessibleTimeFrom(String accessibleTimeFrom) {
        this.accessibleTimeFrom = accessibleTimeFrom;
    }

    public String getAccessibletimeTo() {
        return accessibletimeTo;
    }

    public void setAccessibletimeTo(String accessibletimeTo) {
        this.accessibletimeTo = accessibletimeTo;
    }

    public String getAdditionalInstructions1() {
        return additionalInstructions1;
    }

    public void setAdditionalInstructions1(String additionalInstructions1) {
        this.additionalInstructions1 = additionalInstructions1;
    }

    public String getAdditionalInstructions2() {
        return additionalInstructions2;
    }

    public void setAdditionalInstructions2(String additionalInstructions2) {
        this.additionalInstructions2 = additionalInstructions2;
    }

    public String getAdditionalInstructions3() {
        return additionalInstructions3;
    }

    public void setAdditionalInstructions3(String additionalInstructions3) {
        this.additionalInstructions3 = additionalInstructions3;
    }

    public String getAdditionalInstructions4() {
        return additionalInstructions4;
    }

    public void setAdditionalInstructions4(String additionalInstructions4) {
        this.additionalInstructions4 = additionalInstructions4;
    }

    public String getAdditionalInstructions5() {
        return additionalInstructions5;
    }

    public void setAdditionalInstructions5(String additionalInstructions5) {
        this.additionalInstructions5 = additionalInstructions5;
    }

    public String getAdditionalInstructions6() {
        return additionalInstructions6;
    }

    public void setAdditionalInstructions6(String additionalInstructions6) {
        this.additionalInstructions6 = additionalInstructions6;
    }

    public String getAdditionalInstructions7() {
        return additionalInstructions7;
    }

    public void setAdditionalInstructions7(String additionalInstructions7) {
        this.additionalInstructions7 = additionalInstructions7;
    }

    public String getAdditionalInstructions8() {
        return additionalInstructions8;
    }

    public void setAdditionalInstructions8(String additionalInstructions8) {
        this.additionalInstructions8 = additionalInstructions8;
    }

    public String getAdditionalInstructions9() {
        return additionalInstructions9;
    }

    public void setAdditionalInstructions9(String additionalInstructions9) {
        this.additionalInstructions9 = additionalInstructions9;
    }

	

	
}
