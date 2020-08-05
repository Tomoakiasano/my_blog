class ArticlesController < ApplicationController
    before_action :find_article, only: %i[show edit update destroy]

    def new
      @article = Article.new
      render 'form'
    end

    def index
      @articles = Article.status_published.page(params[:page]).per(Article::PAGENATION_NUM)
    end

    def show; end

    def create
      @article = Article.new(article_params)
      if @article.valid?
        @article.save
        redirect_to(article_path(@article))
      else
        render 'form'
      end
    end

    def edit
      render 'form'
    end

    def update
      if @article.valid?
        @article.update(article_params)
        redirect_to(article_path(@article))
      else
        render 'form'
      end
    end

    def destroy
      @article.destroy!
      redirect_to(articles_path)
    end

    private

    def article_params
      params.require(:article).permit(:subject, :body, :published_status)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
