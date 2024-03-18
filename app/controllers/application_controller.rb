class ApplicationController < ActionController::Base
  before_action :allow_iframe_requests

  def allow_iframe_requests
    response.headers.delete('X-Frame-Options')
  end

  attr_reader :meta_title, :meta_description, :keywords, :robots

  rescue_from ActionController::RoutingError, 
              AbstractController::ActionNotFound, 
              ActionController::UnknownFormat,
              ActiveRecord::RecordNotFound,
              ActionController::MethodNotAllowed, with: :render_not_found
  rescue_from RuntimeError, Exception, with: :render_server_error

  def render_not_found
    render template: 'errors/not_found', status: :not_found, layout: 'static'
  end

  def render_server_error(exception = nil)
    # TODO: actually report the errors via Apssignal
    Rails.logger.error(exception)
    # TODO: add TrackError.capture_exception(exception)
    render template: 'errors/server_error', status: 500, layout: 'static'
  end
end
