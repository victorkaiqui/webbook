<%@ page import="br.com.webbook.Bookmark" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">  
  </head>
  <body>
    <div class="row-fluid">
      <div class="span4">
      </div>   
      <div class="span4">   
        <g:if test="${flash.message}">
          <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${bookmarkInstance}">
          <ul class="errors" role="alert">
            <g:eachError bean="${bookmarkInstance}" var="error">
              <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
            </g:eachError>
          </ul>
        </g:hasErrors>
        <g:form method="post" >
          <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
          <g:hiddenField name="version" value="${bookmarkInstance?.version}" />
          <fieldset class="form">
            <g:render template="form"/>
          </fieldset>
          <br>
          <fieldset class="buttons">
            <g:actionSubmit class="btn btn-info" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
            <g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
          </fieldset>
        </g:form>
      </div>
    </div>

  </body>
  <script>
    $(document).ready(function(){
   $("#tags").tagsInput({
    'defaultText':'Adicione tags',
    'height':'1px',
    'width':'265px',
    'placeholderColor' :'#B8B8B8'
  });
  })
  </script>
</html>
