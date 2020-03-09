package dbPack;

public class dbDTO {
   private int id;
   private String subject;
   private String content;
   private String date;
   private int hit;
   
   public dbDTO(int id, String subject, String content, String date, int hit) {
      this.id = id;
      this.subject = subject;
      this.content = content;
      this.date = date;
      this.hit = hit;
      
   }
   
   public dbDTO() {
      
   }

   public int getId() {
      return id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getSubject() {
      return subject;
   }

   public void setSubject(String subject) {
      this.subject = subject;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getDate() {
      return date;
   }

   public void setDate(String date) {
      this.date = date;
   }

   public int getHit() {
      return hit;
   }

   public void setHit(int hit) {
      this.hit = hit;
   }
}