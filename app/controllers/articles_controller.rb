class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order("created_at DESC")
    end


    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
        @user = User.find(params[:id])
    end

    def create
        @article = Article.new(article_params)
        @user_id = params[:article_id]
        @user_id.article_id = params[:user_id]
       if @article.valid
          @article.save
        redirect_to "/users/#{@user_id}/articles/#{@article_id}"
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
