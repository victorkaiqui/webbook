<%@ page import="br.com.webbook.User" %>

<div>
  <g:textField name="name" maxlength="15" required="" value="${userInstance?.name}" class="input-big" placeholder="${message(code: 'user.name.label', default: 'name')}"/>
</div>

<div>
  <g:textField name="lastName" maxlength="15" required="" value="${userInstance?.lastName}" class="input-big" placeholder="${message(code: 'user.lastName.label', default: 'lastName')}"/>
</div>

<div>
  <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
</div>

<div> 
  <g:field type="email" name="email" required="" value="${userInstance?.email}" class="input-big" placeholder="${message(code: 'user.email.label', default: 'email')}"/>
</div>

<div>
  <g:field type="password" name="password" required="" value="${userInstance?.password}" class="input-big" placeholder="${message(code: 'user.password.label', default: 'pasword')}"/>
</div>

<div> 
  <g:datePicker name="birthyday" widget="datePicker" precision="day"  value="${userInstance?.birthyday}" class="input-big" placeholder="${message(code: 'user.birthyday.label', default: 'birthyday')}"/>
</div>


