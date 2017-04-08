package cn.uyiku.pojo;

public class Cloth extends BaseCloth {
	private String id;
	private String color;
	private String category;
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Cloth [id=" + id + ", color=" + color + ", category=" + category + ", name=" + name + ", style=" + style
				+ ", season=" + season + ", userId=" + userId + ", remark=" + remark + ", createTime=" + createTime
				+ ", lastUpdateTime=" + lastUpdateTime + ", url=" + url + "]";
	}
	
}
