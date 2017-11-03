require 'rails_helper'

describe Ebook do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:price) }
  it { should allow_value(true).for(:published) }
  it { should allow_value(false).for(:published) }
end