package org.koushik.javabrains;
import java.util.List;
import java.util.ArrayList;

public class Schedule {

	public static ArrayList<Event> events = new ArrayList<Event>();
	public static TestData database = new TestData();
	
	public void addEvent(Event event){
		events.add(event);
		database.setEvent(event.getString());
	}
	
	public ArrayList<Event> getEvents() {
		return events;
	}

	
}
