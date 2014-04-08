class LoginsController < ApplicationController

  def create
    if user = User.authenticate(params[:username], params[:password])
  end

end