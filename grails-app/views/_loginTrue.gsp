<div class="container-fluid">
  <div class="row-fluid">

    <div class="span3">

      <div class="thumbnail"  style="background: gainsboro">
        <title> Webbook - <sec:loggedInUserInfo field="username"/></title>

        <div class="row-fluid" style="text-align: center">
          <avatar:gravatar email="${user.email}" alt="${user.username}"  cssClass="img-circle" size="42" defaultGravatarUrl="mm" />
          <h4>${user.username}</h4>
        </div>
        <hr>

        <div class="row-fluid">
          <div class="thumbnail span4">${bookmarkInstanceTotal} 
            <div><small>favoritos</small></div>
          </div>

          <div class="thumbnail span4">${user.followings.size()} 
            <div><small>seguindo</small></div>
          </div>

          <div class="thumbnail span4">${user.followers.size()} 
            <div><small>seguidores</small></div>
          </div>
        </div>

        <hr>

        <div class="row-fluid">

          <div class="input-append">

            <g:textField id="bookmarkUrl" name="campo" required=" "class="input-medium"   placeholder=" + Favorito" /> 
            <a id="openBookmarkModal" data-toggle="modal" href="#bookmark" class="btn btn-warning btn-primary"><i class="icon-plus icon-white"></i></a>

          </div>            

        </div>
      </div>

      <div id="bookmarkModal" class="modal hide fade in" style="display: none; ">  
        <div class="modal-header">  
          <a class="close" data-dismiss="modal">×</a>  
          <h3>Adicione seu novo favorito</h3>  
        </div>  

        <div class="modal-body">  

          <g:form url="[action:'save', controller:'bookmark']">
            <fieldset>

              <g:render template="/bookmark/form" />

              <div class="modal-footer">                  
                <g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" class="btn btn-warning btn-large"/>
                <a href="#" class="btn btn-large" data-dismiss="modal">Close</a>  
              </div>

            </fieldset>
          </g:form>

        </div>  
      </div>

      <br>
      <div class="thumbnail">


      </div>

    </div>

    <div class="thumbnail span8">
      <h4>Favoritos:</h4>
      <hr> 

      <g:each in="${bookmarkTimeline}" status="i" var="bookmarkInstance">

        <div class="thumbnail span3">
          <img src="http://placehold.it/260x180" alt="Sample Image">
        </div>

        <div class="span8">

          <div class="acoes" style="display: none; position: relative;">      
            <g:if test="${user.id == bookmarkInstance.user.id}">   

              <g:form controller="bookmark">
                <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
                <g:actionSubmit class="btn btn-mini btn-danger" action="delete" style="position: absolute; right: 0;" value="x" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
              </g:form>

            </g:if>
          </div>  

          <g:link controller="user" action="profile" id="${bookmarkInstance.id}">
            <h5>${bookmarkInstance.user.username}</h5>
    <!--            <small><g:formatDate format="dd/MM/yyyy HH:mm" date="${bookmarkInstance.dateCreated}"/></small>-->
          </g:link>

          <g:link controller="bookmark" action="show" id="${bookmarkInstance.id}">
            <h5>${fieldValue(bean: bookmarkInstance, field: "title")}</h5>
          </g:link>

          <p><small><a href="${fieldValue(bean: bookmarkInstance, field: "url")}">${fieldValue(bean: bookmarkInstance, field: "url")}</a></small></p>          
          <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>

          <div class="acoes" style="display: none">

            <a href="#" class="btn btn-mini btn-primary">Action</a>
            <a href="#" class="btn btn-mini">Action</a>

          </div> 

          <hr>         
        </div>

      </g:each>

    </div>
  </div>
</div>


<script>
   $(document).ready(function(){
  $("div.span8").hover(
    function(){
      $(this).find("div.acoes").show();
    },
    function(){
      $(this).find("div.acoes").hide();
    }
    );

  $("#tags").tagsInput({
    'defaultText':'Adicione tags',
    'height':'100px',
    'width':'215px',
    'placeholderColor' :'#B8B8B8'
  });

  $('#campo').focus(function() { 
    $("#acoes").show();
  }); 

  $('#campo').blur( function() {   
    $("#acoes").hide();
  });

  $('#openBookmarkModal').click(function() {
    var url =  $("#bookmarkUrl").val();
    
    $.getJSON('${request.contextPath}/bookmark/preview', {url: url} , function(data){
      $("#url").val(data.url);
      $("#title").val(data.title);
    }); 

    $('#bookmarkModal').modal();

  }); 
})
</script>