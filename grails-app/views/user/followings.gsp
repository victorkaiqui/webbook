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
    <div class="container-fluid">
      <div class="row-fluid thumbnail" style="background: white">

        <div class="span1">
          <avatar:gravatar email="${user.email}"  cssClass="img-circle" size="56" defaultGravatarUrl="mm"/>
        </div>
        <div class="span9">
          <div class="row-fluid">
            <h2 class="fullname" style="margin-bottom: 0px">${user.name}</h2>
          </div>
          <div class="row-fluid">
            <h3 class="fullname" style="margin-top: 0px"><a class="muted">${user.username}</a></h3>
          </div>
        </div>
        <div class="span2">
          <div class="row-fluid">

            <b>${bookmarkInstanceTotal}</b>
            <a class="muted"> Favoritos</a>

          </div>
          <div class="row-fluid">

            <b>${user.followings.size()}</b>
            <a class="muted">Seguindo</a>

          </div>
          <div class="row-fluid">

            <b>${user.followers.size()}</b>
            <a class="muted">Seguidores</a>

          </div>
        </div>

      </div>
      <h1>Seguindo</h1>
      <hr>

      <g:each in="${followings}" var="following">
        <div class="row-fluid thumbnail" style="background: whitesmoke">

          <div class="span1">
            <avatar:gravatar email="${following.email}"  cssClass="img-circle" size="56" defaultGravatarUrl="mm"/>
          </div>
          <div class="span9">

            <div class="row-fluid">
              <a href="${request.contextPath}/${following.username}">
                <h2 style="margin-bottom: 0px"><a class="muted">${following.username}</a></h2>
              </a>
            </div>

            <div class="row-fluid">
              <h3 style="margin-top: 0px">${following.name}</h3>
            </div>

          </div>
          <div class="span2">
            <div class="row-fluid">

              <b>${bookmarkInstanceTotal}</b>
              <a class="muted"> Favoritos</a>

            </div>
            <div class="row-fluid">

              <b>${following.followings.size()}</b>
              <a class="muted">Seguindo</a>

            </div>
            <div class="row-fluid">

              <b>${following.followers.size()}</b>
              <a class="muted">Seguidores</a>

            </div>
            <div class="row-fluid">
              <g:form url="[action:'follow', controller:'user']">

                <g:hiddenField name="username" value="${following.username}"/>


                <button  name="deixarDeSeguir" value="Deixar de Seguir" class="btn btn-small btn-danger"><g:img dir="img" file="glyphicons_007_user_remove_1.png" width="18" height="14"/> Deixar de Seguir </button>           


              </g:form>
            </div>
          </div>

        </div>
        <br>
      </g:each>
    </div>
  </body>
</html>
