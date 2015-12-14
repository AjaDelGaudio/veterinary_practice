require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { should validate_presence_of(:name_of_pet) }
  it { should_not allow_value(nil).for(:name_of_pet) }

  it { should validate_inclusion_of(:type_of_pet).in_array(["dog", "cat", "bird") }

  it { should validate_length_of(:breed).is_at_most(35) }

  it { should validate_presence_of(:age) }
  it { should_not allow_value(nil).for(:age) }
  it { should validate_numericality_of(:age)

  it { should validate_presence_of(:weight) }
  it { should_not allow_value(nil).for(:weight) }

  it { should validate_presence_of(:name_of_pet) }
  it { should_not allow_value(nil).for(:name_of_pet) }
end
