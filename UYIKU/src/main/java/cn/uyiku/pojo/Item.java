package cn.uyiku.pojo;

import java.util.Date;

public class Item {
	private int id;
	private String category;//分类
	private String title;//标题
	private String season;//季节
	private String brand;//品牌
	private String url;//详情页链接
	private String imgUrl;//图片url
	private Date ctime;//创建时间
	private int dnum;//销量
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	public int getDnum() {
		return dnum;
	}
	public void setDnum(int dnum) {
		this.dnum = dnum;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", category=" + category + ", title=" + title + ", season=" + season + ", brand="
				+ brand + ", url=" + url + ", imgUrl=" + imgUrl + ", ctime=" + ctime + ", dnum=" + dnum + "]";
	}
	
}
