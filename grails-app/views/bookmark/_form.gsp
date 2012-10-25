<%@ page import="br.com.webbook.Bookmark" %>

<div>
  <g:textField id="url" name="url" required="" value="${bookmarkInstance?.url}" class="input-big" placeholder="${message(code: 'bookmark.url.label', default: 'url')}"/>
</div>
<div>
  <g:textField id="title" name="title" value="${bookmarkInstance?.title}" class="input-big" placeholder="${message(code: 'bookmark.title.label', default: 'title')}"/>
</div>
<div>
  <g:textArea id="description" name="description"  value="${bookmarkInstance?.description}" class="input-big" placeholder="${message(code: 'bookmark.description.label', default: 'description')}"/>
</div> 
<div>
  <g:textField id="tags" name="tags"  value="${bookmarkInstance?.tags}" class="input-big" placeholder="${message(code: 'bookmark.tags.label', default: 'tags')}"/>
</div>
<div>
  <label>
    <g:checkBox id="visibility" name="visibility" value="${bookmarkInstance?.visibility}"/>
    <i class="icon-lock"></i><g:message code="bookmark.visibility.label" default="Privado" />
  </label>
</div>