require 'dnssd'
require 'adman/common'

module Adman

  def announce(name)
    Adman.broadcaster.register(name, "http", 8080)
  end

end
