package cn.uyiku.pojo;

public class BaseCloth extends BaseEntity {
	public String name;
	public String style;
	public String season;
	public String userId;
	public String remark;
	
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}

	@Override
	public String toString() {
		return "BaseCloth [name=" + name + ", style=" + style + ", season=" + season + ", userId=" + userId + "]";
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
