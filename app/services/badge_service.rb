class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
  end

  def call
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule}", badge.value)
    end
  end

  private

  def pass_tests_category(value)
    find_tests = Test.test_names_title(value).count
    
    find_test_passages = Test.joins(:category)
                              .joins(:test_passages)
                              .where(test_passages: { user: @user, successfull: true }, category: { title: value })
                              .count
    
    find_tests == find_test_passages
  end

  def first_try_pass(value)
    find_fall_test_passages = TestPassage.where(user: @user, test: @test, successfull: false).count

    @test_passage.successfull == true && find_fall_test_passages == 0
  end

  def lose_10_tests(value)
    find_test_passages = TestPassage.where(user: @user, test: @test, successfull: false).count

    find_test_passages % 10 == 0
  end

  def pass_tests_level(value)
    find_tests = Test.where(level: value.to_i).count

    find_test_passages = Test.where(level: value.to_i)
                              .joins(:test_passages)
                              .where(test_passages: { user: @user, successfull: true })
                              .distinct.count
    
    find_tests == find_test_passages
  end
end