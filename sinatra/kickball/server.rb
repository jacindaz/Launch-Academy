require 'sinatra'
require 'rubygems'
require 'csv'


#ROUTES AND VIEWS-----------------------------------------
get('/styles.css'){ css :styles }

get '/' do
  @title = "Home Page"

  @contacts = load_contacts

  erb :home
end

get '/team' do
  @title = "Team Homepage"
  @contacts = load_contacts
  erb :team
end


get '/allteams' do
  @title = "All Team Info"
  @contacts = load_contacts
  erb :allteams
end



#IF GET A 404 NOT FOUND ERROR--------------------------------------------
not_found do
  @title = "Oops! Jacinda created a bug."
  erb :home
end


#METHODS--------------------------------------------------------------
def load_contacts
  contacts = []

  CSV.foreach('lackp_starting_rosters.csv', headers: true, header_converters: :symbol) do |contact|
    contacts << contact.to_hash
  end

  contacts
end
