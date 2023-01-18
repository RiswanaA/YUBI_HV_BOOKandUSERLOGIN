require 'bcrypt'

class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        
        render html: "enter user credentials"
    end

    def create 
        usr = Bookuser.find_by('email':params[:email])
        if(usr.nil?)
            render json: "user account does not exist"
        else
            if (usr.authenticate(params[:password]))
                session[:current_user_id]=usr.id
                
             redirect_to url_for(:controller => :book, :action => :index)
                # render json: "successful login"   
            else 
                render json: "Incorrect password"   
            end    
        end
    end

    def destroy
        session.delete(:current_user_id)
        render json:"Logged out successfully"
    end    
end        