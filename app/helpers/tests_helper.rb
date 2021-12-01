# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :beginner, 1 => :elementary,
                  2 => :intermediate, 3 => :advanced }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
