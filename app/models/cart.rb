class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def cart_total
    running_total = 0
    contents.each do |ebook_id, quantity|
      ebook_cost = Ebook.find(ebook_id).price * quantity
      running_total += ebook_cost
    end
    running_total
  end

  def order_hash
    ebooks = {}
    contents.each do |ebook_id, quantity|
      ebooks[Ebook.find(ebook_id)] = quantity
    end
    ebooks
  end

  def destroy
    @contents.clear
  end

  def cart_total
    total = 0
    contents.each do |ebook_id, quantity|
      ebooks_cost = Ebook.find(ebook_id).price * quantity
      total += ebooks_cost
    end
    total
  end

  def cart_total_stripe
    cart_total.to_s.tr('.', '0')
  end
end
