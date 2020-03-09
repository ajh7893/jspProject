package ClassForOur;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class replyservlet
 */
@WebServlet("/replyservlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReplyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		ReplyDao dao = ReplyDao.getInstance();
		Reply mre = new Reply();
		String recontent = request.getParameter("recontent");
		String reid = (String)session.getAttribute("sessionID");
		String boardnum = request.getParameter("boardnum");

		mre.setReid(reid);
		mre.setRecontent(recontent);
		mre.setBoardnum(boardnum);
		dao.insert(mre);
		
		response.sendRedirect("main.jsp?id="+boardnum);
	}

}
