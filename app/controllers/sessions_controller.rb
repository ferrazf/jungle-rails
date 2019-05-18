# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController

    def new

    end
      def create
        # Login successful
        user = User.find_by_email(params[:user][:email])
        # If the user exists AND the password entered is correct.
        if user && user.authenticate(params[:user][:password])
        # Save the user id inside the browser cookie. This is how we keep the user logged in.
        session[:user_id] = user.id
        redirect_to '/products#index'
        # Login failed
        else
          redirect_to '/login'
        end

      # Logout
      def destroy
        session[:user_id] = nil
        redirect_to '/login'
      end
    end

  end