<%@ page import="br.com.webbook.User" %>

<div class="control-group">
  <div  class="control-label" >
    <g:message code="user.username.label"/>
  </div>
  <div class="controls">
    <g:textField name="username" maxlength="15" required=""  value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
  </div>
</div>

<div class="control-group">
  <div  class="control-label">
    <g:message code="user.email.label"/>
  </div>
  <div class="controls">
    <g:field type="email" name="email" required="" value="${userInstance?.email}" class="input-big" placeholder="${message(code: 'user.email.label', default: 'email')}"/>
  </div>
</div>

