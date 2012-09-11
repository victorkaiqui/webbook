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


  <script type='text/javascript'>
          <!--
          (function() {
                  document.forms['loginForm'].elements['j_username'].focus();
          })();
          // -->
  </script>
</body>
</html>

