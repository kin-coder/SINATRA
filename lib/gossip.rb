require 'bundler'
Bundler.require
require 'pry'
require 'csv'

class Gossip

	attr_accessor :author, :content


	def initialize(author,content)

		@author= author
		@content= content
		
	end




	def save
  		CSV.open("./db/gossip.csv", "a+") do |csv| # a bien regarder sue le point et les é points avant db. 1pt: on reste dans le mm dossier, 2pts: en sort du fichier db
    	csv << [@author, @content]
    	end
  	end



  	def self.all

 		 all_gossips = []

  			CSV.read("db/gossip.csv").each do |ligne_csv|
    		all_gossips << Gossip.new(ligne_csv[0], ligne_csv[1])
  			end

  		return all_gossips
	end	



end

