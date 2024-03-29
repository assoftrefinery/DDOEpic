class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  def index
    @users = User.find_by_sql("SELECT * FROM users")
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to items_path, :notice => "Gracias por registrarte! Acabas de iniciar sesion."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to items_path, :notice => "Tu perfil se ha actualizado"
    else
      render :action => 'edit'
    end
  end
end
