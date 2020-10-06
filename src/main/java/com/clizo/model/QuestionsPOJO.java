package com.clizo.model;

import com.poiji.annotation.ExcelCell;

public class QuestionsPOJO {

    @ExcelCell(0)
    private String question;
    @ExcelCell(1)
    private String option1;
    @ExcelCell(2)
    private String option2;
    @ExcelCell(3)
    private String option3;
    @ExcelCell(4)
    private String option4;
    @ExcelCell(5)
    private String option5;
    @ExcelCell(6)
    private String answer;

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
}
