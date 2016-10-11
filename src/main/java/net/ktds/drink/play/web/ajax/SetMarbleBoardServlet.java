package net.ktds.drink.play.web.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetMarbleBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SetMarbleBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String viewPath = "/WEB-INF/view/play/marble.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(viewPath);
		
		
		
		rd.forward(request, response);
	}

}
