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

      <div class="thumbnail span12">

        <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="56" defaultGravatarUrl="mm"/>
        <span class="help-inline">
          <h1 class="fullname">${user.username}</h1>
        </span>

        Favoritos
${bookmarkInstanceTotal}
        Seguindo
${user.followings.size()}
        Seguidores
${user.followers.size()}

        <g:form url="[action:'follow', controller:'user']">

          <g:hiddenField name="username" value="${user.username}" />
          <g:if test="${user.username != userInstance.username}">
            <g:if test="${isFollowing}">
              <g:submitButton name="segir" value="Seguir" class="btn btn-small btn-danger"/>           
            </g:if>
            <g:else>
              <g:submitButton name="segir" value="Seguir" class="btn btn-small btn-success"/>            
            </g:else>
          </g:if>
        </g:form>

      </div>

      <div class="row-fluid">

        <div span="8" >
          <g:each var="followed" in="${userInstance.followings}">
            <p>${followed.followed.username}</p>
          </g:each>
        </div>

      </div>
    </div>
  </body>
</html>
