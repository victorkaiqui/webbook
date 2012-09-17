<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
  <facebookAuth:init />
</head>
<body>

<sec:ifLoggedIn>

  <div class="container-fluid">  
    <div class="row-fluid"> 

      <div class="span12" >

        <h2><strong><sec:loggedInUserInfo field="username" /></strong></h2>

        <hr>        

      </div> 


      </sec:ifLoggedIn>

      <sec:ifNotLoggedIn>

        <div class="row">
          <div class="span4">
            <g:if test='${flash.message}'>
              <div >${flash.message}</div>
            </g:if>
            <section >
              <h3><g:message code="my.text.index.organize"/></h3>
              <p><g:message code="my.text.index.organize.conteudo"/></p>
            </section>
            <section >
              <h3><g:message code="my.text.index.encontre"/></h3>
              <p><g:message code="my.text.index.encontre.conteudo"/></p>
            </section>
            <section >
              <h3><g:message code="my.text.index.compartilhe"/></h3>
              <p><g:message code="my.text.index.compartilhe.conteudo"/></p>
            </section>
          </div>

          <div class="span8" >

            <section>

              <ul class="nav nav-tabs" id="tabs-menu">
                <li class="active"><a href="#login">Login</a></li>
                <li><a href="#cadastrar">Cadastrar</a></li>
              </ul>

              <div class="tab-content">
                <div class="tab-pane active" id="login">
                  <h3><g:message code="my.text.index.label"/></h3>

                  <g:form url="[controller:'j_spring_security_check', action:'']">
                    <fieldset>
                      <g:render template="/login/form"/>
                      <g:submitButton name="login" value="${message(code: 'default.button.login.label', default: 'Login')}" class="btn btn btn-info btn-large"/>
                      <facebookAuth:connect permissions="email,user_about_me"/>
                    </fieldset>
                  </g:form>

                </div>

                <div class="tab-pane" id="cadastrar">
                  <h3><g:message code="my.text.index.cadastro"/></h3>

                  <g:form url="[action:'save', controller:'user']">
                    <fieldset>
                      <g:render template="/indexCreateForm" />
                      <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
                    </fieldset>
                  </g:form>

                </div>

            </section>

          </div>

        </div>



      </sec:ifNotLoggedIn>
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
