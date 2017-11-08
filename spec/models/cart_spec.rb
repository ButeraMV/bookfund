require 'rails_helper'

RSpec.describe Cart do
  before(:each) do
    create(:ebook)
    create(:ebook)
  end
  subject = Cart.new({"1" => 1, "2" => 1})
  describe "instance methods" do
    describe "#total_count" do
      it 'it can count ebooks in cart' do
        subject.add_item(1)
        subject.add_item(2)
        subject.add_item(3)

        expect(subject.contents).to eq({"1" => 2, "2" => 2, "3" => 1})
      end
    end

    describe "#total_count" do
      it 'can count the total cart' do
        expect(subject.total_count).to eq(5)
      end
    end

    describe '#destroy' do
      it 'can clear the cart' do
        subject.destroy

        expect(subject.contents).to eq({})
      end
    end
  end
end