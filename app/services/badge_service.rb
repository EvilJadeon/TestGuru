class BadgeService
  def initialize

  end

  def call
    
  end

  private

  def first_try_pass_test(user_id)
    TestPassage.where(user_id: user_id)
  end

  def lose_10_tests(user_id)
    TestPassage.where(user_id: user_id)
  end

  def pass_tests_category(user_id, category_id)
    find_test = Test.where(category_id: category_id).count
    find_users_category = TestPassage.where(user_id: user_id).where(category_id: category_id).count

    if find_users_category == find_test
      # выдать бейдж
    end
  end

  def pass_tests_level(user_id)
    TestPassage.where(user_id: user_id)
  end
end