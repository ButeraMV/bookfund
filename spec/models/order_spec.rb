require 'rails_helper'

describe Order do
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:total_price) }
  it { is_expected.to validate_presence_of(:status) }

  it 'can be find all by status: ordered' do
    create(:order, status: 0)
    create(:order, status: 0)
    create(:order, status: 1)

    expect(Order.ordered.count).to eq(2)
  end

  it 'can be find all by status: paid' do
    create(:order, status: 1)
    create(:order, status: 1)
    create(:order, status: 2)

    expect(Order.paid.count).to eq(2)
  end

  it 'can be find all by status: cancelled' do
    create(:order, status: 2)
    create(:order, status: 2)
    create(:order, status: 3)

    expect(Order.cancelled.count).to eq(2)
  end

  it 'can be find all by status: completed' do
    create(:order, status: 3)
    create(:order, status: 3)
    create(:order, status: 1)

    expect(Order.completed.count).to eq(2)
  end
end