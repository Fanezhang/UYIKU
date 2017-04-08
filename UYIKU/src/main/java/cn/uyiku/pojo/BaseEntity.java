package cn.uyiku.pojo;

import java.util.Date;

public class BaseEntity {
	public Date createTime;
	public  Date lastUpdateTime;
	public String url;
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	@Override
	public String toString() {
		return "BaseEntity [createTime=" + createTime + ", lastUpdateTime=" + lastUpdateTime + ", url=" + url + "]";
	}
}
