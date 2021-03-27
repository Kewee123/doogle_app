require 'net/http'
require 'json'

class WordsController < ApplicationController
  include DefinitionsHelper
  
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  
  def create_new_word_and_add_definition(word, definitions)
    @word = Word.new({"name": word})
    @word.save
    pp @word.id
    puts "!" * 50
    pp definitions
    
    returnValue = create_definition(@word.id, definitions)
    
    if returnValue == 1
      return 1
    else 
      return 0
    end
  end
  
  
  def api_request(word)
    api_key = 'cab72891-f003-43ef-a983-253666d45082';
    url = 'https://www.dictionaryapi.com/api/v3/references/collegiate/json/' + word;
    uri = URI(url)
    
    params = {:key => api_key }
    uri.query = URI.encode_www_form(params)
    puts uri
    
  
    res = Net::HTTP.get_response(uri)
    
    if res.body.empty?
      puts "i was empty"
      return 0;
    end
    
    puts "I had stuff"
    return res.body
  end

  def search
    @word = Word.where(name: params[:id]).first # returns a the first record of a relation or nil if DNE'
    puts @word
    
    if @word.nil? # can't find word in dictionary
      new_definitions = api_request(params[:id])
      puts new_definitions
      if new_definitions == 0
          return render json: "Failure to add new word. Please try again."
      end
      
      
      obj = JSON.parse(new_definitions)
      puts "#" * 50
      puts obj;
      puts obj.class
      puts obj[0];
      puts "#" * 50
    
      if !obj[0].is_a?(Object) #handles the case where user passes in a mispelled word
        puts "I was mispelled"
        return render json: "Failure to add new word. Please try again."
      end 
  
     
      short_definitions = ""
      found = 0;
      obj.each {|key| 
        if key["meta"]["stems"].include?(params[:id])
          puts "\n\nword: #{key["meta"]["id"]} short def:#{key["shortdef"]}\n\n\n\n"
          short_definitions = key["shortdef"]
          found = 1;
        end
        if found
          break;
        end;
      }
      puts found;
      if found
        returnValue = create_new_word_and_add_definition(params[:id], short_definitions) 
      else
        returnValue = 0
      end
      
      if returnValue == 1
        return render json: "Successfully added new word"
      else
        return render json: "Failure to add new word. Please try again."
      end
    end
    
    @definitions = Definition.where(word_id: @word.id) #you can find it in the dictionary here - return it
    
    return render json: @definitions
  end

  # GET /words
  def index
    @words = Word.all  # retrieve a list of all the users from the database and then places them in the variable @users 
    #Variables that start with the @ sign, called instance variables, are automatically available in the views
  end 

  # GET /words/1
  def show
    @word = Word.find(params[:id])
    @definitions = @word.definition.all
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  def create
    @word = Word.new(word_params)
    puts word_params
    

    if @word.save
      redirect_to @word, notice: 'Word was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /words/1
  def update
    if @word.update(word_params)
      redirect_to @word, notice: 'Word was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /words/1
  def destroy
    @word.destroy
    redirect_to words_url, notice: 'Word was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word
      @word = Word.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_params
      params.require(:word).permit(:name)
    end

end
