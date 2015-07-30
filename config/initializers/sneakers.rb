# an initializer
require 'sneakers'
Sneakers.configure daemonize: false,
                   vhost:     "/#{Rails.env}",
                   amqp:      "amqp://localhost",
                   log:       "log/sneakers.log",
                   pid_path:  "tmp/pids/sneakers.pid",
                   ack:       true,
                   threads:   1,
                   workers:   1
Sneakers.logger.level = Logger::INFO
