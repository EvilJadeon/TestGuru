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
    find_tests = Test.where(category_id: @test.category_id).count
    find_test_passages = Test.joins(:test_passages)
                              .where('test_passages.user_id = ? and test_passages.test_id = ? and test_passages.successfull = ? and tests.category_id = ?',
                              @test_passage.user_id, @test_passage.test_id, true, value.to_i).distinct.count
    
    find_tests == find_test_passages
  end

  def first_try_pass(value)
    find_test_passages = TestPassage.where('test_id = ? and user_id = ? and successfull = ?', @test_passage.test_id, @test_passage.user_id, true).distinct.count
    find_test_passages == 1
    
  end

  def lose_10_tests(value)
    find_test_passages = TestPassage.where('test_id = ? and user_id = ? and successfull = ?', @test_passage.test_id, @test_passage.user_id, false).count

    find_test_passages == 10
  end

  def pass_tests_level(value)
    find_tests = Test.where(level: @test.level).count
    find_test_passages = Test.joins(:test_passages)
                            .where('test_passages.user_id = ? and test_passages.test_id = ? and test_passages.successfull = ? and tests.level = ?',
                            @test_passage.user_id, @test_passage.test_id, true, value.to_i).distinct.count
    
    find_tests == find_test_passages
  end
end