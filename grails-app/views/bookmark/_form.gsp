<%@ page import="br.com.webbook.Bookmark" %>


<div>
  <g:textField name="description"  value="${bookmarkInstance?.description}" class="input-big" placeholder="${message(code: 'bookmark.description.label', default: 'description')}"/>
</div>
<div>
  <g:textField name="title" value="${bookmarkInstance?.title}" class="input-big" placeholder="${message(code: 'bookmark.title.label', default: 'title')}"/>
</div>
<div>
  <g:textField name="url"  value="${bookmarkInstance?.url}" class="input-big" placeholder="${message(code: 'bookmark.url.label', default: 'url')}"/>
</div>
<div>
  <g:textField name="tags"  value="${bookmarkInstance?.tags}" class="input-big" placeholder="${message(code: 'bookmark.tags.label', default: 'tags')}"/>
</div>
<div>
  <label>
    <g:message code="bookmark.user.label" default="User" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="user" name="user.id" from="${br.com.webbook.User.list()}" optionKey="id" required="" value="${bookmarkInstance?.user?.id}" class="many-to-one"/>
  </div>
<div>
  <label>
    <g:checkBox name="visibility" value="${bookmarkInstance?.visibility}"/>
    <g:message code="bookmark.visibility.label" default="visibility" />
  </label>
</div>