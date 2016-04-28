class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  before_action :match_user, only: [:edit, :destroy]


  layout 'adminLayout'
  # GET /teams
  def index
    # @teams = Team.all
    if is_admin?
      @teams = Team.all
    else
      # show new current user related all monster status
      @teams=current_user.teams
    end
  end

  # GET /teams/1
  def show
  end

  # GET /teams/new
  def new
    number_of_team=current_user.teams.count
    if (number_of_team < 3 || is_admin?)
      @team=Team.new
    else
      redirect_to teams_path, :alert => 'You have made already 3 Teams !'
    end

  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      redirect_to @team, notice: 'Team was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  ## match the user
  def match_user
    if not is_admin?
      if not (current_user.id==set_team.user_id)
        redirect_to teams_path, alert: 'You do not have permission to access this section !'
      end
    end

  end


  # Only allow a trusted parameter "white list" through.
  def team_params
    params.require(:team).permit(:name, :user_id)
  end
end
