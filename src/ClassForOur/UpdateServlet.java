package ClassForOur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/updateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
		
		//등록상품 수정하는 서블릿 
		request.setCharacterEncoding("UTF-8");
		int sizeLimit = 10 * 1024 * 1024;
		HttpSession session = request.getSession();
		//이미지 파일 저장경로
		String savePath = request.getSession().getServletContext().getRealPath("ImageFile");
		//수정하고 난후  text파일에 저장된것을 변수로 만들어 줘서 
		//불러오고  데이터들을 디비에 저장하고 불러온다.
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

		String id = multi.getParameter("id");

		String goodsName = multi.getParameter("goodsName");

		String goodsPrice = multi.getParameter("goodsPrice");

		String goodsContents = multi.getParameter("goodsContents");
		
		String goodsFile1;
		if (multi.getParameter("goodsFile1") == null) {
		goodsFile1 = (String)session.getAttribute("file"); 
		session.setAttribute("file", null);
		}else {
		goodsFile1 = (String)multi.getFilesystemName("goodsFile1");
		}
		String goodsCate = multi.getParameter("goodsCate");
		
		AddGoods board = BoardDao.getInstance().selectOne(id);

		board.setGoodsName(goodsName);
		board.setGoodsPrice(goodsPrice);
		board.setGoodsContents(goodsContents);
		board.setGoodsFile1(goodsFile1);
		board.setGoodsCate(goodsCate);
		
		//보냄
		BoardDao.getInstance().update(board);
		response.sendRedirect("boardInfo.jsp?id=" + id);

	}

}
