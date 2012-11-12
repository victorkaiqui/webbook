<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Sample title</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row-fluid">

        <div class="span6">

          <h2>Usuário</h2>
          <g:each in="${users}" var="user">
            <div class="span12 thumbnail"  style="background-image:URL('https://kippt.com/static/img/base-noise.jpeg?141b58b60994');">


              <div class="span2">
                <avatar:gravatar email="${user.email}" alt="${user.username}"  cssClass="img-rounded" size="72" defaultGravatarUrl="mm" />
              </div>
              <div class="span10">
                <a href="${request.contextPath}/${user.username}">
                  <h2>${user.username}</h2><br>
                </a>
              </div>

<br>
            </div>
            
          </g:each>
        </div>

        <div class="span6">
          <h2>Tags</h2>

          <g:each in="${bookmarks}" var="bookmark">
            <div class="span12 thumbnail"  style="background-image:URL('https://kippt.com/static/img/base-noise.jpeg?141b58b60994');">

              <g:if test="${!bookmark.visibility}">
                <div class="span12">
                  <h2>${bookmark.title}</h2>
                  <a href="${bookmark.urlShorten}">
                    <h4>${bookmark.urlShorten}</h4>                
                  </a>
                </div>
                <div class="row-fluid">
                  <g:each in="${bookmark.tags}">
                    <span class="label label-info">#${it}</span>
                  </g:each>
                </div>
              </g:if>
              <g:else>

              </g:else>

            </div>
            <br>
          </g:each>
        </div>
      </div>


  </body>
</html>
