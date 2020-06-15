class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end

    def show
        @article = search_article(params[:id])
    end

    def create
        @article = Article.new(article_params)
        if @article.valid?   
          @article.save
          redirect_to(article_path(@article))
        else
          render('articles/new')
        end
    end

    def edit
        @article = search_article(params[:id])
    end

    def update
        @article = search_article(params[:id])
        if @article.update(article_params)
          redirect_to(article_path(@article))
        else
          render('articles/edit')
        end
    end

    def destroy
        article = search_article(params[:id])
        article.destroy!
        redirect_to(articles_path)
    end

    private

    def article_params
        params.require(:article).permit(:subject, :body)
    end

    def search_article(params_id)
        article = Article.find_by(id: params_id)
        article.present? ? article : redirect_to(articles_path)
    end

end
