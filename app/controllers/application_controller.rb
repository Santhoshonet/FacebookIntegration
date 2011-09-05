class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  before_filter :user_stuff
    def user_stuff
        @access_token = cookies[:access_token]
        @logged_in = @access_token.present?
    end
end
