require('sinatra')
  require('sinatra/reloader')
  also_reload('lib/**/*.rb')
  require('./lib/word')
  require('./lib/dictionary')

  get('/') do 
  	erb(:index)
  end

  get('/dictionaries/new') do
     erb(:dictionaries_form)
  end

  get('/dictionaries') do
    @dictionaries = Dictionary.all()
    erb(:dictionaries)
  end

  post('/dictionaries') do
    name = params.fetch('name')
    Dictionary.new(name).save()
    @dictionaries = Dictionary.all()
    erb(:success)
  end

  get('/words/:id') do
    @word = Word.find(params.fetch('id').to_i())
    erb(:word)
  end

  get('/dictionaries/:id') do
    @dictionary = Dictionary.find(params.fetch('id').to_i())
    erb(:dictionary)
  end

  get('/dictionaries/:id/words/new') do
      @dictionary = Dictionary.find(params.fetch('id').to_i())
      erb(:dictionary_words_form)
  end

  post('/words') do
    meaning = params.fetch("meaning")
    
    @word = Word.new(meaning)
    @word.save()
    @dictionary = Dictionary.find(params.fetch('dictionary_id').to_i())
    @dictionary.add_word(@word)
    erb(:word)
  end



  # get('/words') do
  # @words = Word.all()
  # erb(:words)
  # end

  # get('/words/new') do
  # erb(:words_form)
  # end

  # post('/words') do
  # meaning = params.fetch("meaning")
  
  # word = Word.new(meaning)
  # word.save()
  # erb(:success)
  # end

  # get('/words/:id') do
  # @word = Word.find(params.fetch("id"))
  # erb(:word)
  # end
  # 