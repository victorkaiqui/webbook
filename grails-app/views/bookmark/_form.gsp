<%@ page import="br.com.webbook.Bookmark" %>
<div class="control-group">
  <div  class="control-label">
    <label>Título</label>
  </div>
  <g:textField id="title" name="title" value="${bookmarkInstance?.title}" class="input-xlarge" placeholder="Título"/>  
</div>
<div class="control-group">
  <div  class="control-label">
    <label>Url</label>
  </div>
  <g:textField id="url" name="url" required="" value="${bookmarkInstance?.url}" class="input-xlarge" placeholder="${message(code: 'bookmark.url.label', default: 'url')}"/>
</div>
<div class="control-group">
  <div  class="control-label">
    <label>Descrição</label>
  </div>
  <g:textArea id="description" name="description"  value="${bookmarkInstance?.description}" class="input-xlarge" placeholder="${message(code: 'bookmark.description.label', default: 'description')}"/>
  <span class="help-block"><small>Se quiser informa uma descrição com o máximo de 140 caracteres</small></label>
</div> 
<div class="control-group">
  <div  class="control-label">
    <label>Tags</label>
  </div>
  <g:textField id="tags" name="tags"  value="${bookmarkInstance?.tags}" class="input-xlarge" placeholder="${message(code: 'bookmark.tags.label', default: 'tags')}"/>
  <span class="help-block"><small>Tag são palavras chaves, informe quantas quiser separadas por vírgula</small></label>
</div>
<div>
  <label>
    <g:checkBox id="visibility" name="visibility" value="${bookmarkInstance?.visibility}"/>
    <g:message code="bookmark.visibility.label" default="Privado" /><i class="icon-lock"></i>
  </label>
</div>