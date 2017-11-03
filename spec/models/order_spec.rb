require 'rails_helper'

describe Order do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:total_price) }
  it { is_expected.to validate_presence_of(:status) }
end