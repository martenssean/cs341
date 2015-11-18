package org.koushik.javabrains;

public class Event {
	
	private String title;
	private String startTime;
	private String endTime;
	private String date;
	private int month, day, year;
	private String about;
	private int ID;
	
	public Event(String title, int month, int day, int year, String startTime, String endTime, String about){
		this.title = title;
		this.month = month;
		this.day = day;
		this.year = year;
		this.startTime = startTime;
		this.endTime = endTime;
		this.about = about;
	}
	
	public Event(String title, int month, int day, int year, String startTime, String endTime, String about, int ID){
		this.title = title;
		this.month = month;
		this.day = day;
		this.year = year;
		this.startTime = startTime;
		this.endTime = endTime;
		this.about = about;
		this.ID = ID;
	}
	
	public Event(String info){
		ID = Integer.parseInt(info.substring(0, info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		year = Integer.parseInt(info.substring(0, info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		month = Integer.parseInt(info.substring(0, info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		day = Integer.parseInt(info.substring(0,info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		year = Integer.parseInt(info.substring(0,info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		title = info.substring(0,info.indexOf("|"));
		info = info.substring(info.indexOf("|")+1);
		startTime = info.substring(0, info.indexOf("|"));
		info = info.substring(info.indexOf("|")+1);
		endTime = info.substring(0, info.indexOf("|"));
		info = info.substring(info.indexOf("|")+1);
		about = info;
	}
	
	public String getString(){
		return(year + "|" + month + "|" + day + "|" + title + "|" + startTime + "|" + endTime + "|" + about);
	}

	public int getMonth() {
		return month;
	}
	
	public int getDay() {
		return day;
	}
	
	public int getYear() {
		return year;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

}
