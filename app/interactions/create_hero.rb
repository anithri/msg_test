class CreateHero < ActiveInteraction::Base
  string :code_name
  string :real_name
  string :base_name, default: nil

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

    publish_create_hero(hero)

    hero
  end

  def publish_create_hero(hero)
    hero_data = {
        hero_id:     hero.id,
        secret_base: secret_base,
        base_name:   base_name
    }
    FourWindsPublisher.publish('create_hero', hero_data)
  end

  def self.policy_class
    HeroPolicy
  end

end
