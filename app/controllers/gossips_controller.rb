class GossipsController < ApplicationController
  def show
     @potin = Gossip.find_by_id(params[:id])
  end
end
