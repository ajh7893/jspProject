package ClassForOur;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dbPack.dbDAO;
import dbPack.dbDTO;

/**
 * Servlet implementation class dbConnect
 */
@WebServlet("/notice_db")
public class dbConnect extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbConnect() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
      request.setCharacterEncoding("utf-8");
      response.setCharacterEncoding("utf-8");
      PrintWriter out = response.getWriter();
      
      String encType = "utf-8";
      
      int maxSize = 5*1024*1024;
      
      //���� ��ΰ� ���� �� 
      
      ServletContext context = this.getServletContext();
      String saveFolder = "ImageFile";
      String realFolder = context.getRealPath(saveFolder);
      
      MultipartRequest multi = new MultipartRequest(
            request,
            realFolder,
            maxSize,
            encType,
            new DefaultFileRenamePolicy()
            );
      
      String subject = (String)multi.getParameter("subject");
      String content = (String)multi.getParameter("content");
      
      Connection cn = null;
      Statement st = null;
      PreparedStatement ps = null;
      ResultSet rs = null;
      Boolean connect = false;
      
      String query_create = "create table notice(" + 
            "id int not null auto_increment primary key,"
            + "subject varchar(200),"
            + "content text(2000),"
            + "date date,"
            + "hit int"
            + ")";
      
      String query_insert = "insert into notice values(null," + "'" + subject 
            + "'," + "'" + content + "'," + "now()," + "'0')";
      
      try{
         Class.forName("com.mysql.jdbc.Driver");
         cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
         System.out.println("DB connection succeeded");
         
         //���̺� �ߺ� ���� ���� ����ó��
         try{
            st = cn.createStatement();
            
            st.executeUpdate(query_create);
            System.out.println("table created");
            
         }catch(Exception e){
            System.out.println("table already exists");
         }
         st.executeUpdate(query_insert);
         System.out.println("query successfully inserted");
         
         
         cn.close();
         
      }catch(Exception e){
         System.out.println("DB connection failed"+e);
      }
      response.sendRedirect("main.jsp?stat=notice");
   }

}