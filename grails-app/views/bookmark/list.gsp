
<%@ page import="br.com.webbook.Bookmark" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookmark.label', default: 'Bookmark')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bookmark" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bookmark" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'bookmark.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'bookmark.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'bookmark.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'bookmark.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'bookmark.url.label', default: 'Url')}" />
					
						<th><g:message code="bookmark.user.label" default="User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookmarkInstanceList}" status="i" var="bookmarkInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bookmarkInstance.id}">${fieldValue(bean: bookmarkInstance, field: "dateCreated")}</g:link></td>
					
						<td>${fieldValue(bean: bookmarkInstance, field: "description")}</td>
					
						<td><g:formatDate date="${bookmarkInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: bookmarkInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: bookmarkInstance, field: "url")}</td>
					
						<td>${fieldValue(bean: bookmarkInstance, field: "user")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookmarkInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
