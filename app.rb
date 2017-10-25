require 'sinatra'
require 'make_todo'

get '/' do
  @tasks =  Tarea.all
  erb :index
end

post '/' do
  @task = Tarea.create(params[:new_task])
  redirect '/'
end

get '/:id/complete' do
  Tarea.update(params[:id])
  redirect '/'
end

get '/:id/delete' do
  Tarea.destroy(params[:id])
  redirect '/'
end