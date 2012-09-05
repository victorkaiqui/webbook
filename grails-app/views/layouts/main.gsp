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
  <facebookAuth:init />


</head>

<body>

  <!-- Cabeçalho -->

  <header>
    <div class="navbar">
      <div class="navbar-inner">
        <a class="brand" href="#">WebBook</a>
        <form class="navbar-search pull-center">
          <input type="text" class="search-query" placeholder="Search">
        </form>
        <ul class="nav  pull-right">
          <li class="active"><a href="kkkkkkk">Entrar</a></li>
          <li ><facebookAuth:connect permissions="email,user_auserbout_me"/></li>
          <li><a href="#">Link</a></li>
        </ul>

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
      <li><a href="/webbook/error">Sobre</a></li>

      <li><a href="#">Ferramentas</a></li>

      <li><a href="#" target="_blank">Blog</a></li>

      <li><a href="#">Ajuda</a></li>

      <li><a href="#">Desenvolvedores</a></li>

      <li><a href="#">Feeds</a></li>

      <li><a href="#">Termos de uso</a></li>

      <li><a href="#">Política de privacidade</a></li>

    </ul>
  </footer>

</body>

</html>

