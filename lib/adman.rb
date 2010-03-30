require 'dnssd'

module Adman

  include self

  attr_accessor broadcaster

  def announce(name)
    @broadcaster ||= DNSSD

    @broadcaster.register(name, "http", 8080)
  end

end
