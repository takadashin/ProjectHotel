/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.humber.ca.BookSLBeanRemote;
import com.humber.ca.UserSFBeanRemote;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author khai
 */
public class Authentication implements Filter {

  private String contextPath;

  @Override
  public void init(FilterConfig fc) throws ServletException {
    contextPath = fc.getServletContext().getContextPath();
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain fc) throws IOException, ServletException {
      try {
          HttpServletRequest req = (HttpServletRequest) request;
          HttpServletResponse res = (HttpServletResponse) response;
          
          HttpSession session = req.getSession();
          
          InitialContext ic = new InitialContext();
          
          UserSFBeanRemote sbstring;
          sbstring = (UserSFBeanRemote) session.getAttribute("beansession");
          if (sbstring == null) { //checks if there's a LOGIN_USER set in session...
              res.sendRedirect(contextPath + "/login.jsp"); //or page where you want to redirect
          } else {
              String userType = sbstring.getUserType();
              if (!userType.equals("A")){ //check if user type is not admin
                  res.sendRedirect(contextPath + "/index.jsp"); //or page where you want to
              }
              else
              fc.doFilter(request, response);
          } } catch (NamingException ex) {
          Logger.getLogger(Authentication.class.getName()).log(Level.SEVERE, null, ex);
      }
  }

  @Override
  public void destroy() {
  }
}