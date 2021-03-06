# Homepage (Root path)
get '/' do
  erb :index
end


get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    url: params[:url],
    title: params[:title],
    author: params[:author]
    )
    if @song.save
      redirect '/songs'
    else
      erb :'songs/new'
  end
end


