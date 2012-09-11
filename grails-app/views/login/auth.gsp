<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>
  </head>
  <body>

  <g:if test='${flash.message}'>
    <div >${flash.message}</div>
  </g:if>

  <g:form url="[action:'auth', controller:'login']">
    <fieldset>
      <g:render template="/indexLoginForm"/>
      <g:submitButton name="login" value="${message(code: 'default.button.login.label', default: 'Login')}" class="btn btn-warning btn-large"/>
      <!--            <facebookAuth:connect permissions="email,user_about_me"/>-->
    </fieldset>
  </g:form>
  <script type='text/javascript'>
          <!--
          (function() {
                  document.forms['loginForm'].elements['j_username'].focus();
          })();
          // -->
  </script>
</body>
</html>

