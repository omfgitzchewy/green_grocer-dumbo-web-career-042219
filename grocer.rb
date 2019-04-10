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
  final = {}
  cart.each do |name, description|
    if final.key?(name) == false
      final[name] = {}
    end
    # description.each do |element|
      if description[:clearance] == true
        final[name][:price] = (cart[name][:price] * 0.8).round(2)
      else
        final[name][:price] = cart[name][:price]
      end
      final[name][:clearance] = cart[name][:clearance]
      final[name][:count] = cart[name][:count]
    # end
  end
  final
end

def checkout(cart, coupons)
  # code here
end
