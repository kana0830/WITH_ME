require_relative 'boot'

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WITHME
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.template_engine = :slim #slimに変更
    config.i18n.default_locale = :ja #日本語化の反映
    # バリデーションエラー時のレイアウト崩れ防止
    config.action_view.field_error_proc = Proc.new do |html_tag, instance| 
      html_tag
    end
    config.time_zone = 'Asia/Tokyo' # 日本日時表示

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.test_framework :rspec,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false
    end
  end
end
