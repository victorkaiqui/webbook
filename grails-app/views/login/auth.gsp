<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
  </head>
  <body>
    <div id='login'>
      <div class='inner'>

        <g:if test='${flash.message}'>
          <div class='login_message'>${flash.message}</div>
        </g:if>

        <div class="grid_8 prefix_2 suffix_2" >
          <div class="wb-box-with-shadow popular-content" id="login-form-container">
            <div class='fheader'><g:message code="springSecurity.login.header"/></div>
            <p class="wb-font-medium">Ainda não tem uma conta? <a href="">Cadastre-se</a></p>
            <form action='${postUrl}' method='POST' id='login-form' autocomplete='off'>
              <div class="field-block">
                <div class="field-title">
                  <label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
                </div>
                <div class="field-input">
                  <input type='text' class='text_' name='j_username' id='username'/>
                </div>
              </div>

              <div class="field-block">
                <div class="field-title">
                  <label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
                </div>
                <div class="field-input">
                  <input type='password' class='text_' name='j_password' id='password'/>
                </div>
                <span class="wb-font-medium"><a href="">Esqueceu a Senha?</a></span>
              </div>

              <div class="field-block">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
              </div>
              <div class="controls">
                <div class="control">
                  <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
                </div>
                <span class="wb-font-medium"></span>
              </div>
            </form>
          </div>
        </div>
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

