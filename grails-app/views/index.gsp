<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Welcome to WebBook</title>
  </style>
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
  <div class="grid_12" >
    <div class="hero-unit wb-box-with-shadow">
      <h1>Hello, world!</h1>
      <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p>
      <p><a class="btn btn-primary btn-large">Cadastre-se</a></p>
    </div>
  </div>
  <div class="clear"></div>
  <div class="grid_4">
    <section class="wb-box-with-shadow popular-content register-presentation">
      <h3>Organize a sua Web</h3>
      <p class="wb-font-medium">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."</p>
      <a class="btn" href="">Saiba Mais</a>
    </section>        
  </div>
  <div class="grid_4">
    <section class="wb-box-with-shadow popular-content register-presentation">
      <h3>Organize a sua Web</h3>
      <p class="wb-font-medium">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."</p>
      <a class="btn" href="">Saiba Mais</a>
    </section>        
  </div>
  <div class="grid_4">
    <section class="wb-box-with-shadow popular-content register-presentation">
      <h3>Organize a sua Web</h3>
      <p class="wb-font-medium">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."</p>
      <a class="btn" href="">Saiba Mais</a>
    </section>        
  </div>
  <div class="clear"></div>
</sec:ifNotLoggedIn>
</body>
</html>
