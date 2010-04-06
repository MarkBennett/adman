require 'helper'

class TestAdman < Test::Unit::TestCase

  include Adman

  context "When announcing a service" do
    setup do
      # Replace the standard broadcaster with a mock one
      Adman.broadcaster = EchoBroadcaster.new
      
      announce "My Website"
    end

    should "announce a server" do
      assert_equal Adman.broadcaster.registered.length, 1
    end
  end

end

class EchoBroadcaster
  attr_reader :registered

  def register(name, type, port)
    @registered = [] if @registered.nil?
    @registered << [name, type, port]
  end
end
