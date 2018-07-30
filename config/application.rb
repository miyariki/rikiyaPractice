require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rikitter
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    # データベースに保存する時間を日本時間に変更するやつ
    # 追加したけど動作しなかったやつ
    # なんの影響もなかったのでコメントアウトしなくて放置
    # 追記：と思ったら動いてた。
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
