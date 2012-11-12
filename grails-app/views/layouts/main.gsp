<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.tagsinput.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">  
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'jquery.tagsinput.css')}" />
  <g:layoutHead />
  <r:layoutResources />
</head>

<body>

  <!-- Cabeçalho -->

  <header>
    <div class="navbar navbar-inverse">
         <div class="navbar-inner">

        <a class="brand" href="${request.contextPath}">WebBook</a>

        <sec:ifLoggedIn>

          <g:form url="[action:'search', controller:'search']" class="navbar-search pull-center">
            <input type="text" class="search-query" placeholder="Pesquisa" name="query">
          </g:form>


          <div class="btn-group pull-right">
            <a class="btn btn dropdown-toggle" data-toggle="dropdown" href="#"><g:img dir="img" file="glyphicons_019_cogwheel.png" width="20" height="16"/> <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdown">

              <li><g:link controller="user" action="config"><i class="icon-pencil"></i> Configuração </g:link></li>

              <li class="divider"></li>

              <li><i class="i"></i><g:link controller="logout" ><i class="icon-off"></i> Sair </g:link></li>

            </ul>
          </div>

        </sec:ifLoggedIn>

      </div>
    </div>
  </header>

  <!-- Conteúdo-->
  <div class="container">

    <g:layoutBody />

  </div>

  <!--Rodapé-->
  <footer>
    <ul class="nav nav-pills"><br><br>
      <li><a href="user/error404"><g:message code="my.text.footer.sobre"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.ferramentas"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.blog"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.ajuda"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.desenvolvedores"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.feeds"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.termosDeUso"/></a></li>

      <li><a href="user/error404"><g:message code="my.text.footer.politicaDePrivacidade"/></a></li>

    </ul>
  </footer>

</body>

</html>

