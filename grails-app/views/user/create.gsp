<%@ page import="br.com.webbook.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">  
    <title><g:message code="user.create.label" /></title>
  </head>
  <body>

  <g:hasErrors bean="${userInstance}">
    <ul class="errors" role="alert">
      <g:eachError bean="${userInstance}" var="error">
        <li class="text-warning">
<!--        <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>-->
        <g:message error="${error}"/>
        </li>
      </g:eachError>
    </ul>
  </g:hasErrors>

  <div class="row">
    <div class="span8 offset2" style="border: 1px solid gainsboro">
      <div class="row">
        <div class="span4 offset2">

          <h3><g:message code="user.create.label" /></h3>

          <g:form action="save">
            <fieldset>
              <g:render template="form"/>
            </fieldset>
            <fieldset>
              <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large" />
            </fieldset>
          </g:form>

        </div>
      </div>
    </div>
  </div>

</body>
</html>
