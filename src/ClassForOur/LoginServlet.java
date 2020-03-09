package ClassForOur;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
   //   response.getWriter().append("Served at: ").append(request.getContextPath());
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      //doGet(request, response);
      
       request.setCharacterEncoding("UTF-8");
      HttpSession session = request.getSession();
      logDao dao = logDao.getInstance();
      
      String id = (String)request.getParameter("userid");
      String pw = (String)request.getParameter("password");
      
      int check = dao.loginCheck(id, pw);
      
      if (check == 1 ) {//로그인 성공
         session.setAttribute("sessionID", id);
         RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
         dis.forward(request, response);
      }else if(check == 0) {//비밀번호가 틀릴경우
         response.sendRedirect("main.jsp?stat=login");
      }else {
         response.sendRedirect("main.jsp?stat=login");
      }
      
      
   }

}