class PagesController < ApplicationController
  include StoryblokHelper

  def index
    response.headers['X-FRAME-OPTIONS'] = 'ALLOWALL'

    story_id = params[:page]
    @story = get_story(story_id)
    
  rescue StandardError
    render_not_found
  end
end
