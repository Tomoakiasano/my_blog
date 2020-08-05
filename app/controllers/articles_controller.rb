class ArticlesController < ApplicationController
    before_action :search_article, only: %i[show edit update destroy]
    before_action :authenticate_user!

    def new
      @article = Article.new
    end

    def index
      @articles = my_articles.status_published.order(created_at: :desc).page(params[:page]).per(10)
    end

    def show; end

    def create
      @article = my_articles.new(article_params)
      if @article.valid?
        begin   
          @article.save!
          redirect_to(article_path(@article))          
        rescue => e
          Rails.logger.info e
        end
      else
        render :new
      end
    end

    def edit; end

    def update
      if @article.valid?
        begin
          @article.update!(article_params)
          redirect_to(article_path(@article))  
        rescue => e
          Rails.logger.info e
        end
      else
        render :edit
      end
    end

    def destroy
      @article.destroy!
      redirect_to(articles_path)
    end

    private

    def my_articles
      current_user.articles
    end

    def article_params
      params.require(:article).permit(:subject, :body, :published_status)
    end

    def search_article
      @article = Article.find(params[:id])
    end
end
