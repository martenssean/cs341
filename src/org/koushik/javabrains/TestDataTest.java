package org.koushik.javabrains;

public class TestDataTest {

	public static void main(String[] args){
		TestData td = new TestData();
		System.out.print(td.getUserEvents(0));
	}
	
	public static void printData(){
		TestData td = new TestData();
		System.out.println("uid|username|password|userType|fName|lname|email");
		System.out.print(td.getUsers());
		System.out.println("");
		System.out.println("eid|year|month|day|name|startTime|endTime|text");
		System.out.print(td.getCalendar());
		System.out.println("");
		System.out.println("uid|eid");
		System.out.print(td.getSignUp());
	}
	
	public static String jspOutData(){
		TestData td = new TestData();
		String data = "";
		data+="uid|username|password|userType|fName|lname|email<br>";
		data+=td.getUsers();
		data+="<br><br>eid|year|month|day|name|startTime|endTime|text<br>";
		data+=td.getCalendar();
		data+="<br><br>uid|eid<br>";
		data+=td.getSignUp();
		while(-1<data.indexOf("\n")){
			//System.out.println(data.indexOf("\n"));
			data= data.substring(0, data.indexOf("\n"))+"<br>"+data.substring(data.indexOf("\n")+1);
		}
		return data;
	}
}