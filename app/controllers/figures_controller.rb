class FiguresController < ApplicationController

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures/new' do
    figure = Figure.new(name: params[:figure][:name])

    if params[:figure][:title_ids]
      figure.titles = params[:figure][:title_ids].map { |title_id| Title.find title_id }
    end
    if params[:title][:name].length > 0
      figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids]
      figure.landmarks = params[:figure][:landmark_ids].map { |landmark_id| Landmark.find landmark_id }
    end
    if params[:landmark][:name].length > 0
      figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    figure.save
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])

    figure.name = params[:figure][:name]

    if params[:figure][:title_ids]
      figure.titles = params[:figure][:title_ids].map { |title_id| Title.find title_id }
    end
    if params[:title][:name].length > 0
      figure.titles << Title.find_or_create_by(name: params[:title][:name])
    end

    if params[:figure][:landmark_ids]
      figure.landmarks = params[:figure][:landmark_ids].map { |landmark_id| Landmark.find landmark_id }
    end
    if params[:landmark][:name].length > 0
      figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
    end

    figure.save
    # flash[:message] = 'Successfully updated song.'
    redirect to "/figures/#{figure.id}"
  end

end
