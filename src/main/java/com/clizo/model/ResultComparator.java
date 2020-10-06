package com.clizo.model;

import java.util.Comparator;

public class ResultComparator implements Comparator<FinalResultsModel> {
    @Override
    public int compare(FinalResultsModel o1, FinalResultsModel o2) {
        return o2.getTotalScore() - o1.getTotalScore();
    }
}
