class CreateHero < ActiveInteraction::Base
  string :code_name
  string :real_name
  string :base_of_operations, default: nil

  boolean :secret_base, default: true

  validates :code_name, :real_name, presence: true

  def to_model
    Hero.new
  end

  def execute
    hero = Hero.new(code_name: code_name, real_name: real_name)

    unless hero.save
      errors.merge!(hero.errors)
    end

    create_base_for_hero(hero)

    hero
  end

  def send_message(msg_queue, msg)

  end

  def create_base_for_hero(hero)
    hero_data = {
        hero_id:            hero.id,
        secret_base:        secret_base,
        base_of_operations: base_of_operations
    }
    send_message('CreateHeroBaseForHero', hero_data)
  end


end

