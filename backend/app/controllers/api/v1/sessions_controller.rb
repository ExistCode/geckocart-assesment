class Api::V1::SessionsController < ApplicationController
    def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { 
        id: user.id,
        name: user.name,
        email: user.email
      }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  def destroy
    session.delete(:user_id)
    render json: { message: 'Logged out successfully' }
  end
        
end
