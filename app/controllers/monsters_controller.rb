class MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :match_user, only: [:edit, :destroy]


  layout 'adminLayout'

  # GET /monsters
  def index
    # @monsters = Monster.all
    if is_admin?
      @monsters = Monster.all
    else
      # show new current user related all monster status
      @monsters=current_user.monsters
    end
  end

  # GET /monsters/1
  def show
  end

  # GET /monsters/new
  def new
    # @monster = Monster.new
    number_of_monster=current_user.monsters.count
    if (number_of_monster < 20)
      @monster = Monster.new
    else
      redirect_to monsters_path, :alert => 'You have made already 20 Monsters !'
    end
  end

  # GET /monsters/1/edit
  def edit
  end

  # POST /monsters
  def create
    @monster = Monster.new(monster_params)

    if @monster.save
      redirect_to @monster, notice: 'Monster was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /monsters/1
  def update
    if @monster.update(monster_params)
      redirect_to @monster, notice: 'Monster was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /monsters/1
  def destroy
    @monster.destroy
    redirect_to monsters_url, notice: 'Monster was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_monster
    @monster = Monster.find(params[:id])
  end

  ## match the user
  def match_user

    if not is_admin?
      if not (current_user.id==set_monster.user_id)
        redirect_to monsters_path, alert: 'You do not have permission to access this section !'
      end
    end

  end


  # Only allow a trusted parameter "white list" through.
  def monster_params
    params.require(:monster).permit(:name, :type_id, :team_id, :user_id)
  end
end
