class FiguresController < ApplicationController

  get '/' do
    redirect '/figures'
  end   

  get '/figures' do
    @titles = Title.all
    @landmarks = Landmark.all

  end

  get '/figures/new' do
    erb :'figures/new'
  end

end  #  End of Class
