# frozen_string_literal: true

Rubyblok.configure do |config|
  config.cached = false

  config.api_token      = ENV.fetch("STORYBLOK_API_TOKEN", nil)
  config.version        = ENV.fetch("STORYBLOK_VERSION", nil)
  config.webhook_secret = ENV.fetch("STORYBLOK_WEBHOOK_SECRET", nil)

  config.model_name     = "PageObject"
  config.component_path = "shared/rubyblok_components"
end
