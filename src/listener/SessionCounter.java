package listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import myutils.OnlineCounter;

/**
 * Application Lifecycle Listener implementation class SessionCounter
 *
 */
@WebListener
public class SessionCounter implements HttpSessionListener {

	/**
	 * Default constructor.
	 */
	public SessionCounter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
	 */
	public void sessionCreated(HttpSessionEvent event) {
		ServletContext ctx = event.getSession().getServletContext();
		Integer numSessions = (Integer) ctx.getAttribute("numSessions");
		if (numSessions == null) {
			numSessions = new Integer(1);
		} else {
			int count = numSessions.intValue();
			numSessions = new Integer(count + 1);
		}
		ctx.setAttribute("numSessions", numSessions);
	}

	/**
	 * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
	 */
	public void sessionDestroyed(HttpSessionEvent event) {
		ServletContext ctx = event.getSession().getServletContext();
		Integer numSessions = (Integer) ctx.getAttribute("numSessions");
		if (numSessions == null) {
			numSessions = new Integer(0);
		} else {
			int count = numSessions.intValue();
			numSessions = new Integer(count - 1);
		}

		ctx.setAttribute("numSessions", numSessions);
	}

}
