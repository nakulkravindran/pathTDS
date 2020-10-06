
package com.clizo.model;


import javax.persistence.*;

@Entity
@Table(name = "questionpaper")
public class QuestionPaperModel{
	
	@Id
	@Column(name = "questionpaper_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long questionpaperid;
	private String classname;
	private int Maximum_score;
	private double Pass_percentage;
	private int No_of_question_for_evaluation;
	private String Total_time_allowed;
	private String Total_score;	
	private String date_created;
	private String section1;
	private String section2;
	private String section3;
	private String section4;	
	
	
	public Long getQuestionpaperid() {
        return questionpaperid;
    }

    public void setQuestionpaperid(Long questionpaperid) {
        this.questionpaperid = questionpaperid;
    }    
    
    public String getclassname() {
        return classname;
    }
    public void setclassname(String classname) {
        this.classname = classname;
    }
	    
    public int getMaximum_score() {
        return Maximum_score;
    }
    public void setMaximum_score(int Maximum_score) {
        this.Maximum_score = Maximum_score;
    }
    
    public double getPass_percentage() {
        return Pass_percentage;
    }
    public void setPass_percentage(double Pass_percentage) {
        this.Pass_percentage = Pass_percentage;
    }
    
    public int getNo_of_question_for_evaluation() {
        return No_of_question_for_evaluation;
    }
    public void setNo_of_question_for_evaluation(int No_of_question_for_evaluation) {
        this.No_of_question_for_evaluation = No_of_question_for_evaluation;
    }
    
    public String getTotal_time_allowed() {
        return Total_time_allowed;
    }
    public void setTotal_time_allowed(String Total_time_allowed) {
        this.Total_time_allowed = Total_time_allowed;
    }
    
    public String getTotal_score() {
        return Total_score;
    }
    public void setTotal_score(String Total_score) {
        this.Total_score = Total_score;
    }
    
    public String getdate_created() {
        return date_created;
    }
    public void setdate_created(String date_created) {
        this.date_created = date_created;
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
        this.section3 = section2;
    }
    public String getSection3() {
        return section3;
    }
    public void setSection3(String section3) {
        this.section3 = section3;
    }
    public String getSection4() {
        return section4;
    }
    public void setSection4(String section4) {
        this.section4 = section4;
    }
}