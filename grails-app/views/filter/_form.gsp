<%@ page import="br.com.webbook.Filter" %>



<div class="fieldcontain ${hasErrors(bean: filterInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="filter.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${filterInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: filterInstance, field: 'users', 'error')} required">
	<label for="users">
		<g:message code="filter.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="users" name="users.id" from="${br.com.webbook.User.list()}" optionKey="id" required="" value="${filterInstance?.users?.id}" class="many-to-one"/>
</div>

