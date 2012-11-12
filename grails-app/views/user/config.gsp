<!doctype html>
<html>
  <head>
    <meta name="layout" content="main">
  </head>
  <body>

    <div class="row-fluid">

      <div class="span12">

        <h3><sec:loggedInUserInfo field="username"/></h3>

        <div class="row-fluid">
          <div class="span2">

            <ul class="nav nav-pills nav-stacked" id="tabs-menu">           
              <li class="active"><a class="list-link js-nav" href="#account"> <g:message code="my.text.config.conta"/> <i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="#password">  <g:message code="my.text.config.senha"/> <i class="chev-right"></i></a></li>
              <li class=""><a class="list-link js-nav" href="#profile" data-nav="profile"><g:message code="my.text.config.perfil"/> <i class="chev-right"></i></a></li>
            </ul>

          </div>

          <div class="span10">

            <div class="tab-content">

              <!--conta-->
              <div class="tab-pane active" id="account">

                <div class="row-fluid">                
                  <div class="span8 offset1">

                    <h3><g:message code="my.text.form.edit.conta" /></h3>           
                    <h5><p class="muted"><g:message code="my.text.form.edit.conta.conteudo" /> </p></h5>   
                    <hr>

                    <div class="row-fluid">  
                      <div class="span8 offset1">

                        <g:hasErrors bean="${userInstance}">
                          <ul class="alert alert-block">
                            <g:eachError bean="${userInstance}" var="error">
                              <li>
                              <g:message error="${error}"/>
                              </li>
                            </g:eachError>
                          </ul>
                        </g:hasErrors>

                        <g:form method="post" class="form-horizontal">                           
                          <fieldset>        
                            <g:render template="editAccountForm"/>              
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


              <!--Profile-->
              <div class="tab-pane" id="profile">

                <div class="row-fluid">                
                  <div class="span8 offset1">

                    <h3>Perfil</h3>           
                    <h5><p class="muted">Altere a configuração do seu perfil</p></h5>   
                    <hr>

                    <div class="row-fluid">  
                      <div class="span8 offset1">

                        <g:hasErrors bean="${userInstance}">
                          <ul class="alert alert-block">
                            <g:eachError bean="${userInstance}" var="error">
                              <li>
                              <g:message error="${error}"/>
                              </li>
                            </g:eachError>
                          </ul>
                        </g:hasErrors>

                        <g:form method="post" class="form-horizontal"> 

                          <fieldset>        
                            <g:render template="editProfileForm"/>              
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


              <!--password-->
              <div class="tab-pane" id="password">

                <div class="row-fluid">                
                  <div class="span8 offset1">

                    <h3>Senha</h3>           
                    <h5><p class="muted">Altere sua senha</p></h5>   
                    <hr>

                    <div class="row-fluid">  
                      <div class="span8 offset1">

                        <g:hasErrors bean="${userInstance}">
                          <ul class="alert alert-block">
                            <g:eachError bean="${userInstance}" var="error">
                              <li>
                              <g:message error="${error}"/>
                              </li>
                            </g:eachError>
                          </ul>
                        </g:hasErrors>

                        <g:form method="post" class="form-horizontal"> 
                          <fieldset>        
                            <g:render template="editPasswordForm"/>              
                          </fieldset>
                          <fieldset>
                            <hr>
                            <div class="control-group">
                              <div class="controls">   
                                <g:actionSubmit class="btn btn-info btn-large" action="editPassword" controller="user" value="${message(code: 'default.button.update.label', default: 'Update')}" />
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
