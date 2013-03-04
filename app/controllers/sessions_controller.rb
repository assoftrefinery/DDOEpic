class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default items_path, :notice => "Sesion iniciada."
    else
      flash.now[:alert] = "Nombre o contrasenya no validos."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Has cerrado la sesion."
  end
end
