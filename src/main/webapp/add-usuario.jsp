<%@page import="com.crud.teste.pitang.dao.UsuarioDao"%>
<jsp:useBean id="u" class="com.crud.teste.pitang.domain.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>


<%
	int i = UsuarioDao.salvarUsuario(u);
	
	if(i > 0){
		response.sendRedirect("add-usuario-sucess.jsp");
	}else{
		response.sendRedirect("add-usuario-error.jsp");
	}
%>