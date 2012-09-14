<html>
  <head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>

  </head>

  <body>

  <g:message code="springSecurity.login.header"/>

  <g:if test='${flash.message}'>
    <div class='login_message'>${flash.message}</div>
  </g:if>

  <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>

    <div>
      <g:textField  name='j_username' maxlength="15" required="" value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
    </div>

    <div>
      <g:field type="password" name='j_password'" required="" value="${userInstance?.password}" class="input-big" placeholder="${message(code: 'user.password.label', default: 'password')}"/>
    </div>

    <div>
      <g:field type='checkbox'  name='${rememberMeParameter}'  /><g:if test='${hasCookie}'>checked='checked'</g:if>
      <small><g:message code="springSecurity.login.remember.me.label"/> - </small>
      <small><a href="">Esqueceu a Senha?</a></small>
    </div>


    <div>
      <g:submitButton  name="login" value='${message(code: "springSecurity.login.button")}' class="btn btn-warning btn-large"/>
    </div>
  </form>

  <script type='text/javascript'>
          <!--
          (function() {
                  document.forms['loginForm'].elements['j_username'].focus();
          })();
          // -->
  </script>
</body>
</html>
