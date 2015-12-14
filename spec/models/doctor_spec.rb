require "rails_helper"

RSpec.describe Doctor, type: :model do
  it { should validate_presence_of(:name) }
  # it { should_not allow_value(nil).for(:name) }
  #
  # it { should validate_length_of(:zip).is_at_most(5) }
  #
  # it { should validate_numericality_of(:years_in_practice).is_greater_than_or_equal_to (1) }
  # it { should validate_numericality_of(:years_in_practice).is_less_than_or_equal_to (100) }
end
