require 'test_helper'

class TestMailerTest < ActionMailer::TestCase
  default from: Cfg["mail"]["sender"]
  # test "the truth" do
  #   assert true
  # end
end
