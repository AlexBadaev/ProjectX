class ProfileController < ApplicationController
  def im
  	if current_user==nil
      redirect_to '/home'
    end
  end

end
