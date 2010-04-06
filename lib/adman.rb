require 'dnssd'
require 'adman/common'

module Adman

  require 'adman/dnssd'

  DEFAULT_PORT = 3000

  TYPE_WEB_SERVER = "_http._tcp"
  DEFAULT_TYPE = TYPE_WEB_SERVER

  def advertise(name, options={})
    type = options.fetch(:type, DEFAULT_TYPE)
    domain = nil
    port = options.fetch(:port, DEFAULT_PORT)

    Adman.broadcast = Adman.broadcaster.register(name, type, nil, port)
    Adman.broadcast
  end

end
