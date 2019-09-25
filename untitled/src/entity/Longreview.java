package entity;

public class Longreview {
    private int lrvid;
    private String userid;
    private String icon;
    private String time;
    private String title;
    private String content;
    private String content1;
    private String picture;

    public Longreview(){

    }

    public Longreview(int lrvid,String userid,String icon,String title,String content,String content1,String time,String picture){
        this.lrvid=lrvid;
        this.userid=userid;
        this.icon=icon;
        this.time=time;
        this.title=title;
        this.content=content;
        this.content1=content1;
        this.picture=picture;
    }

    public int getLrvid() {
        return lrvid;
    }

    public void setLrvid(int lrvid) {
        this.lrvid = lrvid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}
