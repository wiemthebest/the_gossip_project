class WelcomeController < ApplicationController
  def showName
    puts "$" * 60
    puts "Voici le message de l'URL :"
    puts  params[:user_entry]
    puts "$" * 60
  end
end
