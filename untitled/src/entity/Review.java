package entity;

public class Review {
//    private int reid;
    private String userid;
    private String icon;
    private String views;
    private int ctid;
    private int id;

    public Review()
    {

    }

//    public int getReid() {
//        return reid;
//    }
//
//    public void setReid(int reid) {
//        this.reid = reid;
//    }

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

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public int getCtid() {
        return ctid;
    }

    public void setCtid(int ctid) {
        this.ctid = ctid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
