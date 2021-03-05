class DefinitionsController < ApplicationController
  before_action :set_definition, only: [:show, :edit, :update, :destroy, :create]

  # GET /definitions
  def index
    @definitions = Definition.all
  end

  # GET /definitions/1
  def show
  end

  # GET /definitions/new
  def new
    @definition = Definition.new
  end

  # GET /definitions/1/edit
  def edit
  end

  # POST /definitions
  def create
    pp definition_params
    @definition = Definition.new(definition_params)

    if @definition.save
      redirect_to @definition, notice: 'Definition was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /definitions/1
  def update
    if @definition.update(definition_params)
      redirect_to @definition, notice: 'Definition was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /definitions/1
  def destroy
    @definition.destroy
    redirect_to definitions_url, notice: 'Definition was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_definition
      @definition = Definition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def definition_params
      params.require(:definition).permit(:content, :word_id)
    end
end
