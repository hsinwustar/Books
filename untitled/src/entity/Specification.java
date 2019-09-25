package entity;

public class Specification {
    private int ctid;
    //第一部分
    private String name; // 商品名称
    private String title;
    private String author;
    private String author2;
    private String writer;
    private String press;
    private String presstime;
    private String price;
    private String hardcover;
    private String ISBN;

    public Specification()
    {

    }

    public int getCtid() {
        return ctid;
    }

    public void setCtid(int ctid) {
        this.ctid = ctid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuthor2() {
        return author2;
    }

    public void setAuthor2(String author2) {
        this.author2 = author2;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getPresstime() {
        return presstime;
    }

    public void setPresstime(String presstime) {
        this.presstime = presstime;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getHardcover() {
        return hardcover;
    }

    public void setHardcover(String hardcover) {
        this.hardcover = hardcover;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
}
