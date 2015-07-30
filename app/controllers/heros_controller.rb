class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @heros = Hero.all
    respond_with(@heros)
  end

  def show
    respond_with(@hero)
  end

  def new
    @hero = Hero.new
    respond_with(@hero)
  end

  def edit
  end

  def create
    @hero = Hero.new(hero_params)
    @hero.save
    respond_with(@hero)
  end

  def update
    @hero.update(hero_params)
    respond_with(@hero)
  end

  def destroy
    @hero.destroy
    respond_with(@hero)
  end

  private
    def set_hero
      @hero = Hero.find(params[:id])
    end

    def hero_params
      params.require(:hero).permit(:code_name, :real_name, :sidekick_count)
    end
end
