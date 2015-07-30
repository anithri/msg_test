json.array!(@heros) do |hero|
  json.extract! hero, :id, :code_name, :real_name, :sidekick_count
  json.url hero_url(hero, format: :json)
end
