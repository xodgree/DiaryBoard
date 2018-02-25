package board;

import java.util.Date;

public class DiaryDataBean {
	private int num;
	private String title;
	private String content;
	
	private Date regdate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "DiaryDataBean [num=" + num + ", title=" + title + ", content=" + content + ", regdate=" + regdate + "]";
	}
	
}


