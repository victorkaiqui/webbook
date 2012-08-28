
<%@ page import="br.com.webbook.Bookmark" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bookmark.label', default: 'Bookmark')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bookmark" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bookmark" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bookmark">
			
				<g:if test="${bookmarkInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="bookmark.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${bookmarkInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookmarkInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="bookmark.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${bookmarkInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookmarkInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="bookmark.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${bookmarkInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookmarkInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="bookmark.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${bookmarkInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookmarkInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="bookmark.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${bookmarkInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookmarkInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="bookmark.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${bookmarkInstance?.user?.id}">${bookmarkInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookmarkInstance?.visibility}">
				<li class="fieldcontain">
					<span id="visibility-label" class="property-label"><g:message code="bookmark.visibility.label" default="Visibility" /></span>
					
						<span class="property-value" aria-labelledby="visibility-label"><g:formatBoolean boolean="${bookmarkInstance?.visibility}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bookmarkInstance?.id}" />
					<g:link class="edit" action="edit" id="${bookmarkInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
