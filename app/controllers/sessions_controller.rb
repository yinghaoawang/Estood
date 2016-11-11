class SessionsController < ApplicationController
  layout 'application'
  def new
  end
  def create
    user = User.find_by_email params[:session][:email]
    if user
      log_in user #does authentication within this
      redirect_to user
    else
      redirect_to :back
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
