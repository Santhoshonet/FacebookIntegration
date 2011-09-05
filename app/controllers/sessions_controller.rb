class SessionsController < ApplicationController
  def create
    code = params['code'] # Facebooks verification string
    if code
      access_token_hash = MiniFB.oauth_access_token(FB_APP_ID, HOST + "sessions/create", FB_SECRET, code)
      @access_token = access_token_hash["access_token"]
      cookies[:access_token] = @access_token
      flash[:success] = "Authentication successful."
      if User.find_by_access_token(@access_token).nil?
        MiniFB.enable_logging
        @id = params[:id]
        @res = MiniFB.get(@access_token, @id, :type=>"me", :metadata=>true)
        unless @res.nil?
          user = User.new
          user.uid = @res[:id]
          user.name = @res[:name]
          user.first_name = @res[:first_name]
          user.last_name = @res[:last_name]
          user.link =  @res[:link]
          user.gender = @res[:gender]
          user.email = @res[:email]
          user.access_token = @access_token
          user.save
        end
      end
    end
    redirect_to :controller => "welcome"
  end
end
