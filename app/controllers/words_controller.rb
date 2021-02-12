require 'net/http'

class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  
  def api_request(word)
    api_key = 'cab72891-f003-43ef-a983-253666d45082';
    uri = URI('https://www.dictionaryapi.com/api/v3/references/collegiate/json/')
    params = { :word => word, :key => api_key }
    uri.query = URI.encode_www_form(params)
    
    pp "^^^^^^^^^^^^^^^^^^"
    puts uri
    pp "^^^^^^^^^^^^^^^^^^"
    
    res = Net::HTTP.get_response(uri)
    
    pp "%%%%%%%%%%%%%%%%%%%%"
    puts res.body if res.is_a?(Net::HTTPSuccess)
    pp "%%%%%%%%%%%%%%%%%%%%"
    #https://www.dictionaryapi.com/api/v3/references/collegiate/json/voluminous?key=your-api-key
    #http://www.dictionaryapi.com/api/v1/references/collegiate/xml/ API to retrieve the definition(s).  
    #Our API key for this API is cab72891-f003-43ef-a983-253666d45082.  
    #For more information on this API see www.dictionaryapi.com.  
    #Login details are geminispammer@gmail.com and the password is the project password.
  end
  
  def search
    @word = Word.where(name: params[:id]).first # returns a the first record of a relation or nil if DNE
    
    pp '*************'
    pp @word
    pp '*************'
    
    if @word.nil? # can't find word in dictionary
      api_request(params[:id])
      return render plain: "no word in dictionary"
    end
    
    @definitions = Definition.where(word_id: @word.id) 
    
    render json: @definitions
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
