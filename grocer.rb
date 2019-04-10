def consolidate_cart(cart)
  final = {}
  cart.each do |hash|
    hash.each do |name, description|
      if final[name]
        final[name][:count] += 1
      else
        final[name] = description
        final[name][:count] = 1
      end
    end
  end
  final
end

def apply_coupons(cart, coupons)
  final = {}
  cart.each do |name, description|
    coupons.each do |coupon|
    if cart[:item] == name
      cart[name][:count] = cart[name][:count] - coupon[:num]
      if final[name + " W/COUPON"]
        final[name + " W/COUPON"][:count] += 1
      else
        final[name + " W/COUPON"] = {:price => coupons[:cost], :clearance => true, :count => 1}
      end
    end
    end
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
