$(function(){
  $('#chat-box').attr('data-dialect-pick', $('#message_dialect :selected').val());
  $('#message_dialect').on('change', function(){
    $('#chat-box').attr('data-dialect-pick', this.value)
  });
});
