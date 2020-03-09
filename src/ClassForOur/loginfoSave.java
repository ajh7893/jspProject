package ClassForOur;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class loginfoSave
 */
@WebServlet("/loginfoSave")
public class loginfoSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginfoSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = (String)request.getParameter("userid");
		String pw = (String)request.getParameter("password");
		String name = (String)request.getParameter("name");
		String sex = (String)request.getParameter("sex");
		String bir = (String)request.getParameter("bir");
		String email = (String)request.getParameter("email");
		String phone =  (String)request.getParameter("phone");
		String addr = (String)request.getParameter("address");
		
		logDao dao = logDao.getInstance();
		logtest loginfo = new logtest();
		
		loginfo.setUserid(userId);
		loginfo.setPw(pw);
		loginfo.setName(name);
		loginfo.setSex(sex);
		loginfo.setBir(bir);
		loginfo.setEmail(email);
		loginfo.setPhon(phone);
		loginfo.setAddr(addr);
		
		dao.insert(loginfo);
		
		RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
		dis.forward(request, response);
		
		
		
	}

}
