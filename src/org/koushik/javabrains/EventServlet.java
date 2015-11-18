package org.koushik.javabrains;
import java.io.IOException;
import java.sql.Time;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventServlet extends HttpServlet implements Servlet {
	
	public EventServlet(){
		super();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		//String date = req.getParameter("date");
		int month = Integer.parseInt(req.getParameter("month"));
		int day = Integer.parseInt(req.getParameter("day"));
		int year = Integer.parseInt(req.getParameter("year"));
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
		String about = req.getParameter("about");
		
		Schedule schedule = (Schedule)req.getSession(true).getAttribute("schedule");
		if(schedule == null){
			schedule = new Schedule();
		}
				
		Event event = new Event(title, month, day, year, startTime, endTime, about);
		schedule.addEvent(event);
			
		req.getSession().setAttribute("schedule", schedule);
		getServletContext().getRequestDispatcher("/Calendar.jsp").forward(req, resp);
		
	}
}
