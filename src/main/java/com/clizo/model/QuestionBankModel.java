package com.clizo.model;
import com.poiji.annotation.ExcelCell;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.beans.factory.annotation.Value;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.persistence.*;

import org.hibernate.annotations.DynamicUpdate;
@Entity
@Table(name = "questionsbank")
@DynamicUpdate
public class QuestionBankModel {
	@Id
	@Column(name = "Qn_id")
	
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long questionId;
	@ExcelCell(0)
	private String Qn_type;
	@ExcelCell(1)
	private String Section;
	@ExcelCell(2)
	private String class_name;
	@ExcelCell(3)
	private String Time_per_question;
	
	@ExcelCell(4)
	private String Question;
	@ExcelCell(5)
	private String Answer_multiple;
	@ExcelCell(6)
	private String Answer_Descriptive;
	
	
	private String Status;
	@ExcelCell(7)
	private String op1;
	
	 @Column(name = "op1_img")
	
   private String optionImg1;
	 @ExcelCell(8)
	private String op2;
	@Column(name = "op2_img")
	
    private String optionImg2;
	@ExcelCell(9)
	private String op3;
	 @Column(name = "op3_img")
	 
	 private String optionImg3;
	 @ExcelCell(10)
	private String op4;
	 @Column(name = "op4_img")
	 
	 private String optionImg4;
	 @ExcelCell(11)
	private String op5;
	 @ExcelCell(12)
	private String difficultylevel;
	
	@Column(name = "question_img")
    private String questionImg;
	@ExcelCell(13)
	private String area;
	@ExcelCell(14)
	private String createddate;
	
	@Column(name = "des_answer_img")
    private String AnswerImg;
	
	
	
	
	
	
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public String getQn_type() {
		return Qn_type;
	}
	public void setQn_type(String qn_type) {
		Qn_type = qn_type;
	}
	public String getSection() {
		return Section;
	}
	public void setSection(String section) {
		Section = section;
	}
	
	
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getTime_per_question() {
		return Time_per_question;
	}
	public void setTime_per_question(String time_per_question) {
		Time_per_question = time_per_question;
	}
	
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getAnswer_multiple() {
		return Answer_multiple;
	}
	public void setAnswer_multiple(String answer_multiple) {
		Answer_multiple = answer_multiple;
	}
	public String getAnswer_Descriptive() {
		return Answer_Descriptive;
	}
	public void setAnswer_Descriptive(String answer_Descriptive) {
		Answer_Descriptive = answer_Descriptive;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getOp1() {
		return op1;
	}
	public void setOp1(String op1) {
		this.op1 = op1;
	}
	
	public String getOptionImg1() {
		return optionImg1;
	}
	public void setOptionImg1(String optionImg1) {
		this.optionImg1 = optionImg1;
	}
	public String getOp2() {
		return op2;
	}
	public void setOp2(String op2) {
		this.op2 = op2;
	}
	
	public String getOp3() {
		return op3;
	}
	public void setOp3(String op3) {
		this.op3 = op3;
	}
	
	public String getOptionImg2() {
		return optionImg2;
	}
	public void setOptionImg2(String optionImg2) {
		this.optionImg2 = optionImg2;
	}
	public String getOptionImg3() {
		return optionImg3;
	}
	public void setOptionImg3(String optionImg3) {
		this.optionImg3 = optionImg3;
	}
	public String getOp4() {
		return op4;
	}
	public void setOp4(String op4) {
		this.op4 = op4;
	}
	
	public String getOptionImg4() {
		return optionImg4;
	}
	public void setOptionImg4(String optionImg4) {
		this.optionImg4 = optionImg4;
	}
	public String getQuestionImg() {
		return questionImg;
	}
	public void setQuestionImg(String questionImg) {
		this.questionImg = questionImg;
	}
	public String getAnswerImg() {
		return AnswerImg;
	}
	public void setAnswerImg(String answerImg) {
		AnswerImg = answerImg;
	}
	public String getOp5() {
		return op5;
	}
	public void setOp5(String op5) {
		this.op5 = op5;
	}
	
	public String getDifficultylevel() {
		return difficultylevel;
	}
	public void setDifficultylevel(String difficultylevel) {
		this.difficultylevel = difficultylevel;
	}
	
	public String getCreateddate() {
		return createddate;
	}
	public void setCreateddate(String createddate) {
		this.createddate = createddate;
	}
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	
}
