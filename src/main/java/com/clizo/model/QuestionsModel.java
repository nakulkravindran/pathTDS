package com.clizo.model;

import com.poiji.annotation.ExcelCell;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.ArrayList;
import javax.persistence.*;
import java.util.ArrayList;

@Entity
@Table(name = "questions")
@DynamicUpdate
public class QuestionsModel {

    @Id
    @Column(name = "qn_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long questionId;
    @Column(name = "df_level")
    @ExcelCell(1)
    private String difficultyLevel;
    @Column(name = "question")
    @ExcelCell(0)
    private String question;
    @Column(name = "qn_img")
    private String questionImg;

    @Column(name = "op1")
    @ExcelCell(2)
    private String option1;
    @Column(name = "op1_img")
    private String optionImg1;

    @Column(name = "op2")
    @ExcelCell(3)
    private String option2;
    @Column(name = "op2_img")
    private String optionImg2;

    @Column(name = "op3")
    @ExcelCell(4)
    private String option3;
    @Column(name = "op3_img")
    private String optionImg3;

    @Column(name = "op4")
    @ExcelCell(5)
    private String option4;
    @Column(name = "op4_img")
    private String optionImg4;

    @Column(name = "op5")
    @ExcelCell(6)
    private String option5;
    @Column(name = "op5_img")
    private String optionImg5;


    @Column(name = "correct_answer")
    @ExcelCell(7)
    private String correctAnswer;
    @Column(name = "alloted_time")
    @ExcelCell(8)
    private String allottedTime;
    @Column(name = "score")
    @ExcelCell(9)
    private int score;

    @Column(name = "section")
    @ExcelCell(10)
    private String section = "Default";
    @ExcelCell(11)
    private String questionPaperNumber;


    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOptionImg1() {
        return optionImg1;
    }

    public void setOptionImg1(String optionImg1) {
        this.optionImg1 = optionImg1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOptionImg2() {
        return optionImg2;
    }

    public void setOptionImg2(String optionImg2) {
        this.optionImg2 = optionImg2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOptionImg3() {
        return optionImg3;
    }

    public void setOptionImg3(String optionImg3) {
        this.optionImg3 = optionImg3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getOptionImg4() {
        return optionImg4;
    }

    public void setOptionImg4(String optionImg4) {
        this.optionImg4 = optionImg4;
    }

    public String getOption5() {
        return option5;
    }

    public void setOption5(String option5) {
        this.option5 = option5;
    }

    public String getOptionImg5() {
        return optionImg5;
    }

    public void setOptionImg5(String optionImg5) {
        this.optionImg5 = optionImg5;
    }

    public Long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }

    public String getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(String difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getQuestionImg() {
        return questionImg;
    }

    public void setQuestionImg(String questionImg) {
        this.questionImg = questionImg;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getAllottedTime() {
        return allottedTime;
    }

    public void setAllottedTime(String allottedTime) {
        this.allottedTime = allottedTime;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public String getSection() {
        return section;
    }

    public void setSection(String section) {
        this.section = section;
    }

    public String getQuestionPaperNumber() {
        return questionPaperNumber;
    }

    public void setQuestionPaperNumber(String questionPaperNumber) {
        this.questionPaperNumber = questionPaperNumber;
    }
}
