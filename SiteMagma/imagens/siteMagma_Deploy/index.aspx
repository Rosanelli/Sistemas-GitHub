<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="./bootstrap_files/jquery.min.js"></script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="./bootstrap_files/bootstrap.min.js"></script>
    <script src="./bootstrap_files/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./bootstrap_files/ie10-viewport-bug-workaround.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="icon" href="imagens/favicon.ico" />

    <title>MAGMATTEC</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap_files/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap theme -->
    <link href="bootstrap_files/css/bootstrap-theme.min.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="bootstrap_files/css/theme.css" rel="stylesheet" />

    <link href="bootstrap_files/css/estilo.css" rel="stylesheet" />

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./bootstrap_files/ie-emulation-modes-warning.js"></script>


    <%---------------- for parallax -------------------------------%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>--%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

    <script src="./scripts/jquery.easing.min.js"></script>
    <script src="./scripts/bootstrap.min.js"></script>
    <script src="./scripts/slimmenu.js"></script>
    <script src="./scripts/jquery.nicescroll.js"></script>
    <script type="text/javascript" src="./scripts/tooltip.js"></script>
    <script type="text/javascript" src="./scripts/jquery.parallax-1.1.3.js"></script>
    <script type="text/javascript" src="./scripts/jquery.localscroll-1.2.7-min.js"></script>
    <script type="text/javascript" src="./scripts/jquery.scrollTo-1.4.2-min.js"></script>

    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://adnantopal.github.io/slimmenu/css/slimmenu.css" rel="stylesheet" media="screen" />
    <link href="http://adnantopal.github.io/slimmenu/css/style.css" rel="stylesheet" media="screen" />

    <script type="text/javascript">

        $(document).ready(function () {
            $("html").niceScroll();
            $('.nav').localScroll(800);

            RepositionNav();

            $(window).resize(function () {
                RepositionNav();
            });

            //.parallax(xPosition, speedFactor, outerHeight) options:
            //xPosition - Horizontal position of the element
            //inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
            //outerHeight (true/false) - Whether or not jQuery should use it's outerHeight option to determine when a section is in the viewport
            $('#intro').parallax("100%", 1200, 0.1, true);
            $('#second').parallax("100%", 1200, 0.1, true);
            $('.bg').parallax("100%", 3500, 0.3, true);
            $('#third').parallax("100%", 1200, 0.1, true);
        })
    </script>

</head>
<body role="document">
    <form id="form1" runat="server">
        <div>
            <!-- Fixed navbar -->
            <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <%--<a class="navbar-brand" href="./bootstrap_files/bootstrap.html">Bootstrap theme</a>--%>

                        <asp:ImageButton ID="logoMagmattec" ImageUrl="./imagens/logoMagmattec.png" class="navbar-brand" runat="server" />
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#intro">HOME</a></li>
                            <li><a href="#second">QUEM SOMOS</a></li>
                            <li class="dropdown">
                                <a href="./bootstrap_files/bootstrap.html" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">PRODUTOS <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="./bootstrap_files/bootstrap.html">NANO</a></li>
                                    <li><a href="./bootstrap_files/bootstrap.html">FERRITE</a></li>
                                    <li><a href="./bootstrap_files/bootstrap.html">INDUCTORS</a></li>
                                    <li><a href="./bootstrap_files/bootstrap.html">TRANSFORMERS</a></li>
                                    <li><a href="./bootstrap_files/bootstrap.html">FERROFLUID</a></li>
                                </ul>
                            </li>
                            <li><a href="http://getbootstrap.com/examples/theme/#contact">CONTATO</a></li>
                            <li><a href="http://getbootstrap.com/examples/theme/#contact">EVENTOS</a></li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </nav>

            <div id="intro">
                <div class="container-carousel" role="main">

                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="item">
                                <img src="imagens/carousel-2.jpg" alt="Second slide [1140x500]" data-holder-rendered="true">
                            </div>
                            <div class="item active">
                                <img src="imagens/primeiroSlide.png" data-holder-rendered="true">
                            </div>
                            <div class="item">
                                <img src="imagens/carousel3.jpg" data-holder-rendered="true">
                            </div>
                        </div>
                        <%-- <a class="left carousel-control" href="http://getbootstrap.com/examples/theme/#carousel-example-generic" role="button" data-slide="prev">
                        
                    </a>
                    <a class="right carousel-control" href="http://getbootstrap.com/examples/theme/#carousel-example-generic" role="button" data-slide="next">
                        
                    </a>--%>
                    </div>

                </div>
            </div>

            <div id="second">
                <img src="imagens/second.png" class="img-responsive" data-holder-rendered="true" />
            </div>


            <div class="footer">
            </div>

        </div>
    </form>


</body>
</html>
