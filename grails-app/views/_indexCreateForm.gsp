<%@ page import="br.com.webbook.User" %>

<div>             
  <g:textField name="username" maxlength="15"  value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
</div>            
<div>
  <g:field type="email" name="email"  value="${userInstance?.email}" class="input-big" placeholder="${message(code: 'user.email.label', default: 'email')}"/>
</div>
<div>
  <g:field type="password" name="password"  value="${userInstance?.password}" class="input-big" placeholder="${message(code: 'user.password.label', default: 'password')}"/>
</div> 

