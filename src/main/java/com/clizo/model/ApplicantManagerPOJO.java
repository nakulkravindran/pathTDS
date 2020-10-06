package com.clizo.model;

import java.io.Serializable;
import java.util.ArrayList;

public class ApplicantManagerPOJO implements Serializable{

    private Long applicantId;
    private String status;
    private Long trainingid;

    public Long getTrainingid() {
		return trainingid;
	}

	public void setTrainingid(Long trainingid) {
		this.trainingid = trainingid;
	}

	public Long getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(Long applicantId) {
        this.applicantId = applicantId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
