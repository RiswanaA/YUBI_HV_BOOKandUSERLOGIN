class SearchController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index 
        render json: "IN SEARCH BY BOOKNAME PAGE"
    end
    
    def create 
        bk = Book.find_by('bookName':params[:bookName])
        if(bk.nil?)
            render json: "book does not exist"
        else
            render json: bk
        end
    end

    
end
