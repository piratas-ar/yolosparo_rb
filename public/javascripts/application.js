(function($){
  $.fn.shuffle = function(){
    return this.sort(function(){return 0.5 - Math.random();});
  }
})(jQuery);

// Seteando elementos al inicio
$(document).ready(function(){
  $('.intro').css(
    "height", Math.round( $( window ).height() * 0.7 ) +'px'
  );
  $("img.foto").unveil();
});

var showMessage = function(element, message, classes){
  element.find(".modal-body").prepend('<div class="msg '+classes+'">'+message+'</div>');
};

// Enviar mail a legigatos
$('#btn-mail').on('click',function(e){
  e.preventDefault();
  $('#mail').modal();
  $('#mail .msg').remove();
});

$("#mail-submit").on('click',function(e){
  e.preventDefault();
  $.ajax({
      type: "POST",
      url: $('#mail form').attr('action'),
      data: $('#mail form').serialize(),
      success: function(data){
        data = JSON.parse(data);
        showMessage($('#mail'), data.message, 'alert alert-success');
        setTimeout(function(){
            $("#mail").modal('hide');
          },700);
      },
      error: function(xhr){
        data = JSON.parse(xhr.responseText);
        showMessage($('#mail'), data.error, 'alert alert-danger');
      }
  });
});

// Twitear a legigatos
$('#btn-tw').on('click',function(e){
  e.preventDefault();
  var legis = jQuery.map(
      $('#legis-tab .legigato .ico.twitter').shuffle().slice(0,3),
      function(n){
        return $(n).attr('title');
      }
    );

  $('#tw .lista-legis').text(legis.join(', '));
  $('#tw textarea').val( tweet.replace('%legis%', legis.join(' ')) );
  $('#tw').modal();
});

// Ver timeline de TW
$('#btn-timeline').on('click',function(e){
  e.preventDefault();
  $.get('/timeline?hashtag='+$(e.target).data('hashtag')+'&widget_id='+$(e.target).data('id'),function(data){
    $('#sidebar').append(data);
  });
  $('#btn-timeline').hide();
});

