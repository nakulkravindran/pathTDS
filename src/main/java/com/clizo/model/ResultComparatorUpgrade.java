package com.clizo.model;

import java.util.Comparator;

public class ResultComparatorUpgrade implements Comparator<ResultModel>{
	
	 @Override
	    public int compare(ResultModel o1, ResultModel o2) {
	        return o2.getTotalScore() - o1.getTotalScore();
	    }
}
