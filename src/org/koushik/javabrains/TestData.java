package org.koushik.javabrains;

import java.io.*;
import java.sql.*;

public class TestData {

	private Connection con;
	private ResultSet resultSet;
	private Statement statement;
	private String databaseConnection = "jdbc:sqlite:C:/Users/Zach/Desktop/Eclipse mars ee/Databases/test.db";
	private String bulletingConnection = "C:/Users/Zach/Desktop/Eclipse mars ee/Databases/bulletin.txt";
	
	public TestData(){
		con=null;
		statement=null;
		resultSet=null;
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection(databaseConnection);
			statement = con.createStatement();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public String getUsers(){
		String result = "";
		try{
			resultSet = statement.executeQuery("select uid, username, password, userType, fName, lName, email from User");
			result = "";
			while (resultSet.next()){
				result +=(""+ resultSet.getInt(1)+"|"+resultSet.getString(2)+"|"+resultSet.getString(3)+"|"+resultSet.getInt(4)+"|"+resultSet.getString(5)+"|"+resultSet.getString(6)+"|"+resultSet.getString(7)+"\n");
			}
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		return result;
	}
	
	public String getCalendar(){
		String result = "";
		try{
			resultSet = statement.executeQuery("select eid, uid, year, month, day, name, startTime, endTime, description from Calendar");
			result = "";
			while (resultSet.next()){
				result +=(""+ resultSet.getInt(1)+"|"+resultSet.getInt(2)+"|"+resultSet.getInt(3)+"|"+resultSet.getInt(4)+"|"+resultSet.getInt(5)+"|"+resultSet.getString(6)+"|"+resultSet.getString(7)+"|"+resultSet.getString(8)+"|"+resultSet.getString(9)+"\n");
			}
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		return result;
	}
	
	public String getSignUp(){
		String result = "";
		try{
			resultSet = statement.executeQuery("select uid, eid from SignUp");
			result = "";
			while (resultSet.next()){
				result +=(""+ resultSet.getInt(1)+"|"+resultSet.getInt(2)+"\n");
			}
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		return result;
	}
	
	// Creates a new account with the information provided if the username or email isn't already in the database.
	public boolean newUser(String username, String password, int uType, String fName, String lName, String email){
		try{
			resultSet = statement.executeQuery("select uid from User where username='"+username+"' or email='"+email+"'");
			if(resultSet.next()){
				System.out.println("already in");
				return false;
			}
			resultSet = statement.executeQuery("select max(Uid) from User");
			resultSet.next();
			int userNumber = resultSet.getInt(1)+1;
			System.out.println("insert into User values("+userNumber+",'"+username+"','"+password+"',"+uType+",'"+fName+"','"+lName+"','"+email+"',"+1+")");
			statement.executeUpdate("insert into User values("+userNumber+",'"+username+"','"+password+"',"+uType+",'"+fName+"','"+lName+"','"+email+"',"+1+")");
		} catch (Exception e){
			e.printStackTrace();
		}
		return true;
		
	}
	
	// Give the function the username and password and it returns the FirstName LastName if the login was successful
	public String login(String name, String password){
		String result = "";
		System.out.println(name);
		try{
			resultSet = statement.executeQuery("select uid from User where username='"+name+"' and password='"+password+"'");
			result = "";
			while (resultSet.next()){
				result +=(resultSet.getInt(1));
			}
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
	// Input username and password and returns the usertype of the user if there is one otherwise returns an empty string
	public String login2(String name,String password){
		String result = "";
		try{
			resultSet = statement.executeQuery("select userType from User where username='"+name+"' and password='"+password+"'");
			result = "";
			if(!resultSet.next()){
				return "null";
			}
			int tmp = resultSet.getInt(1);
			if(0==tmp){
				return "admin";
			} else if(1==tmp){
				return "volunteer";
			} else if(2==tmp){
				return "student";
			} else{
				return "sponsor";
			}
			
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		return result;
	}
	
	// Give the function the month and day and it returns all the events in the format Name|StartTime|EndTime|Description
	public String getEvents(int year, int month, int day){
		String result = "";
		try{
			resultSet = statement.executeQuery("select eid, uid, name, startTime, endTime, description from Calendar where day="+day+" and month="+month+" and year="+year);
			while (resultSet.next()){
				result +=(resultSet.getInt(1)+"|"+resultSet.getInt(2)+"|"+resultSet.getString(3)+"|"+resultSet.getString(4)+"|"+resultSet.getString(5)+"|"+resultSet.getString(6)+"\n");
			}
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		return result;
	}
	
	// "uid|Year|Month|Day|Name|StartTime|EndTime|Description"
	public void setEvent(String info){
		int uid = Integer.parseInt(info.substring(0, info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		int year = Integer.parseInt(info.substring(0, info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		int month = Integer.parseInt(info.substring(0, info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		int day = Integer.parseInt(info.substring(0,info.indexOf("|")));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		String name = info.substring(0,info.indexOf("|"));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		String startTime = info.substring(0, info.indexOf("|"));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		String endTime = info.substring(0, info.indexOf("|"));
		info = info.substring(info.indexOf("|")+1);
		System.out.println(info);
		String description = info;
		try{
			resultSet = statement.executeQuery("select max(eid) from Calendar");
			resultSet.next();
			int eventNumber = resultSet.getInt(1)+1;
			statement.executeUpdate("insert into Calendar values("+eventNumber+","+uid+","+year+","+month+","+day+",'"+name+"','"+startTime+"','"+endTime+"','"+description+"')");
			
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
	}
	
	public String getUserEvents(int uid){
		String result = "";
		try{
			resultSet = statement.executeQuery("select c.eid, c.uid, year, month, day, name, startTime, endTime, description from Calendar c, SignUp s where c.eid = s.eid and s.uid="+uid);
			while (resultSet.next()){
				result +=(resultSet.getInt(1)+"|"+resultSet.getInt(2)+"|"+resultSet.getInt(3)+"|"+resultSet.getInt(4)+"|"+resultSet.getInt(5)+"|"+resultSet.getString(6)+"|"+resultSet.getString(7)+"|"+resultSet.getString(8)+"|"+resultSet.getString(9)+"\n");
			}
		} catch (SQLException e1){
			System.out.println("SQL Exception.");
			e1.printStackTrace();
		} catch (Exception e2){
			System.out.println("I hope this doesn't happen");
			e2.printStackTrace();
		}
		return result;
		
	}
	
	public void deleteEvent(int eid){
		try {
			statement.executeUpdate("delete from Calendar where eid="+eid);
			statement.executeUpdate("delete from SignUp where eid="+eid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void signUpEvent(int uid, int eid){
		try {
			statement.executeUpdate("insert into SignUp values("+uid+","+eid+")");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void unSignUpEvent(int uid, int eid){
		try {
			statement.executeUpdate("delete from Signup where uid="+uid+" and eid="+eid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String getBulletin(){
		String bulletin = "";
		try {
			FileReader in = new FileReader(bulletingConnection);
			BufferedReader reader = new BufferedReader(in);
			String tmp = reader.readLine();
			while(tmp!=null){
				bulletin += tmp;
				//bulletin+="\n";
				tmp = reader.readLine();
			}
			reader.close();
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return bulletin;
	}
	
	public void setBulletin(String bulletin){
		try{
			FileWriter out = new FileWriter(bulletingConnection);
			BufferedWriter writer = new BufferedWriter(out);
			writer.write(bulletin);
			writer.close();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String jspOutData(){
		TestData td = new TestData();
		String data = "";
		data+="uid|username|password|userType|firstName|lastname|email<br>";
		data+=td.getUsers();
		data+="<br><br>eid|year|month|day|name|startTime|endTime|text<br>";
		data+=td.getCalendar();
		data+="<br><br>uid|eid<br>";
		data+=td.getSignUp();
		td.close();
		while(-1<data.indexOf("\n")){
			//System.out.println(data.indexOf("\n"));
			data= data.substring(0, data.indexOf("\n"))+"<br>"+data.substring(data.indexOf("\n")+1);
		}
		return data;
	}
	
	public void close(){ 
		try {
			if(con!=null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
