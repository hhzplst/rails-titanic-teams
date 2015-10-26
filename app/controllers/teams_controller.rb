class TeamsController < ApplicationController
  before_action :find_team, only:[:show]
  before_action :current_user
  before_action :confirm_logged_in, only: [:new]
  before_action :find_user, only: [:new]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      redirect_to "/", notice: "Team successfully created!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

    def team_params
      params.require(:team).permit(:name, :description)
    end

    def find_team
      @team = Team.find params[:id]
    end

    def find_user
      @user = User.find params[:user_id]
    end
end
