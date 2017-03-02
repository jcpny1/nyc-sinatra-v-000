class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/new' do
    figure = Figure.new(name: params[:figure][:name])

    if params[:figure][:title_ids]
      figure.titles = params[:figure][:title_ids].map { |title_id| Title.find title_id }
    end
    if params[:title][:name].length > 0
      figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids]
      figure.landmarks = params[:figure][:landmark_ids].map { |landmark_id| Landmark.find landmark_id }
    end
    if params[:landmark][:name].length > 0
      figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end

    figure.save
  end

end
