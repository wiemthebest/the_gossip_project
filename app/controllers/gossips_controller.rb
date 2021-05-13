class GossipsController < ApplicationController

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
    #@gossip.password = params[:password]
    #@gossip.password_confirmation = params[:password_confirmation]
    @gossip.user = User.first
    if @gossip.save
      redirect_to '/'
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

end
