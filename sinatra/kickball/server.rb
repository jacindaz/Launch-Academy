require 'sinatra'
require 'rubygems'

puts "Got here"

#ROUTES AND VIEWS-----------------------------------------
get('/styles.css'){ css :styles }

get '/tasks/:task_name' do
  @task = params[:task_name]
  # The :task_name is available in our params hash
  erb :show
end

get '/' do
  @title = "Home Page"
  erb :home
end

get '/team' do
  @title = "Team Homepage"
  erb :team
end



#IF GET A 404 NOT FOUND ERROR--------------------------------------------
not_found do
  @title = "Oops! Jacinda created a bug."
  erb :home
end

