require "rubyblok/helpers/storyblok_helper"

class PagesController < ApplicationController
  include StoryblokHelper

  before_action :set_headers, only: [:index]

  def index
    @slug = params[:page]
    set_meta_tags
    set_site_config

  rescue StandardError
    render_not_found
  end

  private

  def set_headers
    response.headers['X-FRAME-OPTIONS'] = 'ALLOWALL'
  end

  def set_meta_tags
    @meta_description = page_content['meta_description']
    @keywords         = page_content['keywords']
    @meta_title       = page_content['meta_title'].presence || 'Rubyblok'
    @robots           = page_content['no_index'].present? ? 'noindex, nofollow' : 'index, follow'
  end

  def set_site_config
    @set_site_config ||= get_story('site-config')
    @set_site_config.each do |key, value|
      instance_variable_set("@#{key}", value['color']) if value.is_a?(Hash) && value.key?('color')
      instance_variable_set("@#{key}", value) unless value.is_a?(Hash) && value.key?('color')
    end
    @primary_font = @set_site_config['font_family']
  end


  def page_content
    page_content ||= get_story(@slug)
  end
end
