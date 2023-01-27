require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :posts }
  it { should have_many :comments }
  it { should have_many :likes }
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:PostsCounter) }
end
