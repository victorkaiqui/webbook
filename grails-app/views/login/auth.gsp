<html>
  <head>
    <meta name='layout' content='main'/>
    <title><g:message code="springSecurity.login.title"/></title>

  </head>

  <body>

    <div class="row">
      <div class="span8 offset2" style="border: 1px solid gainsboro">

        <div class="row">

          <div class="span4 offset2">

            <h3><g:message code="springSecurity.login.header"/></h3>

            <g:if test='${flash.message}' class="text-warning">

              <div>${flash.message}</div>

            </g:if>

            <g:form url="[controller:'j_spring_security_check', action:'']" >

              <fieldset>

                <g:render template="/login/form"/>

                <g:submitButton name="login" value="${message(code: 'default.button.login.label', default: 'Login')}" class="btn btn-warning btn-large"/>      

              </fieldset>
            </g:form>



          </div>

        </div>

      </div>

    </div>
  </body>
</html>
