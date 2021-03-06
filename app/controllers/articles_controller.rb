class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "Jason", password: "whitebitchesaretrash", except: [:index, :show]
 

    def index
        @articles = Article.all.order("created_at DESC")
    end


    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
       if @article.valid?
          @article.save
        redirect_to "/articles/#{@article_id}"
       else render 'new'
       end
    end

    def edit
        @article = Article.find(params[:id])
        
      end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
      end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end


    private 
    def article_params
        params.require(:article).permit(:image, :title, :text)
    end
end
