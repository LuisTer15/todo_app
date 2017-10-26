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
  @task_complete = Tarea.find(params[:id])["title"]
  erb :complete
end

patch '/:id/complete' do
  Tarea.update(params[:id])
  redirect '/'
end

get '/:id/delete' do
   @task_delete = Tarea.find(params[:id])["title"]
   erb :delete
end

delete '/:id/delete' do
  Tarea.destroy(params[:id])
  redirect '/'
end