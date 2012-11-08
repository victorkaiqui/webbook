<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Esqueceu a senha</title>
  </head>
  <body>
    <div class="row">
      <div class="span4">...
      </div>
      <div class="span8"> 
        <g:form controller="user" class="form-horizontal"> 
          <div class="control-group">
            <div  class="control-label" >
              Qual é seu Email
            </div>
            <div class="controls">
              <g:field  name="email" required=""  class="input-big" placeholder="Email"/>
            </div><br>
            <div class="controls">
              <g:actionSubmit class="btn btn-info" action="changePassword" value="Enviar"/>
            </div>
          </div>
        </g:form>
      </div>
    </div>

  </body>
</html>
