class CreateBaseWorker
  include Sneakers::Worker
  from_queue "4winds.create_hero.create_base", env: nil, durable: true
  Sneakers.logger.level = Logger::INFO

  def work(raw_event)
    event_params = JSON.parse(raw_event)
    logger.info "CreateBaseWorker: " + event_params.inspect
    hero         = Hero.find(event_params['hero_id'])
    hero.create_base_of_operation(
        secret_base: event_params['secret_base'],
        name:        event_params['base_name'] || "#{hero.code_name}'s Secret Base"
    )
    logger.info hero.inspect
    logger.info hero.base_of_operation.inspect
    ack!
  end
end

