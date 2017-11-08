require 'rails_helper'

describe Ebook do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:price) }
  it { should allow_value(true).for(:published) }
  it { should allow_value(false).for(:published) }

  it 'funding can be updated' do
    ebook = create(:ebook)

    Ebook.add_to_funding(ebook)

    expect(ebook.funding).to eq(10)
    expect(ebook.percent_funded).to eq(5)

    Ebook.add_to_funding(ebook)

    expect(ebook.funding).to eq(20)
    expect(ebook.percent_funded).to eq(10)
  end
end