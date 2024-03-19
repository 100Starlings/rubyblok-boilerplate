class PagesController < ApplicationController
  include StoryblokHelper

  def index
    response.headers['X-FRAME-OPTIONS'] = 'ALLOWALL'
    @slug = params[:page]
  end
end
