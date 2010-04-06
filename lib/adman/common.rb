module Adman
  class << self

    # Returns the Broadcaster used by Adman
    attr_reader :broadcaster

    def broadcaster=(broadcaster)
      @broadcaster = broadcaster
    end
  end
end
