require 'test/unit'
require_relative './spec/spec_helper'

class BasicTest < Test::Unit::TestCase
  include Capybara::DSL

  def setup
    visit "http://localhost:5000"
  end

  def test_specific_blog_post
    find('#blog').click

    current_text = find("#content_title > p:nth-child(4) > a").text

    assert_equal current_text, "second entry"
  end
end