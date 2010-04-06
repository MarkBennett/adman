module Adman
  class << self

    # Returns the Broadcaster used by Adman
    attr_reader :broadcaster

    def broadcaster=(broadcaster)
      @broadcaster = broadcaster
    end

    # The current broadcast
    attr_reader :broadcast

    def broadcast=(broadcast)
      @broadcast = broadcast
    end
  end
end
