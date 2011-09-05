class WelcomeController < ApplicationController
    def index
      @oauth_url = MiniFB.oauth_url(FB_APP_ID, HOST + "sessions/create",:scope=>MiniFB.scopes.join(","))
    end
    def post
      begin
        @id = params.delete :id
        @to = params.delete :to
        @res = MiniFB.post(@access_token, @id, :type=>"feed", :metadata=>true, :params=>params, :link => params[:message])
      rescue => e
        flash[:error] = "Unable to post your link due to " + e.message
      end
      render :index
    end
    def show
      MiniFB.enable_logging
      @id = params[:id]
      @res = MiniFB.get(@access_token, @id, :type=>"me", :metadata=>true)
    end
end
