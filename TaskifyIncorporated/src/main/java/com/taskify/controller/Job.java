package com.taskify.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.taskify.model.jobModel;
import com.taskify.service.jobService;


/**
 * Servlet implementation class Job
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/jobpage2" })
public class Job extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*private jobService jobService=new jobService();*/
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Job() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            
            // Forward to jobpage.jsp where the jobs will be displayed
            request.getRequestDispatcher("/WEB-INF/pages/jobpage2.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
