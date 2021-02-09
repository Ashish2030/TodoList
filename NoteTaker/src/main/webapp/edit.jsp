<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="alljs_css.jsp" %>
</head>
<body>
  <div class="container">
    <%@include file="navbar.jsp" %>
       <br>
    <h1>Edit your page</h1>
    <br>
    <%
  
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    Session s=FactoryProvider.getFactory().openSession();
	Transaction tx=s.beginTransaction();
	Note note=(Note)s.get(Note.class, noteId);
    %>
     <form action="UpdateServlet" method="post">
     <input value="<%=note.getId()%>" name="noteId" type="hidden">
  <div class="form-group">
    <label for="title">Note title</label>
    <input name="title" required type="text"  class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter Here" value="<%=note.getTitle()%>">
   
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
  <textarea name="content" required id="content"  placeholder="Enter Your Content Here" class="form-control" style="height:300px"><%=note.getContent() %></textarea>
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-success">Save Your Note</button>
  </div>
  
</form>  
    		
    </div>
</body>
</html>