<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="importador.pages.Principal" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="home">
        <div class="container-carousel" role="main">

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <%--<li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>--%>
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="../imagens/logo_mrSoftware.png" data-holder-rendered="true"/>
                    </div>
                    <div class="item">
                        <img src="../imagens/tempoxreceita.png" data-holder-rendered="true"/>
                    </div>
                </div>
                <a class="left carousel-control" href="http://getbootstrap.com/examples/theme/#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>

                <a class="right carousel-control" href="http://getbootstrap.com/examples/theme/#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>
    </div>

    <div id="sobre">
        <div style="padding-left:200px;">
            <div>

          
                    <img src="img/LogoOficialMRSoftware.png" width="200px" />
          
            </div>
            <p>
                A MRSOFTWARE atua com foco em soluções para area contábil,
                        <br />
                dispõe de uma equipe com profissionais tanto da area de desenvolvimento
                        <br />
                como da area contábil, desenvolvendo e apresentando soluções inovadoras e 
                        <br />
                personalizadas.
            </p>
        </div>
    </div>

    <div id="contato">
                <div class="divide_esquerda">
                    <div>

                        <h1 class="titulo_Contato">
                            <img src="imagens/seta.png" width="30px" />
                            Alan Rosanelli</h1>
                        <p>(51) 9286-3245</p>
                        <a href="mailto:alan_rosaneli@hotmail.com">alan_rosaneli@hotmail.com</a>
                        

                        <br />
                        <br />

                        <div>
                            <h1 class="titulo_Contato">
                                <img src="imagens/seta.png" width="30px" />
                                Elizeu Muniz</h1>
                            <p>(51) 8443-0573</p>
                            <a href="mailto:elizeu@contabilmr.net">elizeu@contabilmr.net</a>
                        </div>

                    </div>
                </div>

                <div class="divide_direita">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m24!1m12!1m3!1d3466.921128631655!2d-50.76260772304939!3d-29.66406299284996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m9!1i0!3e6!4m0!4m5!1s0x9519194aafe717a9%3A0xd89ec6b38a57edea!2smr+software+-+Rua+Carlos+Von+Kozeritz%2C+Rio+Grande+do+Sul%2C+95600-000!3m2!1d-29.663804!2d-50.763025!5e0!3m2!1spt-BR!2sbr!4v1429792505485" width="600" height="450" frameborder="0" style="border:0"></iframe>
                </div>
            </div>

</asp:Content>
