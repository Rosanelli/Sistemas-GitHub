<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SiteRada.Paginas.Parallax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>.:Bortolotti Vidros:.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <link rel="stylesheet" type="text/css" href="~/Estilo/bootstrap.min.css" />
    <link href="~/Estilo/bootstrap-responsive.min.css" rel="stylesheet" media="screen" />
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://adnantopal.github.io/slimmenu/css/slimmenu.css" rel="stylesheet" media="screen" />
    <link href="http://adnantopal.github.io/slimmenu/css/style.css" rel="stylesheet" media="screen" />
    <link href="~/Estilo/estilo.css" rel="stylesheet" type="text/css" />

    <script src="js-global/FancyZoom.js" type="text/javascript"></script>
    <script src="js-global/FancyZoomHTML.js" type="text/javascript"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="../scripts/jquery.easing.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/slimmenu.js"></script>
    <script src="../scripts/jquery.nicescroll.js"></script>
    <script type="text/javascript" src="../scripts/jquery.parallax-1.1.3.js"></script>
    <script type="text/javascript" src="../scripts/jquery.localscroll-1.2.7-min.js"></script>
    <script type="text/javascript" src="../scripts/jquery.scrollTo-1.4.2-min.js"></script>


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
            $('#intro').parallax("50%", 1200, 0.1, true);
            $('#second').parallax("50%", 1200, 0.1, true);
            //$('.bg').parallax("50%", 3500, 0.3, true);
            $('#third').parallax("50%", 1200, 0.1, true);

        })


    </script>



</head>
<body onload="setupZoom()">
    <form id="form1" runat="server">

        <style>
            body {
                background-color: #fff;
            }

            .auto-style1 {
                font-size: 20px;
            }
        </style>


        <a class="visible-desktop" href="#intro">
            <%--<img style="position: fixed; width: 140px; top: 0; right: 0; border: 0; z-index: 1050" src="../Imagens/logo.png" alt="JSI Instalações" /></a>--%>
        <div class="container">
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="navbar-inner">
                    <div class="container">
                        <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="brand" href="#" data-target=".section-about"></a>
                        <div class="nav-collapse collapse">
                            <ul class="nav">
                                <li><a href="#intro" data-target=".section-about">Inicio</a></li>
                                <li class="divider-vertical"></li>
                                <li><a href="#second" data-target=".section-example">Serviços
                                </a></li>
                                <li class="divider-vertical"></li>
                                <li><a href="#third" data-target=".section-options">Empresa</a></li>
                                <li class="divider-vertical"></li>
                                <li><a href="#fifth" data-target=".section-support">Contato</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                $('ul.nav').slimmenu(
                {
                    resizeWidth: '800',
                    collapserTitle: 'Main Menu',
                    easingEffect: 'easeInOutQuint',
                    animSpeed: 'medium',
                    indentChildren: true,
                    childrenIndenter: '&raquo;'
                })
            </script>



            <div id="intro">
                <div class="story">
                    <div>
                        <div class="bg"></div>
                        <div class="float-left">

                            <center>
                            <div>
                                <asp:Image ImageUrl="~/Imagens/titulo.png" runat="server" Height="150" Width="450px" />
                            </div>

                                   <table style="width: 300px">
                            
                            <tr>
                                <td>
                                    
                                    <a href="imagens-servico/eletricaPoPup.jpg">
                                    <img class="imagens_Inicio" src="Imagens/bortolotti1.png"  onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>                                        
                                        <%--<asp:ImageButton ID="foto_Eletrica"  ImageUrl="~/Imagens/eletrica.jpg" runat="server" Height="250" Width="300" />                                                                           --%>
                                </td>
                                <td>
                                    <asp:ImageButton ID="foto_Hidraulica"  ImageUrl="~/Imagens/bortolotti2.png" runat="server" Height="250" Width="300" />
                                </td>
                                <td>
                                    <asp:ImageButton ID="foto_Pintura"  ImageUrl="~/Imagens/bortolotti3.png" runat="server" Height="250" Width="300" />
                                </td>
                               
                            </tr>
                        </table>
                           
                            <p>A Bortolotti Vidros oferece tudo que você precisa para sua casa, box para banheiro em vidro e acrilico , espelhos , fechamento de sacadas e muito mais</p>
                                <p>
                                    Solicite agora mesmo um orçamento <span class="auto-style1">(51) 8489-7782</span>  
                               </p>
                            </center>
                        </div>
                    </div>

                </div>
                <!--.story-->
            </div>
            <!--#intro-->

            <div id="second">
                <div class="story">
                    <div class="bg"></div>
                    <div class="float-right">
                        <h2>Bortolotti Vidros - Serviços</h2>
                        <br />
                        <a href="imagens-servico/1.jpg">
                            <img src="imagens-servico/1-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>
                        <a href="imagens-servico/2.jpg">
                            <img src="imagens-servico/2-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>
                        <a href="imagens-servico/3.jpg">
                            <img src="imagens-servico/3-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>
                        <a href="imagens-servico/4.jpg">
                            <img src="imagens-servico/4-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>
                        <a href="imagens-servico/5.jpg">
                            <img src="imagens-servico/5-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>
                        <br />
                        <br />
                        <a href="imagens-servico/6.jpg">
                            <img src="imagens-servico/6-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>
                        <a href="imagens-servico/7.jpg">
                            <img src="imagens-servico/7-tumb.jpg" onmouseover="style.opacity=0.8" onmouseout="style.opacity=1" /></a>




                    </div>
                </div>
                <!--.story-->

            </div>
            <!--#second-->

            <div id="third">
                <div class="story">
                    <div class="float-left">
                        <h2>Quem Somos</h2>
                        <p>

                            <font color="black">A Vidraçaria Bortolotti atua no segmento de vidros temperados para a construção civil, arquitetura e decoração.
                                         Comercializa portas e janelas em vidro temperado, box para banheiros e banheiras,sacadas, tampos de mesa, espelhos, esquadrias em alumínio e persianas.
                                         Há mais de 21 anos no mercado</font>

                        </p>
                    </div>
                </div>
                <!--.story-->
            </div>
            <!--#third-->

            <div id="fifth">
                <div class="story">
                    <h2>Eder Bortolotti</h2>
                    <p>Telefone: (51) 8489-7782</p>
                    <p>Email: eder@bortolotti.com.br</p>

                    <ul>
                        <li><strong>Facebook</strong>: <a href="https://pt-br.facebook.com/pages/Bortolotti-Vidros/553658448028147" target="new" title="Facebook Bortolotti">@Bortolotti</a></li>
                    </ul>

                </div>
                <!--.story-->
            </div>
            <!--#fifth-->
        </div>
    </form>
</body>
</html>
