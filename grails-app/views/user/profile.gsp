<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>

  </head>
  <body>

    <div class="row-fluid">

      <div span="12">

        <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="56" defaultGravatarUrl="mm"/>
        <span class="help-inline">
          <h1 class="fullname">${user.username}</h1>
        </span>

        <g:form url="[action:'follow', controller:'user']">
          <g:hiddenField name="username" value="${user.username}" />
          <g:submitButton name="segir" value="Seguir" class="btn btn-small btn-success"/>
        </g:form>

      </div>

      <div span="8" >

      </div>
    </div>

  </body>
</html>
