require 'helper'

class TestAdman < Test::Unit::TestCase

  include Adman

  context "When announcing a service" do
    setup do
      announce "My Website"
    end

    should "announce a server" do
      assert false
    end
  end

end
