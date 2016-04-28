class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user


  layout 'adminLayout'
  # GET /types
  def index
    @types = Type.all
  end

  # GET /types/1
  def show
  end

  # GET /types/new
  def new
    @type = Type.new
  end

  # GET /types/1/edit
  def edit
  end

  # POST /types
  def create
    @type = Type.new(type_params)

    if @type.save
      redirect_to @type, notice: 'Type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /types/1
  def update
    if @type.update(type_params)
      redirect_to @type, notice: 'Type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /types/1
  def destroy
    @type.destroy
    redirect_to types_url, notice: 'Type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_params
      params.require(:type).permit(:name, :power)
    end
end
