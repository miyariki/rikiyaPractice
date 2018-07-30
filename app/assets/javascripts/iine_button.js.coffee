$ ->
  $("#ajax_test").click ->
    $.ajax
      url: '/ajax_test'
      type: 'get'  #get,postの指定
      dataType: 'json' #レスポンスのデータタイプ指定
      async: true #非同期通信フラグ
    .done (response) ->
      #処理が成功した時の処理
      $("#user").append("<tr><th>名前</th><th>ID</th></tr>")
      for i in [0..response.length]
        $("#user").append("<tr><td>" + response[i].username + "</td><td>" + response[i].id + "</td></tr>")
    .fail (response) ->
      #処理が失敗した時の処理
      alert 'fail'