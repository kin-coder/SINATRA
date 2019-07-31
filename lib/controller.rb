
require 'sinatra'
require_relative 'gossip'

class ApplicationController < Sinatra::Base
  
=begin
  	get '/' do
    
  		erb :index
  	end

=end    

  	get '/gossips/new/' do
 
  		erb :new_gossip

  	end


    get '/' do

    erb :index, locals: {gossips: Gossip.all}
    end


    get '/gossipss/new/' do

    erb :affiche, locals: {gossips: Gossip.all}
    end


  	post '/gossips/new/' do
  	
  		Gossip.new(params["gossip_author"], params["gossip_content"]).save  #quand l'utilisateur soumet le formulaire, params récupère son contenu et le stocke avec les noms qu'on avait choisis pour chaque champ de texte 
  		# gossip_author et gossip_content: variable dans gossip.erb
  		puts "#{params["gossip_author"]},#{params["gossip_content"]}"
 		
    redirect '/' # redirige vers la page d'acceuil
	end


  
	

end



