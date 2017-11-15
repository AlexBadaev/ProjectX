class UserController < ApplicationController
  def new
  	@user=User.new
  end

  def show
    if current_user==nil
      redirect_to '/home'
    elsif current_user[:statususer_id]!=0
      redirect_to '/home'
    end
  		@user=User.all
  end

def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to signin_path }
      else
        format.html { render :new }
      end
    end
end

private
 def user_params
       sgh=params.require(:user).permit(:fname, :lastname, :login, :password,:statususer_id)
        return {fname: sgh[:fname],lastname: sgh[:lastname],login: sgh[:login],password:encrypt(sgh[:password]),statususer_id:sgh[:statususer_id]}
 end
end
