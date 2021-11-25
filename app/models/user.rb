require 'digest/sha1'

class User < ApplicationRecord

  has_many :having_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  has_secure_password

  def passed_tests(test_level)
    tests.where(level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
