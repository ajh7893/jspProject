package ClassForOur;
import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import javax.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;




/**
 * Servlet implementation class FileUpload1
 */
@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public UploadServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
	   // ��ǰ ����ϴ� ���� GoodsAdd.jsp���� �Ѿ���°� 
	   request.setCharacterEncoding("UTF-8");
	   //�̹��� ������
	   HttpSession session = request.getSession();
	   int sizeLimit = 10 * 1024 * 1024;
	   //�̹��� ���� ������
	   String savePath = request.getSession().getServletContext().getRealPath("ImageFile");
	   //�̹����� ������Ʈ, ���, �������, ���ڵ�, ��ġ���ʰ� �̸��� ����
	   MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	   
	   
	   //jsp���������� ������ name�� �Ķ���ͷ� �����´�.
	   String goodsName = (String)multi.getParameter("goodsName");
	   String goodsPrice = (String)multi.getParameter("goodsPrice");
	   String goodsCate = (String)multi.getParameter("goodsCate");
	   String goodsContents =(String)multi.getParameter("goodsContents");
	   String goodsFile1 = (String)multi.getFilesystemName("goodsFile1");
	   String userId = (String)session.getAttribute("sessionID");
	   
//	   System.out.println(cate);
	   
	   //���� �����Ǹ� �ʱ�ȭ 
	   BoardDao dao = BoardDao.getInstance();
	   AddGoods goods = new AddGoods();
	   
	   goods.setId("1");
	   goods.setGoodsCate(goodsCate);
	   goods.setGoodsContents(goodsContents);
	   goods.setGoodsName(goodsName);
	   goods.setGoodsPrice(goodsPrice);
	   goods.setGoodsFile1(goodsFile1);
	   goods.setUserId(userId);
	   goods.setHit(0);
	   
	   dao.insert(goods);
	   
	   //DB��ü
	   //DBConnetion con = new DBConnetion();
	   //DB�Լ� ī�װ� �߰� 
	   //con.insert(goodsName, goodsPrice, goodsCate, goodsContents, fileName);	   
	   
	   //�Ķ���� ���� �������¹�� (multy.getP()�����
//	   	String num = (String) multi.getParameter("number");
//      System.out.println(num);
//      Enumeration en = multi.getFileNames();
//      String name=(String)en.nextElement();      
//      System.out.println(name);
	   //�����̸�
	   
	   
	   RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
	   dis.forward(request, response);
	   
	   
	   
   }
}

