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
          <avatar:gravatar email="${user.email}" alt="${user.username}" cssClass="img-circle" size="56" defaultGravatarUrl="mm"/>
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
          <div class="row-fluid">
            <g:form url="[action:'follow', controller:'user']">

              <g:hiddenField name="username" value="${user.username}" />
              <g:if test="${user.username != userInstance.username}">
                <g:if test="${isFollowing}">
                  <button  name="deixarDeSeguir" value="Deixar de Seguir" class="btn btn-small btn-danger"><g:img dir="img" file="glyphicons_007_user_remove_1.png" width="18" height="14"/> Deixar de Seguir </button>           
                </g:if>
                <g:else>
                  <button name="seguir" value="Seguir" class="btn btn-small btn-success"><g:img dir="img" file="glyphicons_006_user_add_1.png" width="18" height="14"/> Seguir </button>          
                </g:else>
              </g:if>
            </g:form>
          </div>
        </div>

      </div>
      <div class="row-fluid">

        <h4>Favoritos:</h4>
        <hr>      

        <g:each in="${timelineList}" status="i" var="bookmarkInstance">

          <div class="row-fluid ">
            <div class="span1 ">
              <avatar:gravatar email="${bookmarkInstance.user.email}" alt="${bookmarkInstance.user.username}"  cssClass="img-rounded" size="42" defaultGravatarUrl="mm" />
            </div>

            <div class="span11 thumbnail" id="dispose">

              <div class="acoes" style="display: none; position: relative;">      

                <g:if test="${user.id == bookmarkInstance.user.id}">   

                  <g:form controller="bookmark">
                    <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
                    <g:actionSubmit class="btn btn-mini btn-danger" action="delete" style="position: absolute; right: 0;" value="x" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                  </g:form>

                </g:if>

              </div>  

              <a href="${request.contextPath}/${bookmarkInstance.user.username}">
                <h5 style="margin-top: 0">${bookmarkInstance.user.username}</h5>
              </a>

              <g:link controller="bookmark" action="show" id="${bookmarkInstance.id}">
                <h6 style="margin-bottom: 0">${fieldValue(bean: bookmarkInstance, field: "title")}</h6>
              </g:link>

              <small style="margin-top: 0"><a href="${fieldValue(bean: bookmarkInstance, field: "urlShorten")}">${fieldValue(bean: bookmarkInstance, field: "urlShorten")}</a></small>        
              <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>

              <div class="acoes" style="display: none;">
                <div id="target">
                  <a href="#" class="btn btn-mini btn-primary">Action</a>  
                </div>
                <br>

                <div id="comment" style="display: none;">
                  <g:form url="[action:'save', controller:'comment']">
                    <g:render template="/comment/form"/>
                    <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                  </g:form>
                </div>

              </div> 
            </div> 

          </div>
          <hr>
        </g:each>



      </div>
    </div>
  </body>
</html>
