#!/bin/zsh

#################################
### 実行方法
### $ ./migrate.sh
#################################

./exec.sh rails db:migrate

# 以下のコマンドで、DBからSchemafile.rbに定義を反映出来るが、コメントがエンコードされてしまう・・・。
# ./exec.sh ridgepole -c /mine-points/config/database.yml -E development --export --output /mine-points/db/Schemafile.rb
