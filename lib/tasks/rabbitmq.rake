namespace :rabbitmq do

  desc 'Setup RabbitMQ Exchanges and Queues'
  task :init => :environment do

    ex_q = {
        'create_hero' => ['create_base', 'check_sidekicks'],
        'create_base' => []
    }

    require "bunny"

    conn = Bunny.new(host: 'localhost', vhost: "/#{Rails.env}")
    conn.start

    ch   = conn.create_channel

    ex_q.each_pair do |x_name, q_names|
      x = Bunny::Exchange.new(ch, :fanout, "4winds.#{x_name}", durable: true)
      q_names.each  do |q_name|
        q = ch.queue("4winds.#{x_name}.#{q_name}", durable: true).bind(x)
      end
    end

  end
end
