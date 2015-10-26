class SuperherosController < ApplicationController
  before_action :current_user
  before_action :admin_user, only: [:index, :show, :new, :edit]
  before_action :find_one, only: [:show, :edit, :update, :destroy]

  def index
    @superheros = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new superhero_params
    if @superhero.save
      redirect_to superheros_path
    else
      render :new
    end
  end

  def show
    @teams = Team.all
  end

  def edit
    @teams = Team.all
  end

  def update
    if @superhero.update superhero_params
      redirect_to superheros_path
    else
      render :edit
    end
  end

  def destroy
    @superhero.destroy
    redirect_to superheros_path
  end

  private

    def find_one
      @superhero = Superhero.find params[:id]
    end

    def superhero_params
      params.require(:superhero).permit(:name, :height, :bio, :image_url, :team_ids => [])
    end

end
