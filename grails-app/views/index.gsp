<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Welcome to WebBook</title>
  </style>
<facebookAuth:init />
</head>
<body>

<facebookAuth:connect permissions="email,user_about_me"/>


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
  <div class="grid_4">
    <section class="wb-box-with-shadow popular-content register-presentation">
      <h3>Organize a sua Web</h3>
      <p class="wb-font-medium">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."</p>
    </section>
    <section class="wb-box-with-shadow popular-content register-presentation">
      <h3>Encontre conteúdo do seu Interesse na Internet</h3>
      <p class="wb-font-medium">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."</p>
    </section>
    <section class="wb-box-with-shadow popular-content register-presentation">
      <h3>Compartilhe</h3>
      <p class="wb-font-medium">"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."</p>
    </section>
  </div>

  <div class="grid_8" >
    <div class="wb-box-with-shadow popular-content" id="login-form-container">
      <h1 class="wb-font-big">Descubra, Colecione e Compartilhe novos conteúdos da Web</h1>

      <form action="user/save" id="login-form" method="POST">
        <div class="field-block">
          <div class="field-title">
            <label for="name">
              <g:message code="user.name.label" default="Name" />
              <span class="required-indicator">*</span>
            </label>
          </div>
          <div class="field-input">
            <g:textField name="name" maxlength="15" required="" value="${userInstance?.name}"/>
          </div>
        </div>
        <div class="field-block">
          <div class="field-title">
            <label for="lastName">
              <g:message code="user.lastName.label" default="Last Name" />
              <span class="required-indicator">*</span>
            </label>
          </div>
          <div class="field-input">
            <g:textField name="lastName" maxlength="15" required="" value="${userInstance?.lastName}"/>
          </div>
        </div>
        <div class="field-block">
          <div class="field-title">
            <label for="username">
              <g:message code="user.username.label" default="Username" />
              <span class="required-indicator">*</span>
            </label>
          </div>
          <div class="field-input">
            <g:textField name="username" maxlength="15" required="" value="${userInstance?.username}"/>
          </div>
        </div>

        <div class="field-block">
          <div class="field-title">
            <label for="email">
              <g:message code="user.email.label" default="Email" />
              <span class="required-indicator">*</span>
            </label>
          </div>
          <div class="field-input">
            <g:field type="email" name="email" required="" value="${userInstance?.email}"/>
          </div>
        </div>
        <div class="field-block">
          <div class="field-title">
            <label for="password">
              <g:message code="user.password.label" default="Password" />
              <span class="required-indicator">*</span>
            </label>
          </div>
          <div class="field-input">
            <g:field type="password" name="password" required="" value="${userInstance?.password}"/>
          </div>
        </div>

        <div class="field-block">
          <div class="field-title">
            <label for="birthyday">
              <g:message code="user.birthyday.label" default="Birthyday" />
              <span class="required-indicator">*</span>
            </label>
          </div>
          <div class="field-input">
            <g:datePicker name="birthyday" widget="datePicker" precision="day"  value="${userInstance?.birthyday}"  />
          </div>
        </div>
        <span class="wb-font-medium"><a href="">Leia o Termo de Uso antes de se Cadastrar</a></span>
        <div class="field-block">
          <input class="" type="checkbox">
          <label class="wb-font-medium">Concordo com o Termo de Uso</label>
        </div>
        <div class="controls">
          <div class="control">
            <fieldset class="buttons">
              <g:submitButton name="create" id="button-register" class="wb-border-radius-all" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
          </div>
          <span class="wb-font-medium"></span>
        </div>
      </form>

    </div>
  </div>
  <div class="clear"></div>
</sec:ifNotLoggedIn>
</body>
</html>
