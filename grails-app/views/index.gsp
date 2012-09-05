<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
  </head>
  <body>

  <sec:ifLoggedIn>

    <div id="page-body" role="main">
      <div id="controller-list" role="navigation" >
        <ul>
          <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
          </g:each>
        </ul>
      </div>
    </div>

  </sec:ifLoggedIn>

  <sec:ifNotLoggedIn>
    <div class="row">
      <div class="span4">
        <section >
          <h3><g:message code="my.text.index.organize"/></h3>
          <p><g:message code="my.text.index.organize.conteudo"/></p>
        </section>
        <section >
          <h3><g:message code="my.text.index.encontre"/></h3>
          <p><g:message code="my.text.index.organize.conteudo"/></p>
        </section>
        <section >
          <h3><g:message code="my.text.index.compartilhe"/></h3>
          <p><g:message code="my.text.index.compartilhe.conteudo"/></p>
        </section>
      </div>
      <div class="span8" >

        <h1><g:message code="my.text.index.label"/></h1>

        <form action="user/save" id="login-form" method="POST">
          <div>                         
            <g:textField name="name" maxlength="15" required="" type="text"  value="${userInstance?.name}" class="input-big" placeholder="${message(code: 'user.name.label', default: 'name')}"/>
          </div>
          <div>
            <g:textField name="lastName" maxlength="15" required="" value="${userInstance?.lastName}" class="input-big" placeholder="${message(code: 'user.lastName.label', default: 'lastName')}"/>
          </div>
          <div>             
            <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}" class="input-big" placeholder="${message(code: 'user.username.label', default: 'username')}"/>
          </div>            
          <div>
            <g:field type="email" name="email" required="" value="${userInstance?.email}" class="input-big" placeholder="${message(code: 'user.email.label', default: 'email')}"/>
          </div>
          <div>
            <g:field type="password" name="password" required="" value="${userInstance?.password}" class="input-big" placeholder="${message(code: 'user.password.label', default: 'password')}"/>
          </div> 
          <span><g:message code="my.text.index.termo" args="${ ['<a href="#">', '</a>'] }" /></span>
          <div>
            <fieldset>              
              <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
            </fieldset>            
        </form>
      </div>
    </div>
  </div>

</sec:ifNotLoggedIn>

</body>
</html>
