<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

    <head>

        <link rel="shortcut icon" href="img/Student Mart.ico" type="image/x-icon">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
              integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Trending Things to Buy</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
          /* Remove the navbar's default rounded borders and increase the bottom margin */ 
          .navbar {
            margin-bottom: 50px;
            border-radius: 0;
          }
          #search {
      position: relative;
      display: inline-block;
      padding: 10px 20px;
      max-width: 10in;
      border-radius: 200px;
      border: 2px solid #9580FF;
  }
  .button_1 {
      background-color: #212529;
      border: none;
      color: white;
      padding: 12px 15px;
      text-align: center;
      text-decoration: none;
      font-size: 12px;
      cursor: pointer;
      position: relative;
      border-radius: 12px;
  }
          button {
    background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
}
      
          /* Add a gray background color and some padding to the footer */
          footer {
            background-color: #f2f2f2;
            padding: 25px;
          }
        </style>

      </head>

<body>
<%
//allow access only if session exists
String user = null;
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
/* 
else */
if(session.getAttribute("username") == null){
	response.sendRedirect("welcome");
}
if(session.getAttribute("role").equals("admin")){
	response.sendRedirect("admin");
}

%>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <!--<a class="navbar-brand" href="#">Logo</a>-->
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="/contact">Contact</a></li>
            </ul>
            <form name="myForm"method="post" action="/logout">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
              
              <li><a href="javascript: submitform()"  ><span class="glyphicon glyphicon-shopping-off"></span>Logout</a></li>
             
            </ul>
             </form>

          </div>
        </div>
      </nav>
          <script type="text/javascript">

function submitform()

{

 document.myForm.submit();

}

</script>         
      <center>
          <form method="post" action="/search?key">

          <input type="text" id ="txt" name="key" >

      
          <button id="button-id" type="submit">Search Product</button>
          </form>
      <button type="button" class="btn btn-info">Want to Sell a Product?</button>
    </center>
      <br/><br/>

      <c:choose>
		<c:when test="${mode=='All_Products' }">

              
                <div class="container">


                          <span></span>
                              <c:forEach var="item" items="${item}">

                                <div class="row">
                                <!-- <span>${item}</span> -->

                                            <div class="col-sm-4">
                                              <div class="panel panel-primary">
                              <div class="panel-heading">${item.product_name}</div>
                              <div class="panel-body"><img src= "${item.image_path}" class="img-responsive" style="width:100%; height:40%;" alt="Image"></div>
                              <div class="panel-footer" style= "cursor:pointer">
                                 <a data-toggle="modal" data-target="#${item.id}">${item.description}</a></div>
                                </div>
                            </div>
                            </div>
                            </div>
                        


                        <div class="modal fade" id="${item.id}" role="dialog">
                            <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">${item.product_name}</h4>
                              </div>
                              <div class="modal-body">
                                     <img src= "${item.image_path}"
                                      class="img-responsive" style="width:100%; height:40%;" alt="Image" />

                                <p>${item.seller_id}</p>
                                 <button type="button" class="btn btn-info" onclick ="window.location.href='/buy-item?id=${item.id}'">Buy</button>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              </div>
                            </div>
                        </div>

                    </div>

                </c:forEach>
        </c:when>



	<c:when test="${mode=='SEARCH' }">


                    <div class="container">


                              <span></span>
                                 <c:forEach var="item" items="${item}">
				
                                    <div class="row">
                                    <!-- <span>${item}</span> -->

                                                <div class="col-sm-4">
                                                  <div class="panel panel-primary">
                                  <div class="panel-heading">${item.product_name}</div>
                                  <div class="panel-body"><img src= "${item.image_path}" class="img-responsive" style="width:100%; height:40%;" alt="Image"></div>
                                  <div class="panel-footer" style= "cursor:pointer">
                                     <a data-toggle="modal" data-target="#${item.id}">${item.description}</a></div>
                                    </div>
                                </div>
                                </div>
                                </div>
                            </div>


                            <div class="modal fade" id="${item.id}" role="dialog">
                                <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">${item.product_name}</h4>
                                  </div>
                                  <div class="modal-body">
                                         <img src= "${item.image_path}"
                                          class="img-responsive" style="width:100%; height:40%;" alt="Image" />

                                    <p>${item.seller_id}</p>
                                     <button type="button" class="btn btn-info" onclick ="window.location.href='/buy-item?id=${item.id}'">Buy</button>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                  </div>
                                </div>
                            </div>

                    </div>
				</c:forEach>
                  
            </c:when>
            
            <c:when test="${mode=='NO_PRODUCT' }">
            
            	<h5> Item not available </h5>
            </c:when>
            
       </c:choose>



</body>
</html>