class HerosController < ApplicationController
  respond_to :html, :js

  def index
    @heros = policy_scope(Hero)
    respond_with(@heros)
  end

  def show
    @hero = find_hero!
    authorize @hero
    respond_with(@hero)
  end

  def new
    @hero = CreateHero.new

    authorize @hero
    respond_with(@hero)
  end

  def edit
    @hero = find_hero!
    authorize @hero
  end

  def create
    @hero = Hero.new(hero_params)
    authorize @hero
    @hero.save
    respond_with(@hero)
  end

  def update
    @hero = find_hero!
    @hero.update(hero_params)
    respond_with(@hero)
  end

  def destroy
    @hero = find_hero!
    authorize @hero
    @hero.destroy
    respond_with(@hero)
  end

  private
    def find_hero!
      @hero = Hero.find(params[:id])

      # Alternate if the Find becomes complicated enough to need an interactor
      # def find_account!
      #   outcome = FindAccount.run(params)
      #
      #   if outcome.valid?
      #     outcome.result
      #   else
      #     fail ActiveRecord::RecordNotFound, outcome.errors.full_messages.to_sentence
      #   end
      # end
    end

    def hero_params
      params.require(:hero).permit(:code_name, :real_name, :sidekick_count)
    end
end
