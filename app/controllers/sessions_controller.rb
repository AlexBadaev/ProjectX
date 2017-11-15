class SessionsController < ApplicationController
  def new
  end

  def create

    if authenticate(session_params[:login],session_params[:password]) ==nil
        render 'new'
    end
  end

  def destroy
        session[:user_id]=nil
        session[:statususer_id] =nil
        redirect_to root_path
  end

private
    def session_params
    	sgh= params.permit(:login,:password)
    	return {login: sgh[:login],password:encrypt(sgh[:password])}
  	end
    
    def authenticate(login, password)
    	user = User.find_by_login(login) rescue nil?    	
    if user != nil
      if user[:password] == password
        session[:user_id] = user.id
        session[:statususer_id] = user.statususer_id
        if user.statususer_id== 0
          redirect_to priuserprofile_path
        else
          redirect_to profile_path
        end
      else
        nil
      end
    end
 end 
end   