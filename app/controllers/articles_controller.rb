class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = current_user.articles.new (article_params)
    if @article.save
      redirect_to @article, notice: 'Your discussion has been saved.'
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Your discussion has been saved.'
    else
      render 'edit'
    end
  end

  def vote
    @article = Article.find(params[:id])
    current_user.votes.create! article: @article
    redirect_to :back
  end

  def unvote
    @article = Article.find(params[:id])
    @vote = current_user.votes.find(@article)
    @vote.destroy
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
