package entity;

//商品类
public class Items {

//    public static final int PAGE_SIZE=6;
	private int id; // 商品编号
	private String name; // 商品名称
	private String author; // 作者
    private String author2;//译者
	private String press;//出版社
    private String gongying;//供应
    private String zishu;//字数
    private String ISBN;//ISBN
    private String leibie;//类别
	private String synopsis;//简介
	private int price; // 价格
	private int number; // 库存
	private String picture; // 商品图片
	private String bacpicture;//底图
	private String introduction1;//简介
	private String introduction2; // 简介二
	private String introduction3;//简介三

	//保留不带参数的构造方法
    public Items()
    {

    }
	
	public Items(int id,String name,String author,String author2,String leibie,String zishu,String ISBN,String gongying,String press,String synopsis,int price,int number,String picture,String bacpicture,String introduction1,String introduction2,String introduction3)
	{
		this.id = id;
		this.name = name;
		this.author = author;
        this.author2 = author2;
        this.leibie = leibie;
        this.zishu = zishu;
        this.gongying = gongying;
		this.ISBN = ISBN;
		this.synopsis = synopsis;
		this.picture = picture;
		this.price = price;
		this.number = number;
		this.bacpicture = bacpicture;
		this.introduction1 = introduction1;
		this.introduction2 = introduction2;
		this.introduction3 = introduction3;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

    public String getGongying() {
        return gongying;
    }

    public void setGongying(String gongying) {
        this.gongying = gongying;
    }

    public String getZishu() {
        return zishu;
    }

    public void setZishu(String zishu) {
        this.zishu = zishu;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getLeibie() {
        return leibie;
    }

    public void setLeibie(String leibie) {
        this.leibie = leibie;
    }

    public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getSynopsis() {
		return synopsis;
	}

	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getBacpicture() {
		return bacpicture;
	}

	public void setBacpicture(String bacpicture) {
		this.bacpicture = bacpicture;
	}

	public String getIntroduction1() {
		return introduction1;
	}

	public void setIntroduction1(String introduction1) {
		this.introduction1 = introduction1;
	}

	public String getIntroduction2() {
		return introduction2;
	}

	public void setIntroduction2(String introduction2) {
		this.introduction2 = introduction2;
	}

	public String getIntroduction3() {
		return introduction3;
	}

	public void setIntroduction3(String introduction3) {
		this.introduction3 = introduction3;
	}

	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.getId()+this.getName().hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this==obj)
		{
			return true;
		}
		if(obj instanceof Items)
		{
			Items i = (Items)obj;
			if(this.getId()==i.getId()&&this.getName().equals(i.getName()))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	public String toString()
	{
		return "商品编号："+this.getId()+",商品名称："+this.getName();
	}

}

