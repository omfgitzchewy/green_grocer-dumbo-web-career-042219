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
      if coupon[:item] == name && description[:count] >= coupon[:num]
        cart[name][:count] = cart[name][:count] - coupon[:num]
        if final[name + " W/COUPON"]
          final[name + " W/COUPON"][:count] += 1
        else
          final[name + " W/COUPON"] = {:price => coupon[:cost], :clearance => cart[name][:clearance], :count => 1}
        end
      end
    end
    final[name] = description
  end
  final
end

def apply_clearance(cart)
  cart.map do |name,description|
    description.map do |k,v|
      if description[k] == :clearance
        description[:price] = (description[:price] * 0.8).round(2)
      end
    end
  end
end

def checkout(cart, coupons)
  # code here
end
