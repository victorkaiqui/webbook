<%@ page import="br.com.webbook.Bookmark" %>



<div class="fieldcontain ${hasErrors(bean: bookmarkInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="bookmark.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${bookmarkInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookmarkInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="bookmark.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${bookmarkInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookmarkInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="bookmark.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${bookmarkInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookmarkInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="bookmark.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${br.com.webbook.User.list()}" optionKey="id" required="" value="${bookmarkInstance?.user?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookmarkInstance, field: 'visibility', 'error')} ">
	<label for="visibility">
		<g:message code="bookmark.visibility.label" default="Visibility" />
		
	</label>
	<g:checkBox name="visibility" value="${bookmarkInstance?.visibility}" />
</div>

