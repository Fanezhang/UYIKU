package cn.uyiku.pojo;

public class Plan extends BaseCloth {
	private String id;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Plan [id=" + id + "]"+"BaseCloth [name=" + name + ", style=" + style + ", season=" + season + ", userId=" + userId + "]";
	}
	
}
