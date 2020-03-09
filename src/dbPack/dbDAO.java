package dbPack;

import java.sql.*;
import java.util.ArrayList;

public class dbDAO {
   private String url = "jdbc:mysql://localhost:3306/bbs";
   private String id = "root";
   private String pw = "1234";
   
   Connection con = null;
   Statement st = null;
   ResultSet rs = null;
   private static dbDAO instance;
   
   //�̱��� ����
   static public dbDAO getInstance() {
      if(instance == null) {
         instance = new dbDAO();
      }
      
      return instance;
   }
   
   public dbDAO() {
      try {
         Class.forName("com.mysql.jdbc.Driver");
         
         try {
				//Ʈ���� ��ġ���� ���ؼ� ������ ������ �Ѵ�. ������ �Ǿ��ִٸ� �̹� ��������ٰ� �˷��ش�.
				String makingTable ="create table notice(" + 
			            "id int not null auto_increment primary key,"
			            + "subject varchar(200),"
			            + "content text(2000),"
			            + "date date,"
			            + "hit int"
			            + ")";
				Statement stmt = null;
				
				stmt = con.createStatement();
				//������Ʈ��Ʈ ���� --> ����������(executeUpdate)
				stmt.executeUpdate(makingTable);
				System.out.println("���̺��� �����Ͽ����ϴ�.");
			} catch (SQLException e) {
			System.out.println("�̹� ��������ֽ��ϴ�.");
			}
      }catch(Exception e) {
         
      }
   }
   
   //DB���� ������ �о�ͼ� dtos��� ��� ����Ʈ�� �ֱ�
   public ArrayList<dbDTO> dbSelect(){
      ArrayList<dbDTO> dtos = new ArrayList<dbDTO>();
      
      try {
         con = DriverManager.getConnection(url, id, pw);
         st = con.createStatement();
         rs = st.executeQuery("select * from notice order by id desc");
         
         while(rs.next()) {
               int id = rs.getInt("id");
               String subject = rs.getString("subject");
               String content = rs.getString("content");
               String date = rs.getString("date");
               int hit = rs.getInt("hit");
               
               dbDTO dto = new dbDTO(id, subject, content, date, hit);
               dtos.add(dto);
         }
      }catch(Exception e) {
            
      }finally {
         try {
            if(rs != null)rs.close();
            if(st != null)st.close();
            if(con != null)con.close();
            
         }catch(Exception e) {
            
         }
      }
      
      return dtos;
   }
   
   //id�� �� ã�Ƽ� ���� �ҷ�����
   public dbDTO getDetail(String boardNum) {
      
      try {
         con = DriverManager.getConnection(url, id, pw);
         st = con.createStatement();
         PreparedStatement ps = con.prepareStatement("select * from notice where id = ?");
         ps.setString(1, boardNum);
         rs = ps.executeQuery();
         dbDTO dto = new dbDTO();
         if(rs.next()) {
            dto.setId(rs.getInt(1));
            dto.setSubject(rs.getString(2));
            dto.setContent(rs.getString(3));
            dto.setDate(rs.getString(4));
            dto.setHit(rs.getInt(5));
         }
         return dto;
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      return null;
   }
   
   //�����ϱ�
   public void update(dbDTO dto) {
      PreparedStatement ps = null;
      try {
         ps = con.prepareStatement("update notice set subject = ?, content = ?, hit = ? where id = ?");
         ps.setString(1, dto.getSubject());
         ps.setString(2, dto.getContent());
         ps.setInt(3, dto.getHit());
         ps.setInt(4, dto.getId());
         ps.executeUpdate();
         
      }catch(SQLException e) {
         System.out.println("������ ���� ����");
         
      }finally {
         if(ps != null){
            try {
               ps.close();
            }catch(SQLException e) {
               
            }
         }
         
      }
   }
   
   
}