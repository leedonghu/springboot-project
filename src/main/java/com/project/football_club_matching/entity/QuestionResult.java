package com.project.football_club_matching.entity;

import java.util.ArrayList;
import java.util.List;

public class QuestionResult {
    private String result1;
    private String result2;
    private String result3;
    private String result4;
    private String result5;
    private String result6;
    private String result7;
    private String result8;
    private String result9;
    private String result10;

    private List<String> resultList = new ArrayList<>();

    public List<String> getResultList() {
        return resultList;
    }

    public String getResult1() {
        return result1;
    }

    public String getResult2() {
        return result2;
    }
    public String getResult3() {
        return result3;
    }
    public String getResult4() {
        return result4;
    }
    public String getResult5() {
        return result5;
    }
    public String getResult6() {
        return result6;
    }
    public String getResult7() {
        return result7;
    }
    public String getResult8() {
        return result8;
    }
    public String getResult9() {
        return result9;
    }
    public String getResult10() {
        return result10;
    }

    public void setResult1(String result1) {
        this.result1 = result1;
        resultList.add(result1);
    }
    public void setResult2(String result2) {
        this.result2 = result2;
        resultList.add(result2);
    }
    public void setResult3(String result3) {
        this.result3 = result3;
        resultList.add(result3);
    }
    public void setResult4(String result4) {
        this.result4 = result4;
        resultList.add(result4);
    }
    public void setResult5(String result5) {
        this.result5 = result5;
        resultList.add(result5);
    }
    public void setResult6(String result6) {
        this.result6 = result6;
        resultList.add(result6);
    }
    public void setResult7(String result7) {
        this.result7 = result7;
        resultList.add(result7);
    }
    public void setResult8(String result8) {
        this.result8 = result8;
        resultList.add(result8);
    }
    public void setResult9(String result9) {
        this.result9 = result9;
        resultList.add(result9);
    }
    public void setResult10(String result10) {
        this.result10 = result10;
        resultList.add(result10);
    }
}