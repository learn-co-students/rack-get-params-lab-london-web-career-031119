class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = ["Apples", "Oranges"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/cart/)
        @@cart.each do |x|
        resp.write "#{x}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
      else
        resp.write "Path Not Found"
      end
    resp.finish
  end

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end

end


# class Application
 
#   @@items = ["Apples","Carrots","Pears"]
 
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
 
#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)
 
#       search_term = req.params["q"]
 
#       if @@items.include?(search_term)
#         resp.write "#{search_term} is one of our items"
#       else
#         resp.write "Couldn't find #{search_term}"
#       end
 
#     else
#       resp.write "Path Not Found"
#     end
 
#     resp.finish
#   end
end

#TODO Emails 
# ! jajd
# ? 
#////fernando
# normal