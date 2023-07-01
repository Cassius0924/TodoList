package com.cassius0924.hellospringboot.model;

import java.sql.Timestamp;

/**
 * <b>Date 2023/7/1</b>
 *
 * @author HoChihchou
 */
public class Todo {
    private Integer id;
    private Integer userId;
    private String title;
    private String detail;
    private Timestamp time;
    private Timestamp createdTime;
    private boolean checked;
    private String url;

    public Todo() {
    }

    public Todo(Integer id, Integer userId, String title, String detail, Timestamp time, Timestamp createdTime, boolean checked, String url) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.detail = detail;
        this.time = time;
        this.createdTime = createdTime;
        this.checked = checked;
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", detail='" + detail + '\'' +
                ", time=" + time +
                ", createdTime=" + createdTime +
                ", checked=" + checked +
                ", url='" + url + '\'' +
                '}';
    }
}
