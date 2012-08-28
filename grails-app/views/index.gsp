<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Welcome to WebBook</title>
  </style>
</head>
<body>
  <div id="page-body" role="main">
    <div id="controller-list" role="navigation" >
      <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
          <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
        </g:each>
      </ul>
    </div>
  </div>
</body>
</html>
