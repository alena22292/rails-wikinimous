class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    id = params[:id]
    @post = Article.find(id)
  end
  def new
    @post = Article.new
  end
  def create
     @post = Article.new(post_params)
     @post.save
     redirect_to article_path(@post)
  end
  def edit
    # get the id from the params
    id = params[:id]
    @post = Article.find(id)
    # find the restaurant with that id
  end
  def update
    # find restaurant by its id
    id = params[:id]
    @post = Article.find(id)
    # update it with data from params
    # redirect to show page.
    @post.update(post_params)
    redirect_to article_path(@post)
  end

  def destroy
    @post = Article.find(params[:id])
    @post.destroy
    redirect_to articles_path
  end

  private

  def post_params
    params.require(:article).permit(:title, :content)
  end
end
