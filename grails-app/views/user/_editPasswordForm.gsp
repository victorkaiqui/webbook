<%@ page import="br.com.webbook.User" %>

<div class="control-group">
  <div  class="control-label" >
    <g:message code="my.text.form.edit.password.atual"/>
  </div>
  <div class="controls">
    <g:field type="password" name="password" maxlength="15" required="" class="input-big" placeholder="${message(code: 'my.text.form.edit.password.atual', default: 'password')}"/>
  </div>
</div>

<div class="control-group">
  <div  class="control-label" >
    <g:message code="my.text.form.edit.password.novo"/>
  </div>
  <div class="controls">
    <g:field type="password" name="newPassword" maxlength="15" required=""  class="input-big" placeholder="${message(code: 'my.text.form.edit.password.novo', default: 'password')}"/>
  </div>
</div>

<div class="control-group">
  <div  class="control-label" >
    <g:message code="my.text.form.edit.password.comfirma"/>
  </div>
  <div class="controls">
    <g:field  type="password" name="confirmPassword" maxlength="15" required=""  class="input-big" placeholder="${message(code: 'my.text.form.edit.password.comfirma', default: 'password')}"/>
  </div>
</div>




