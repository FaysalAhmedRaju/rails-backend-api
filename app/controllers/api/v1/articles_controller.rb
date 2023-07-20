class Api::V1::ArticlesController < ApplicationController
  def index
    articles = Article.all
     render json: {status: "SUCCESS", message: "Article All Data", data: articles, status: :ok} 
  end

  def show
    article = Article.find(params[:id])
    # article = Article.find_by(id: params[:id])

  if article
    render json: {data: article}, state: :ok
  else
    render json: {message: "Article could not be found"}, status: :bad_request
  end
  end

  def create
    article = Article.new(
          title: arti_params[:title],
          body: arti_params[:body],
          author: arti_params[:author]
      )

      if article.save
          render json: {status: "SUCCESS", message: "Article created successfully!", data: article}, status: :created
      else
            render json: {
              error: "eror creating..."
            }
      end      

          # render json: article.errors, status: :unprocessable_entity
  end

  def update
      article = Article.find(params[:id])

  if article.update!(arti_params)
    render json: {message: "Article was updated successfully", data: article}, status: :ok
  else
    render json: {message: "Article cannot be updated"}, status: :unprocessable_entity
  end

  end

  def delete
      article  = Article.find(params[:id])

  if article.destroy!
    render json: {message: "Article was deleted successfully"}, status: :ok
  else
    render json: {message: "Article does not exist"}, status: :bad_request
  end
  end

  private
  def arti_params
    params.required(:article).permit([
      :title,
      :body,
      :author
    ])
      # params.require(:friend).permit(:name, :location, :email, :twitter, :phone)

  end
end

