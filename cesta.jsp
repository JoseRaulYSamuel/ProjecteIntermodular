<%-- 
    Document   : cesta
    Created on : 24 may 2023, 23:17:09
    Author     : jherr
--%>

<%@page import="dao.CestaDAO"%>
<%@page import="dto.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Lineacesta"%>
<%@page import="dto.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>San-Je Shop</title>
        <link rel="stylesheet" href="./css/cesta.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" /></head>
    <body>
        <div class="fondo-superior">
        </div>
        <header class="encabezado-principal">
            <section>
                <figure class="logo-web">
                    <a href="../html/index.jsp"><img src="./img/logo.png" alt="Logotipo San-Je Shop"></a>
                </figure>
            </section>
            <nav class="menu">
                <section>
                    <ul class="nav-list">
                        <li class="navegar"><a href="./productos.jsp">Productos</a></li>
                        <li class="navegar"><a href="./concurso.jsp">Concurso</a></li>
                        <li class="navegar"><a href="./contacto.jsp">Contacto</a></li>
                        <li class="navegar"><a href="./sobrenosotros.jsp">Sobre Nosotros</a></li>
                        <li><p><input type="search" name= "buscador" placeholder="Buscar en San-Je Shop" class="buscador"/></p></li>
                        <li class="inicio-sesion"><a href="./login.jsp">Entrar / Registrarse</a></li>
                    </ul>
                </section>
            </nav>
        </header>
        <% Usuario usuarioSesion = (session != null && session.getAttribute("usuario") != null) ? (Usuario) session.getAttribute("usuario") : null;%>
        <main>
            <section class="titulo-main">
                <h2 class="tit">Cesta de <%= usuarioSesion.getNombreCompleto()%></h2>
                <figure class="cesta">
                    <img src="./img/cesta.png" alt="cesta">
                </figure> 
            </section>
            <%
                CestaDAO cesta = new CestaDAO();
                ArrayList<Lineacesta> lineas = cesta.getLineas(usuarioSesion.getEmail(), usuarioSesion.getCodigo());
            %>
            <section class="product-detail">

                <div class="my-order-content">
                    <% double acumulado = 0;%>
                    <% for (Lineacesta linea : lineas) {%>
                    <div class="shopping-cart">
                        <% String foto = linea.getArticulo().getFoto(); %>
                        <%
                            if (foto == null) {
                        %>
                        <figure>
                            <img src="./img/sopa.png" alt="Foto del artículo">
                        </figure>
                        <%
                        } else {
                        %>
                        <figure>
                            <img src="<%= linea.getArticulo().getFoto()%>" alt="Foto del artículo">
                        </figure>
                        <%
                            }
                        %>
                        <p class="nom"><%= linea.getArticulo().getNombre()%></p>
                        <p class="prec"><%= linea.getArticulo().getPvp()%></p>
                        <% acumulado += linea.getArticulo().getPvp(); %>
                        <p class="cant"><%= linea.getCantidad()%></p>
                    </div>
                    <% }%>
                    <div>
                        <p class="total"><strong>TOTAL:</strong><%= acumulado %> </p>
                    </div>
                    <input class="primary-button" type="submit" value="Procesar el pago"></input>
                </div>
                </div>
            </section>
        </main>
        <footer class="pie">
            <footer class="footer-distributed">
                <div class="footer-right">
                    <a href="#"><i class="fa fa-facebook"></i></a>
                    <a href="#"><i class="fa fa-twitter"></i></a>
                    <a href="#"><i class="fa fa-linkedin"></i></a>
                    <a href="https://github.com/JoseRaulYSamuel"><i class="fa fa-github"></i></a>
                </div>

                <div class="footer-left">
                    <p class="footer-links">
                        <a class="link-1" href="./index.jsp">Inicio</a>
                        <a href="./privacidad.html#derechos">Derechos de uso</a>
                        <a href="./privacidad.html#politica">Política de privacidad</a>
                        <a href="./sobrenosotros.jsp">Sobre nosotros</a>
                        <a href="./contacto.jsp">Contacto</a>
                        <a href="#">Subir</a>
                    </p>
                    <p>&copy; 2023 Jose Raul Herrero Alarcon y Samuel Hernandez Perez</p>
                </div>

            </footer>
        </footer>
    </body>
</html>
