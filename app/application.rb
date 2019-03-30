require 'pry'
class Application


  @@items = ["apples","carrots","pears"]
  @@cart = []


  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      if req.path.match(/items/)

        @@items.each do |item|
        resp.write "#{item}\n"

        end

      elsif req.path.match(/search/)

        search_term = req.params["q"]
        resp.write handle_search(search_term)
      elsif req.path.match(/cart/)
        if @@cart.size == 0
          resp.write "Your cart is empty"
        else
          @@cart.each do |i|
          resp.write "#{i}\n"
          end
        end

      elsif req.path.match(/add/)
        add_item = req.params["q"]
        resp.write handle_add(add_item)
      else
        resp.write "Path Not Found"
      end

      def handle_add(search_term)
        if @@items.include?(search_term)
          @@cart.push(search_term.to_s)
        else
          return "We don't have that item"
        end
      end

      binding.pry
      0

    resp.finish
  end

  def handle_add(search_term)
    if @@items.include?(search_term)
      @@cart.push(search_term.to_s)
    else
      return "We don't have that item"
    end
  end


  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end
