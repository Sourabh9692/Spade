<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Description</title>
           <meta charset="utf-8">
           <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

           <!-- Bootstrap CSS -->
           <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-                ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
           <!--<link  rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">-             -->
          <style type="text/css">
            .container.main{
                 margin-top: 4.0em;
              }
              
              #delete{
                  display:inline;
              }
        
        li a{
          color:#f4f4f4;
        }
        
          </style>
</head>
<body>
<%@page import="java.sql.*" %>

 <nav class="navbar fixed-top navbar-expand-lg navbar-light " style="background-color: #1B1B1B;">
         <a class="navbar-brand" href="/" style="color:#f4f4f4;">Spade<i class=""></i></a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-                                  controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse" id="navbarSupportedContent">
             <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="cart.jsp" style="color:#f4f4f4;">Cart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout" style="color:#f4f4f4;">LogOut</a>
                </li>
             </ul>
      
         </div>
     </nav>
    
   <br>
   <br>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-      UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
    
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">  
       

<style>
  body{
    background:url();
    background-size: cover;
    background-repeat:no-repeat;
    background-position: center;
}
  #newTop{
    margin-top:50px;
  }
  h1{
    text-align:center;
    
  }
  label{
    color:#17a2b8;
  }
  
  .row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}
.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
  padding: 10px 15px;
}
hr{
  color:#f4f4f4;
}
.boxShadow{
      padding: 10px;
        box-shadow: 5px 10px 8px #888888;
     }
</style>


<%	
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
}
catch(ClassNotFoundException e){
	System.out.println(e);
} 
if (session.getAttribute("id") == null) {
    
	response.sendRedirect("descout.jsp?car="+Integer.parseInt(request.getParameter("car"))); 
} 	else{
Connection conn=null;
PreparedStatement ps = null;
PreparedStatement sp = null;


int  delete = (request.getParameter("del") == null) ? 0 : Integer.parseInt(request.getParameter("del"));


try{
	conn =  DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott99","tiger");
	 ps = conn.prepareStatement("SELECT * FROM products WHERE pid=?");
	 sp = conn.prepareStatement("delete FROM cart WHERE userid=? and pid=?");
	 if(delete==0){
		 int car = Integer. parseInt(request. getParameter("car"));
	 ps.setInt(1,car);
	 ResultSet rs= ps.executeQuery();
	 rs.next();
		  
		  %>
		  
		 <div class="container" id="newTop">
  
      <div class="card mb-3 boxShadow" style="max-width: 80%; margin: 0 auto;">
      <div class="row no-gutters ">
    <div class="col-md-4">
      <img src="<%=rs.getString(4)%>" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title"><%=rs.getString(2)%></h5>
        <p class="card-text"><%=rs.getString(3) %></p>
        <p class="card-text"><small class="text-muted">Price = <%=rs.getString(6) %></small></p>
         <form action="add" method="get">
		       </br>
		       <select name="qty">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
               </select></br>
		       <button type="submit" class="btn btn-lg btn-info btn-lg" name="carid" value="<%=rs.getInt(1)%>">Add to Cart</button>
		        
		   </form>
      </div>
    </div>
  </div>
</div> 
		  
		 <%--   <h1 style="color:blue;"><center><%=rs.getString(2)%></center></h1>
		   <div align="center">
		   <img src="<%=rs.getString(4)%>" height="400" width="200">
		   <h3 style="color:blue"><%=rs.getString(3) %></h3>
		   <h2 style="color:green">Price = <%=rs.getString(6) %></h2>
		   <form action="add" method="get">
		       </br>
		       <select name="qty">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
               </select></br>
		       <button type="submit"  name="carid" value="<%=rs.getInt(1)%>"><h3>Add to Cart!!!!</h3></button>
		   
		   </form>
		   
		   </div> --%>
		  
		  <%}
	 else{
		 Integer userid = (Integer)session.getAttribute("id");
		 sp.setInt(1,userid.intValue());
		 sp.setInt(2,delete);
		 sp.executeQuery();
		 response.sendRedirect("cart.jsp");
	 }
		  
	 
	  
  
}
catch(SQLException e){
	 System.out.println(e);
}
finally
{
	 try
	 {
		 ps.close();
		 conn.close();
	 }
	 catch(Exception e){
		 System.out.println(e);
	 }
}}
%>



</body>
</html>
