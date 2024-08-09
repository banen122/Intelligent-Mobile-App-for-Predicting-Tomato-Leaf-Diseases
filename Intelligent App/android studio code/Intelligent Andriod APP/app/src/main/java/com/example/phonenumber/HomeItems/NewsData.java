package com.example.phonenumber.HomeItems;

public class NewsData {
    private String id,topic,info,datetime;

    public NewsData() {
    }

    public NewsData(String id, String topic, String info, String datetime) {
        this.id = id;
        this.topic = topic;
        this.info = info;
        this.datetime = datetime;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

}
