class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/new' do
    figure = Figure.create(name: params[:figure][:name])
    binding.pry
    if params[:title][:name].length > 0
      figure.titles << Title.create(name: params[:title][:name])
#      figure.titles = params['genres'].map { |genre_id| Genre.find genre_id }
    end
  end

end
