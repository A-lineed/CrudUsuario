<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Visualiza??o dos usu?rios</title>
</head>
<body>
	<%@ page
		import="com.crud.teste.pitang.dao.UsuarioDao , com.crud.teste.pitang.domain.* , java.util.*"%>
	<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Listagem de Usu?rios</h1>

	<%
	String usuario = (String) session.getAttribute("usuario");
	if (usuario == null) {
		response.sendRedirect("index.jsp");
	} else {
		out.print("Bem vinde, " + usuario + " aqui voc? pode cadastrar, editar e excluir um usu?rio.<br/>");
	}
	%>

<br/>
	<%
	List<Usuario> list = UsuarioDao.getAllUsuarios();
	request.setAttribute("list", list);
	%>


	<table border="1">
		<tr>
			<th>Id</th>
			<th>Nome</th>
			<th>Email</th>
			<th>Senha</th>
			<th>DDD</th>
			<th>Numero</th>
			<th>Tipo</th>
			<th>Alterar</th>
			<th>Remover</th>
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
				<td><a href="editar-form.jsp?id=${usuario.getId()}">Alterar</a></td>
				<td><a href="delete-usuario.jsp?id=${usuario.getId()}">Remover</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<button><a href="add-usuario-form.jsp">Incluir usu?rio</a></button>
	<button><a href="deslogar.jsp">Deslogar</a></button>
</body>
</html>