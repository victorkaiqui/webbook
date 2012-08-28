<%@ page import="br.com.webbook.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'text', 'error')} required">
	<label for="text">
		<g:message code="comment.text.label" default="Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="text" cols="40" rows="5" maxlength="140" required="" value="${commentInstance?.text}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'bookmark', 'error')} required">
	<label for="bookmark">
		<g:message code="comment.bookmark.label" default="Bookmark" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bookmark" name="bookmark.id" from="${br.com.webbook.Bookmark.list()}" optionKey="id" required="" value="${commentInstance?.bookmark?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="comment.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${br.com.webbook.User.list()}" optionKey="id" required="" value="${commentInstance?.user?.id}" class="many-to-one"/>
</div>

