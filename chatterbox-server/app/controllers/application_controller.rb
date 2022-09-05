require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
   get "/messages" do
     Message.all.to_json
   end

   post "/messages" do

    new_message = Message.create(
      body: params[:body],
      username:params[:username]
    )
    new_message.to_json
   end

    patch "/messages/:id" do
      id = params[:id].to_i
      puts params
      to_update_message = Message.find(id)
      to_update_message.update(body:params[:body])
      to_update_message.to_json
    end
    
   delete "/messages/:id" do
     id = params[:id].to_i
     to_be_deleted = Message.find(id)
     to_be_deleted.destroy
     to_be_deleted.to_json
   end

  
end
  
