class FiguresController < ApplicationController

  get '/' do
    redirect '/figures'
  end   

  get '/figures' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.new(params[:figure])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end  

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:figure][:id])
    @figure.update[params]

    redirect "/figures/#{@figure.id}"
  end


end  #  End of Class
