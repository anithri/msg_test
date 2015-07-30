class CreateHero < ActiveInteraction::Base
  string :code_name
  string :real_name

  hash :heros_base do
    string :code_name
    boolean :secret_base
  end

  def execute
    "Hello, #{code_name}! @ #{heroes_base[:code_name]}"
  end
end
