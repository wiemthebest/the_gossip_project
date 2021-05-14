class WelcomeController < ApplicationController
  def show

    puts  params[:first_name]
    puts "$" * 60
  end
end
