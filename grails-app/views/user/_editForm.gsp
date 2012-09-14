<%@ page import="br.com.webbook.User" %>

<div class="muted">
    <g:message code="user.name.label" />
    <g:textField name="name" maxlength="15" required="" value="${userInstance?.name}" class="input-big" placeholder="${message(code: 'user.name.label', default: 'name')}"/>
</div>

<div class="muted">
    <g:message code="user.lastName.label" />
  <g:textField name="lastName" maxlength="15" required="" value="${userInstance?.lastName}" class="input-big" placeholder="${message(code: 'user.lastName.label', default: 'lastName')}"/>
</div>

<div class="muted">
    <g:message code="user.username.label" />
  <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
</div>

<div class="muted">
    <g:message code="user.email.label" />
  <g:field type="email" name="email" required="" value="${userInstance?.email}" class="input-big" placeholder="${message(code: 'user.email.label', default: 'email')}"/>
</div>

<div class="muted">
    <g:message code="user.birthyday.label" /> 
  <g:datePicker name="birthyday" widget="datePicker" precision="day"  value="${userInstance?.birthyday}" class="span2" placeholder="${message(code: 'user.birthyday.label', default: 'birthyday')}"/>
</div>


