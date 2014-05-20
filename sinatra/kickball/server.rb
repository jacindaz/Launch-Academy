require 'sinatra'
require 'rubygems'
require 'csv'

#METHODS--------------------------------------------------------------
def load_contacts(file_name)
  contacts = []
  CSV.foreach(file_name, headers: true, header_converters: :symbol) do |contact|
    contacts << contact.to_hash
  end
  contacts
end

def team_simpson_slammers(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Simpson Slammers"
      final_array << nested_hash
    end
  end
  final_array
end

def team_jetson_jets(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Jetson Jets"
      final_array << nested_hash
    end
  end
  final_array
end

def team_griffin_goats(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Griffin Goats"
      final_array << nested_hash
    end
  end
  final_array
end

def team_flinestone_fire(array_of_hashes)
  final_array = []
  array_of_hashes.each do |nested_hash|
    if nested_hash[:team] == "Flinestone Fire"
      final_array << nested_hash
    end
  end
  final_array
end


#VARIABLES--------------------------------------------------
@@contacts = load_contacts('lackp_starting_rosters.csv')


#ROUTES AND VIEWS------------------------------------------------------
get('/styles.css'){ css :styles }


get '/' do
  @title = "Home Page"
  erb :home
end


get '/team/:team_name' do
  @title = "Team Homepage"
  @team = params[:team_name]

  case @team
  when "flinestonefire"
    @teamhash = team_flinestone_fire(@@contacts)
  when "griffingoats"
    @teamhash = team_griffin_goats(@@contacts)
  when "jetsonjets"
    @teamhash = team_jetson_jets(@@contacts)
  when "simpsonslammers"
    @teamhash = team_simpson_slammers(@@contacts)
  end

  erb :team
end


get '/allteams' do
  @title = "All Team Info"
  erb :allteams
end



#IF GET A 404 NOT FOUND ERROR--------------------------------------------
not_found do
  @title = "Oops! "
  puts "Oops! Jacinda created a bug."
  erb :home
end



