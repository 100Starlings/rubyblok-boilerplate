require "rubyblok/helpers/storyblok_helper"

class PagesController < ApplicationController
  include StoryblokHelper

  before_action :set_headers, only: [:index]

  def index
    @slug = params[:page]
    set_meta_tags
    set_site_config

  rescue StandardErrq
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
    @background_gradient = get_story('site-config')['background_gradient']
    @primary_color    = get_story('site-config')['primary_color']['color']
    @primary_color_dark_mode    = get_story('site-config')['primary_color_dark_mode']['color']
    @secondary_color  = get_story('site-config')['secondary_color']['color']
    @secondary_color_dark_mode  = get_story('site-config')['secondary_color_dark_mode']['color']
    @background_color  = get_story('site-config')['background_color']['color']
    @background_color_dark_mode  = get_story('site-config')['background_color_dark_mode']['color']
    @card_bg_color  = get_story('site-config')['card_bg_color']['color']
    @card_bg_color_dark_mode  = get_story('site-config')['card_bg_color_dark_mode']['color']
    @opbg  = get_story('site-config')['opbg']['color']
    @opbg_dark_mode  = get_story('site-config')['opbg_dark_mode']['color']

    @primary_font     = get_story('site-config')['primary_font']
  end

  def page_content
    page_content ||= get_story(@slug)
  end
end
