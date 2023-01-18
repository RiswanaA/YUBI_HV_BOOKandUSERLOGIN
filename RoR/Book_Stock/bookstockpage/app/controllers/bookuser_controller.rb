class BookuserController < ApplicationController
    require 'bcrypt'
 skip_before_action :verify_authenticity_token
 
    def index 
        
        
       render html: "PAGE TO ADD USER and CREDENTIALS"
       
    end
    def show
        
        v = Bookuser.find(params[:id])
        render json: v;
     end
 

    def create
        v = !params[:username].empty? and !params[:email].empty?  and !params[:password].empty? 
        if (v)
          p=Bookuser.create(
            'username': params[:username],
            'email': params[:email],
            'password': params[:password],
             )
          puts p
          render json: "Data Added"
        else
        render json: "Data not added"
        end
    end



 def update 
    p = Bookuser.find(params[:id].to_i)
    p.update('name': params[:username], 'email': params[:email], 'password': params[:password])
    render json: "Data Updated"
 end

  
def destroy
    p = Bookuser.find(params[:id].to_i)
    p.destroy
    render json: "Data Deleted"
end  

end

