<%@ page import="br.com.webbook.User" %>

<div class="control-group">
  <div  class="control-label">
    Avatar:
  </div>
  <div class="control-label">
    <a href="https://pt.gravatar.com/">Altere seu avatar</a>
  </div>
</div>

<div class="control-group">  
  <div  class="control-label" >
    <g:message  code="user.name.label"/>
  </div>
  <div class="controls" >
    <g:textField name="name" maxlength="15" value="${userInstance?.name}" class="input-big" placeholder="${message(code: 'user.name.label', default: 'name')}"/>
    <p class="muted">Digite seu nome verdadeiro, para que as pessoas possam te reconhecer</p>
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
  <div  class="control-label">
    <g:message code="user.location.label"/>
  </div>
  <div class="controls">
    <g:textField name="location" maxlength="15"  value="${userInstance?.location}" class="input-big" placeholder="${message(code: 'user.location.label', default: 'location')}"/>
    <p class="muted">Em que lugar do mundo você está?</p>
  </div>
</div>

<div class="control-group">
  <div  class="control-label">
    <g:message code="user.description.label"/>
  </div>
  <div class="controls">
    <g:textArea name="description" maxlength="160"  value="${userInstance?.description}" class="input-big" placeholder="${message(code: 'user.description.label', default: 'description')}"/>
    <p class="muted">Fale sobre você em 160 caracteres ou menos.</p>
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

