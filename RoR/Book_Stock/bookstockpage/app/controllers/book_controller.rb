class BookController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        render json: Book.all;
    end    

    def show 
       
       v= Book.find(params[:id]) 
       render json: v
       
    end   
    
    


    def create
        Book.create('bookName': params[:bookName],
            'bookAuthor': params[:bookAuthor], 
            'quantity': params[:quantity]                                                     
                                                           
            )

    end    

      

    def update 
        p = Book.find(params[:id].to_i)
        p.update('bookName': params[:bookName], 'bookAuthor': params[:bookAuthor], 'quantity': params[:quantity])
        render json: "Data is Updated"
    end

    def destroy
        p = Book.find(params[:id].to_i)
        p.destroy
    end    


end

 