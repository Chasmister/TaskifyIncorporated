package com.taskify.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.taskify.util.CookieUtil;
import com.taskify.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ROOT = "/";
    private static final String DASHBOARD = "/admindashboard";
    private static final String PROFILE = "/profile";
    private static final String ABOUT = "/aboutus";
    private static final String MYJOBS = "/myJobs";
    private static final String MYAPPS = "/myApplications";
    private static final String JOBS = "/jobs";
    private static final String LOGOUT = "/logout";
    private static final String ADDJOBS= "/addjobs";
    private static final String MANAGEJOBS= "/managejobs";
    private static final String MANAGEUSERS= "/manageuser";
    private static final String MANAGEPROFILE= "/adminprofileedit";
    private static final String ADDADMIN= "/AddAdmin";
    private static final String EDITUSER= "/edituser";
    private static final String EDITJOB= "/editjob";
    private static final String UPDATEADMINPROFILE= "/updateAdminProfile";

    private static final String BUILDPROFILE="/buildProfile";
    private static final String UPDATEPROFILE="/updateProfile";
    private static final String APPLIST="/ApplicationList";


    
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic, if required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        
        // Check if response is already committed
        if (res.isCommitted()) {
            return; // If the response is committed, do nothing further
        }

        // Allow access to resources (images, CSS files, etc.)
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
            chain.doFilter(request, response);
            return;
        }

        boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
        String userRole = CookieUtil.getCookie(req, "userType") != null ? CookieUtil.getCookie(req, "userType").getValue() : null;

        if ("ADMIN".equals(userRole)) {
            // Admin is logged in
        	if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(PROFILE)) {
        	    res.sendRedirect(req.getContextPath() + DASHBOARD);
    
            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(UPDATEADMINPROFILE) || uri.endsWith(EDITJOB)  || uri.endsWith(EDITUSER) || uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(MANAGEJOBS) || uri.endsWith(MANAGEUSERS) || uri.endsWith(MANAGEPROFILE) || uri.endsWith(LOGOUT) || uri.endsWith(ADDADMIN) ) {
                chain.doFilter(request, response); // Proceed with the filter chain
            } else {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
            }

        } else if ("NON-ADMIN".equals(userRole)) {
            // Non-admin user is logged in
        	if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(DASHBOARD) ) {
        	    res.sendRedirect(req.getContextPath() + HOME);
            } else if (uri.endsWith(HOME) || uri.endsWith(JOBS) || uri.endsWith(PROFILE) || uri.endsWith(ROOT) || uri.endsWith(JOBS) || uri.endsWith(ABOUT) || uri.endsWith(MYJOBS) || uri.endsWith(MYAPPS) || uri.endsWith(LOGOUT) || uri.endsWith(ADDJOBS) || uri.endsWith(UPDATEPROFILE) || uri.endsWith(APPLIST) || uri.endsWith(BUILDPROFILE)) {
                chain.doFilter(request, response); // Proceed with the filter chain
            } else {
                res.sendRedirect(req.getContextPath() + REGISTER);
            }
        } else {
            // Not logged in
        	if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(BUILDPROFILE) ) {
        	    chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN); // Redirect to login if not logged in
            }
        }
    }

    @Override
    public void destroy() {
        // Cleanup logic, if required
    }
}