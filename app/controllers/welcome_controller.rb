class WelcomeController < ApplicationController
  def showName

    puts  params[:first_name]
    puts "$" * 60
  end
end
