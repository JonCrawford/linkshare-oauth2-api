module Linkshare
  class Coupon
  	def getCoupons(query = {})
  		Linkshare.token.get(Linkshare::API_URIS[:coupon], :params => query)
  	end
  end
end