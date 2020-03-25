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


          /* Add a gray background color and some padding to the footer */
          footer {
            background-color: #f2f2f2;
            padding: 25px;
          }
        </style>
      </head>

<body>
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
            <ul class="nav navbar-nav navbar-right">
              <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <br/><br/>


              <h3> You have chosen to purchase ${item.product_name} from ${item.seller_id}</h3>
              <h3> Call him at #Phone_Number to finalize the deal. Asking price is ${item.selling_price} </h3>





</body>
</html>