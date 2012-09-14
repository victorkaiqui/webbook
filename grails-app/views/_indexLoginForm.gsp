
<div>
  <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
</div>

<div>
  <g:field type="password" name="password" required="" value="${userInstance?.password}" class="input-big" placeholder="${message(code: 'user.password.label', default: 'password')}"/>
</div>

<div>
  <g:field  type='checkbox'  name='checkbox' class="checkbox"/> 
  <small><g:message code="springSecurity.login.remember.me.label"/> - </small>
  <small><a href="">Esqueceu a Senha?</a></small>
</div>

