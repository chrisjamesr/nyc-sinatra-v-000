class LandmarksController < ApplicationController

  get '/' do
    
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    @titles = Title.all
  erb :'/landmarks/new'  
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @titles = Title.all
    @figures = Figure.all
    erb :'/landmarks/edit'
  end


  post '/landmarks' do
    landmark = Landmark.new(params[:landmark])
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    if !params[:title][:name].empty?
      @landmark.titles << Title.create(params[:title])
    end
    if !params[:figure][:name].empty?
      @landmark.figures << Figure.create(params[:figure])
    end
    @landmark.save
    redirect "/landmark/#{@landmark.id}"
  end



end  #  End of Class
 