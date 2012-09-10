<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title> <g:message code="my.text.welcomeTitle"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">

  <g:layoutHead />
  <r:layoutResources />
</head>

<body>

  <!-- Cabeçalho -->

  <header>
    <div class="navbar">
      <div class="navbar-inner">
        <a class="brand" href="${request.contextPath}"><g:message code="my.text.title"/></a>

        <sec:ifLoggedIn>

          <form class="navbar-search pull-center">
            <input type="text" class="search-query" placeholder="Search">
          </form>

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
    <ul class="nav nav-pills">
      <li><a href="#"><g:message code="my.text.footer.sobre"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.ferramentas"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.blog"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.ajuda"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.desenvolvedores"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.feeds"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.termosDeUso"/></a></li>

      <li><a href="#"><g:message code="my.text.footer.politicaDePrivacidade"/></a></li>

    </ul>
  </footer>

</body>

</html>

