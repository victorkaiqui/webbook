<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
  </head>
  <body>

    <div class="grid_8 prefix_2 suffix_2" >
      <div class='fheader'><g:message code="springSecurity.login.header"/></div>

      <g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
      </g:if>
      <div class="wb-box-with-shadow popular-content" id="login-form-container">
        <g:if test='${flash.message}'>
          <div class='login_message'>${flash.message}</div>
        </g:if>
        <h3 class="wb-font-x-big">Faça seu Login</h3>
        <p class="wb-font-medium">Ainda não tem uma conta? <a href="">Cadastre-se</a></p>
        <form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
          <p>
            <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
            <input type='text' class='text_' name='j_username' id='username'/>
          </p>

          <p>
            <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
            <input type='password' class='text_' name='j_password' id='password'/>
          </p>

          <p id="remember_me_holder">
          <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
          <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
          </p>

          <p>
            <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
          </p>
        </form>
      </div>
    </div>
    <div class="clear"></div>
    <script type='text/javascript'>
            <!--
            (function() {
                    document.forms['loginForm'].elements['j_username'].focus();
            })();
            // -->
    </script>
  </body>
</html>

