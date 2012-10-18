<%@ page import="br.com.webbook.Bookmark" %>

<div>
  <g:textField name="url" required="" value="${bookmarkInstance?.url}" class="input-big" placeholder="${message(code: 'bookmark.url.label', default: 'url')}"/>
</div>
<div>
  <g:textField name="title" value="${bookmarkInstance?.title}" class="input-big" placeholder="${message(code: 'bookmark.title.label', default: 'title')}"/>
</div>
<div>
  <g:textArea name="description"  value="${bookmarkInstance?.description}" class="input-big" placeholder="${message(code: 'bookmark.description.label', default: 'description')}"/>
</div> 
<div>
  <g:textField name="tags"  value="${bookmarkInstance?.tags}" class="input-big" placeholder="${message(code: 'bookmark.tags.label', default: 'tags')}"/>
</div>
<div>
  <label>
    <g:checkBox name="visibility" value="${bookmarkInstance?.visibility}"/>
    <i class="icon-lock"></i><g:message code="bookmark.visibility.label" default="Privado" />
  </label>
</div>