class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      # ログイン成功した場合
      flash[:notice] = t('flash.sessions.create_success')
      log_in(@user)
      redirect_to tasks_path
    else
      # ログイン失敗した場合
      flash[:danger] = t('flash.sessions.create_failure')
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = t('flash.sessions.destroy')
    redirect_to new_session_path
  end

end
