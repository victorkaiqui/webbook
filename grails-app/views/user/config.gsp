
<%@ page import="br.com.webbook.User" %>
<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  </head>
  <body>

    <div class="row-fluid">

      <div class="span12">

        <sec:loggedInUserInfo field="username"/>

        <div class="row-fluid">
          <div class="span2">
            <div class="module">

              <ul class="nav nav-pills nav-stacked">
                <li class="active"><a class="list-link js-nav" href="#conta"> Conta <i class="chev-right"></i></a></li>
                <li class=""><a class="list-link js-nav" href="#senha">Senha<i class="chev-right"></i></a></li>
                <li class=""><a class="list-link js-nav" href="/settings/devices" data-nav="devices">Celular <i class="chev-right"></i></a></li>
                <li class=""><a class="list-link js-nav" href="/settings/notifications" data-nav="notifications">Notificações por e-mail <i class="chev-right"></i></a></li>
                <li class=""><a class="list-link js-nav" href="/settings/profile" data-nav="profile">Perfil <i class="chev-right"></i></a></li>
              </ul>

            </div>          
          </div>

          <div class="span10">

            <div id="list-user" class="content scaffold-list" role="main">

              <div class="tab-pane active" id="conta">

                <div class="row-fluid">                
                  <div class="span8 offset1">

                    <h3><g:message code="my.text.form.edit.conta" /></h3>           
                    <h5><p class="muted"><g:message code="my.text.form.edit.conta.conteudo" /> </p></h5>   
                    <hr>

                    <div class="row-fluid">  
                      <div class="span8 offset1">

                        <g:hasErrors bean="${userInstance}">
                          <ul class="errors" role="alert">
                            <g:eachError bean="${userInstance}" var="error">
                              <li class="text-warning">
                              <g:message error="${error}"/>
                              </li>
                            </g:eachError>
                          </ul>
                        </g:hasErrors>

                        <g:form method="post" class="form-horizontal"> 
                          <g:hiddenField name="id" value="${userInstance?.id}" />
                          <g:hiddenField name="version" value="${userInstance?.version}" />
                          <fieldset>        
                            <g:render template="editForm"/>              
                          </fieldset>
                          <fieldset>
                            <hr>
                            <div class="control-group">
                              <div class="controls">   
                                <g:actionSubmit class="btn btn-info btn-large" action="update" controller="user" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                              </div>
                            </div>
                            <hr>
                          </fieldset>
                        </g:form>

                      </div>
                    </div>
                    
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>

    <script>
  $(function () {
    $('#tabs-menu a').click(function (e) {
e.preventDefault();
$(this).tab('show');
})
})
</script>
</body>
</html>
