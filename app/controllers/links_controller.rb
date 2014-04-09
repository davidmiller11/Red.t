class LinksController < ApplicationController
  
  before_action :require_authentication, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    # index of a certain user's links
    @links = Link.where(user_id: params[:user_id])
    # render text: params.inspect
  end

  def all
    # index of ALL USERS's links
    @links = Link.all
    render 'index'
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to user_links_path
    else
      render 'new'
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def link_params
      return params.require(:link).permit(:url)
    end
end
