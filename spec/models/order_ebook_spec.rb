require 'rails_helper'

describe OrderEbook, type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:ebook) }
end