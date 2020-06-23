class ArticlesController < ApplicationController
    before_action -> {
        search_article(params[:id])
    }, only: [:show, :edit, :update, :destroy]

    def new
        @article = Article.new
    end

    def index
        @articles = Article.published.order('created_at desc').page(params[:page]).per(10)
    end

    def show; end

    def create
        @article = Article.new(article_params)
        if @article.valid?   
          @article.save
          redirect_to(article_path(@article))
        else
          render('articles/new')
        end
    end

    def edit; end

    def update
        if @article.update(article_params)
          redirect_to(article_path(@article))
        else
          render('articles/edit')
        end
    end

    def destroy
        @article.destroy!
        redirect_to(articles_path)
    end

    def published_article
        setup_article_status(true, params)
    end

    def unpublished_article
        setup_article_status(false, params)
    end

    private

    def article_params
        params.require(:article).permit(:subject, :body, :published_status)
    end

    def search_article(params)
        @article = Article.find_by!(id: params)
    end

    def setup_article_status(published_flag, params)
        article = Article.find_by!(id: params[:format])
        if published_flag
            article.published! unless article.published?
        else
            article.unpublished! unless article.unpublished?
        end
        redirect_to edit_article_path(article), notice: published_flag ? '記事を公開しました' : '記事を非公開しました'
    end
end
