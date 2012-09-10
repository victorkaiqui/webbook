<%@ page import="br.com.webbook.User" %>
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
        <section>
          <h1><g:message code="my.text.index.label"/></h1>

          <g:form url="[action:'save', controller:'user']">
            <fieldset>
              <g:render template="/indexCreateForm"/>
              <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
            </fieldset>
          </g:form>
        </section>
      </div>

    </div>

  </sec:ifNotLoggedIn>

</body>
</html>
