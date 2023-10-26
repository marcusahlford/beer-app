require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  setup do
    VCR.insert_cassette(name)
  end

  teardown do
    VCR.eject_cassette
  end
end
