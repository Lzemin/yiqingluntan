package com.ruixin.bean;

public class Yiqing {
    private String id;
    private String provinceName;
    private int confirmedNum;
    private int curesNum;
    private int deathsNum;
    private int nowNum;

    public int getNowNum() {
        return nowNum;
    }

    public void setNowNum(int nowNum) {
        this.nowNum = nowNum;
    }

    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public int getConfirmedNum() {
        return confirmedNum;
    }

    public void setConfirmedNum(int confirmedNum) {
        this.confirmedNum = confirmedNum;
    }

    public int getCuresNum() {
        return curesNum;
    }

    public void setCuresNum(int curesNum) {
        this.curesNum = curesNum;
    }

    public int getDeathsNum() {
        return deathsNum;
    }

    public void setDeathsNum(int deathsNum) {
        this.deathsNum = deathsNum;
    }
}
