require 'rails_helper'

describe Author do
  it { is_expected.to validate_presence_of(:name) }
  it { should allow_value("Bio").for(:bio) }
end