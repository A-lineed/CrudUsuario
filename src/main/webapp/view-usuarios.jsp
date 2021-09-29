<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualiza��o de Usu�rios</title>
</head>
<body>
	<%@ page
		import="com.crud.teste.pitang.dao.UsuarioDao , com.crud.teste.pitang.domain.* , java.util.*"%>
	<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Listagem de Usu�rios</h1>

	<%
	List<Usuario> list = UsuarioDao.getAllUsuarios();
	request.setAttribute("list", list);
	%>

	<table border="1">
		<tr>
			<th>Id</th><th>Nome</th><th>Email</th><th>Senha</th><th>DDD</th><th>Numero</th><th>Tipo</th>
		</tr>

		<c:forEach items="${list}" var="usuario">
			<tr>
				<td>${usuario.getId()}</td>
				<td>${usuario.getNome()}</td>
				<td>${usuario.getEmail()}</td>
				<td>${usuario.getSenha()}</td>
				<td>${usuario.getDdd()}</td>
				<td>${usuario.getNumero()}</td>
				<td>${usuario.getTipo()}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>