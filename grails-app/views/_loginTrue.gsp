<div class="container-fluid">
  <div class="row-fluid">

    <div class="span3">

      <div class="thumbnail"  style="background: gainsboro">
        <title> Webbook · <sec:loggedInUserInfo field="username"/></title>

        <div class="row-fluid" style="text-align: center">
          <a href="${request.contextPath}/${user.username}">
            <avatar:gravatar email="${user.email}" alt="${user.username}"  cssClass="img-circle" size="52" defaultGravatarUrl="mm" />
            <h4>${user.username}</h4>
          </a>
        </div>
        <hr>

        <div class="row-fluid">
          <a href="${request.contextPath}/${user.username}">
            <div class="thumbnail span4">${bookmarkInstanceTotal} 
              <div><small>favoritos</small></div>
            </div>
          </a>

          <a href="${request.contextPath}/user/followings">
            <div class="thumbnail span4">${user.followings.size()} 
              <div><small>seguindo</small></div>
            </div>
          </a>

          <a href="${request.contextPath}/user/followers">
            <div class="thumbnail span4">${user.followers.size()} 
              <div><small>seguidores</small></div>
            </div>
          </a>
        </div>

        <hr>

        <div class="row-fluid">

          <div class="input-append">

            <g:textField id="bookmarkUrl" name="campo" required=" "class="input-medium"   placeholder=" + Favorito" /> 
            <a id="openBookmarkModal" data-toggle="modal" href="#bookmark" class="btn btn-warning btn-primary"><i class="icon-plus icon-white"></i></a>

          </div>            

        </div>
      </div>

      <div id="bookmarkModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
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
                <a href="#" class="btn btn-large" data-dismiss="modal" >Close</a>  
              </div>

            </fieldset>
          </g:form>

        </div>  
      </div>

      <br>
      <div class="thumbnail">
        <ul class="unstyled">
          <g:each in="${tags}">
            <li> <span class="label">#${it}</span></li>
          </g:each>
        </ul>
      </div>
    </div>
    <!------------------------------------------------------------------------>
    <div class="thumbnail span8"  style="background-color: whitesmoke;">
      <h4>Favoritos:</h4>
      <hr> 

      <g:each in="${timelineList}" status="i" var="bookmarkInstance">

        <div class="favorito">

          <div class="row-fluid">

            <div class="span1">
              <avatar:gravatar email="${bookmarkInstance.user.email}" alt="${bookmarkInstance.user.username}"  cssClass="img-rounded" size="42" defaultGravatarUrl="mm" />
            </div>

            <div class="span11" id="dispose">

              <a href="${request.contextPath}/${bookmarkInstance.user.username}">
                <font color="black"><h5 style="margin-top: 0; margin-bottom: 0px;">${bookmarkInstance.user.username}</h5></font>
              </a>

              <a href="${request.contextPath}/bookmark/update?id=${bookmarkInstance?.id}"  onclick="return false;" class="btn btn-link openBookmark" style="margin-bottom: 0px; margin-top: 0px; padding: 0px;">
                <font color="black"><h6 style="margin-bottom: 0">${fieldValue(bean: bookmarkInstance, field: "title")}</h6></font>
              </a><br>


              <small><a href="${fieldValue(bean: bookmarkInstance, field: "urlShorten")}">${fieldValue(bean: bookmarkInstance, field: "urlShorten")}</a></small>        
              <p>${fieldValue(bean: bookmarkInstance, field: "description")}</p>

              <div class="row-fluid">
                <g:each in="${bookmarkInstance.tags}">
                  <span class="label label-info">#${it}</span>
                </g:each>
              </div>

            </div>            
          </div>  

          <div class="row-fluid">
            <div class="span6">              

              <div id="commentModal" class="modal hide fade in">  
                <div class="modal-header">  
                  <a class="close" data-dismiss="modal">×</a>  
                  <h3>Adicione seu novo comentario</h3>  
                </div>  

                <div class="modal-body"> 

                </div> 
                <div class="modal-footer">

                </div>
              </div>

              <i class="icon-edit"></i><a href="${request.contextPath}/comment/list?id=${bookmarkInstance?.id}" onclick="return false;" data-toggle="modal" class="btn btn-link openComment">Comentários</a>

            </div>

            <div class="acoes" style="display: none;">

              <div class="span3">
                <g:if test="${user.username != bookmarkInstance.user.username}">

                  <i class="icon-ok"></i><a href="${request.contextPath}/bookmark/favoritar?id=${bookmarkInstance?.id}"  onclick="return false;" class="btn btn-link openBookmark">Favoritar</a>

                </g:if>
              </div>

              <div class="span3">
                <g:if test="${user.id == bookmarkInstance.user.id}">  
                  <g:form controller="bookmark">

                    <g:hiddenField name="id" value="${bookmarkInstance?.id}" />
                    <i class="icon-trash"></i><g:actionSubmit action="delete" value="Excluir" class="btn btn-link"  onclick="return confirm('Você tem certeza?');" />

                  </g:form>
                </g:if>
              </div>

            </div> 
          </div> 

        </div>

        <hr style="margin-top: 0px;">
      </g:each>
    </div>
  </div>
</div>



<script>
$(document).ready(function(){
  $("div.favorito").hover(
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

  $('#openBookmarkModal').click(function() {
    var url =  $("#bookmarkUrl").val();

    $.getJSON('${request.contextPath}/bookmark/preview', {url: url} , function(data){
      $("#url").val(data.url);     
      $("#title").val(data.title); 
    }); 
    
    $('#bookmarkModal').modal();

  });
  
  function loadData(){
    var url = $(this).attr("href");
    $.get(url, {}, function (data){
      $("#id").val(data.id);
      $("#title").val(data.title);
      $("#url").val(data.url);
      $("#description").val(data.description);
      $("#tags").val(data.tags);
      $("#tags").importTags(data.tags.toString());

      $('#bookmarkModal').modal();
    });
  }

  $('.openBookmark').on('click', loadData);

  function createComment() {
var url = $(this).attr("href");

$('#commentModal .modal-body').load(url);
$('#commentModal').modal();
}


$('.openComment').on('click', createComment);
})
</script>