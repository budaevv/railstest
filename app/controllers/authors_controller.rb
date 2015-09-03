
class AuthorsController < ApplicationController

  helper GraphHelper

  #http_basic_authenticate_with name: "admin", password: "password", except: [:index, :show,:graph]

  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 50)
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def create
      #render plain: params[:author].inspect
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  private
  def author_params
    params.require(:author).permit(:fio)
  end

end