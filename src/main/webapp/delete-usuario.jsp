<%@page import="com.crud.teste.pitang.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crud.teste.pitang.domain.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<%
UsuarioDao.deletarUsuario(u);
response.sendRedirect("view-usuarios.jsp");

%>