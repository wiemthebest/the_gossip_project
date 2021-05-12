class AuthorController < ApplicationController
  def show
     @author = User.find_by_id(params[:id])

  end
end
