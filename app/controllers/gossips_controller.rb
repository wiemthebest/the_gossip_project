class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]
  before_action :check_gossip_user, only: [:edit, :update, :destroy]

  def show
     @potin = Gossip.find_by_id(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new
    @gossip.title = params[:title]
    @gossip.content = params[:content]

    @gossip.user = current_user
    if @gossip.save
      redirect_to '/', notice: 'gossip created'
    else
      render :new
    end
  end

  def edit
    @potin = Gossip.find_by_id(params[:id])
  end

  def update
    @potin = Gossip.find(params[:id])
    if @potin.update(post_params)
      redirect_to @potin
    else
      render :edit
    end
  end

  def destroy
    @potin = Gossip.find(params[:id])
    @potin.destroy
    redirect_to '/'
  end

  def post_params
    puts '*' * 6
    puts params
    post_params = params.require(:gossip).permit(:title, :content)
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def check_gossip_user
    potin = Gossip.find(params[:id])
    unless current_user.id == potin.user.id
      flash[:danger] = "This is not your gossip !"
      redirect_to new_session_path
    end
  end
end
