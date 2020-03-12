<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>PC Shop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="icon" href="images/main/logo.png">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/footer.css">
    <script src="js/main.js"></script>
    <meta charset="utf-8">
</head>
<body onload="slideshow()">
<div id="contain">
    <div id="head">
        <a href="#">
            <div id="logo">
                <a href="pages/login.jsp">
                    <img src="images/main/logo.png" alt="Logo">
                </a>
            </div>
        </a>
        <div id="head1">
            <div id="searchbar">
                <form action="pages/search.jsp" method="get">
                    <div id="searchtext"><input type="text" name="searchtext" placeholder="Search..."></div>
                    <div id="searchbtn">
                        <button type="submit"><i class="fa fa-search fa-2x"></i></button>
                    </div>
                </form>
            </div>
            <a href="pages/cart.jsp" style="color: black">
                <div id="shopping">
                    <i class="fa fa-shopping-cart fa-2x" style="vertical-align: middle"></i>
                    <span style="font-size: 20px;margin-left: 2%">Cart</span>
                </div>
            </a>
        </div>
        <div id="head2">
            <ul class="nav justify-content-center">
                <li class="nav-item">
                    <a class="nav-link" href="pages/categories/motherboard.jsp">Motherboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/categories/processor.jsp">Processor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/categories/videocard.jsp">Videocard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/categories/powersupply.jsp">Power Supply</a>
                </li>
                <li class="nav-item">
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                style="background: none; border: none">
                            Other
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="pages/categories/monitor.jsp">Monitor</a>
                            <a class="dropdown-item" href="pages/categories/hdd-ssd.jsp">HDD/SSD</a>
                            <a class="dropdown-item" href="pages/categories/ram.jsp">RAM</a>
                            <a class="dropdown-item" href="pages/categories/accessories.jsp">Accessories</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div id="center">
        <div id="slide"><img src="images/main/slide/slide2.jpg" alt="slide show" id="slideimg"></div>
        <div id="products">
            <div class="container">
                <div id="p1">
                    <div class="row">
                        <div class="col-sm">
                            <a href="pages/categories/processor.jsp">
                                <img src="images/main/product/cpu.jpg" alt="CPU">
                                <h1>CPU</h1>
                            </a>
                        </div>
                        <div class="col-sm" style="margin-left: 5%;">
                            <a href="pages/categories/monitor.jsp">
                                <img src="images/main/product/monitor.png" alt="Monitor">
                                <h1>Monitor</h1>
                            </a>
                        </div>
                    </div>
                </div>
                <br>
                <div id="p2">
                    <div class="row">
                        <div class="col-sm">
                            <a href="pages/categories/motherboard.jsp">
                                <img src="images/main/product/motherboard.png" alt="Motherboard">
                                <h1>Motherboard</h1>
                            </a>
                        </div>
                        <div class="col-sm" style="margin-left: 5%;">
                            <a href="pages/categories/accessories.jsp">
                                <img src="images/main/slide/slide9.png" alt="Accessories">
                                <h1>Accessories</h1>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="pages/footer.jsp" %>