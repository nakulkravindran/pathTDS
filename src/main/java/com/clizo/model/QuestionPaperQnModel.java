

package com.clizo.model;


import javax.persistence.*;

@Entity
@Table(name = "questionpaper_qn")
public class QuestionPaperQnModel{
	
	@Id
	@Column(name = "questionpaper_qn_id")
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long questionpaperqnid;
	
	@Column(name = "questionpaper_id")
	private int questionpaperid;
	
	@Column(name = "Questionbank_id")
	private int Questionbankid;
	
	@Column(name="Score_per_question")
	private int Scoreperquestion;
	
	public Long getquestionpaperqnid() {
        return questionpaperqnid;
    }
    public void setquestionpaperqnid(Long questionpaperqnid) {
        this.questionpaperqnid = questionpaperqnid;
    }   
    
    public int getquestionpaperid() {
        return questionpaperid;
    }
    public void setquestionpaperid(int questionpaperid) {
        this.questionpaperid = questionpaperid;
    }  
    
        
    public int getQuestionbankid() {
        return Questionbankid;
    }
    public void setQuestionbankid(int Questionbankid) {
        this.Questionbankid = Questionbankid;
    }  
    
    public int getScoreperquestion() {
        return Scoreperquestion;
    }
    public void setScoreperquestion(int Scoreperquestion) {
        this.Scoreperquestion = Scoreperquestion;
    }
}