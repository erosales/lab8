class UsersController < ApplicationController
  
  def new # responds to get /users/new by rendering new.html.erb
    @title = "Sign up"
    @user = User.new
  end
  
  def create # responds to post /users and redirects to /user/i if successful or new.html.erb if not
    @user = User.new(params[:user])
    if @user.save
      redirect_to user_path(@user)
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def show # responds to get /user/i by rendering show.html.erb
    @user = User.find(params[:id])
    @title = @user.password
  end
  
  def index # responds to get /users by rendering index.html.erb
    @title = "Current users"
    @users = User.all
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end