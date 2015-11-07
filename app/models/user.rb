class User < ActiveRecord::Base
  after_create :generate_name

  validates :name, uniqueness: true

  private

  def generate_name
    update_attributes!(name: "#{SecureRandom.hex(16)}#{id}")
  end
end
