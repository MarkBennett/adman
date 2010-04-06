require 'helper'

class TestAdman < Test::Unit::TestCase

  include Adman

  context "Announcing a service," do
    setup do
      # Replace the standard broadcaster with a mock one
      @broadcaster = EchoBroadcaster.new
      Adman.broadcaster = @broadcaster

      # Announce the website
      @website_name = "My Website"
      advertise @website_name

    end

    should "register it with the broadcaster" do
      assert @broadcaster.registered?
    end

    should "broadcast it with the correct name" do
      assert_equal @broadcaster.registered_name, @website_name
    end

    should "broadcast it on the default port" do
      assert_equal @broadcaster.registered_port, Adman::DEFAULT_PORT
    end

    should "broadcast it as a web server" do
      assert_equal @broadcaster.registered_type, Adman::DEFAULT_TYPE
    end

  end

  context "Announcing a service on a port and of a type, " do

    setup do
      @broadcaster = EchoBroadcaster.new
      Adman.broadcaster = @broadcaster

      @service_name = "A great service"
      @port = 80
      @type = "_git._tcp"
      advertise @service_name, :port => @port, :type => @type
    end

    should "register it under the correct name" do
      assert_equal @broadcaster.registered_name, @service_name
    end

    should "register in on the correct port" do
      assert_equal @broadcaster.registered_port, @port
    end

    should "register it as the correct type" do
      assert_equal @broadcaster.registered_type, @type
    end

    should "register the broadcast for later" do
      assert !Adman.broadcast.nil?
    end

  end

end

class EchoBroadcaster
  attr_reader :registered_name
  attr_reader :registered_type
  attr_reader :registered_domain
  attr_reader :registered_port

  def registered?
    @registered ||= false
  end

  def register(name, type, domain, port)
    @registered = true
    @registered_name = name
    @registered_type = type
    @registered_domain = domain
    @registered_port = port
  end
end
