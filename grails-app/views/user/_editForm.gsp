<%@ page import="br.com.webbook.User" %>

<div class="control-group">  
  <div  class="control-label" >
    <g:message  code="user.name.label"/>
  </div>
  <div class="controls" >
    <g:textField name="name" maxlength="15" value="${userInstance?.name}" class="input-big" placeholder="${message(code: 'user.name.label', default: 'name')}"/>
  </div>
</div>

<div class="control-group">
  <div  class="control-label">
    <g:message code="user.lastName.label"/>
  </div>
  <div class="controls">
    <g:textField name="lastName" maxlength="15"  value="${userInstance?.lastName}" class="input-big" placeholder="${message(code: 'user.lastName.label', default: 'lastName')}"/>
  </div>
</div>

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

<div class="control-group">
  <div  class="control-label">
    <g:message code="user.birthyday.label"/> 
  </div>
  <div class="controls">   
    <g:datePicker name="birthyday" widget="datePicker" precision="day" id="inputBirthyday" value="${userInstance?.birthyday}" class="span2" placeholder="${message(code: 'user.birthyday.label', default: 'birthyday')}"/>
  </div>
</div>

