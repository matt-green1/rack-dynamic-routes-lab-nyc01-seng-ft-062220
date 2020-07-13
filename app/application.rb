#not clear why my original solution didn't work see below
#get help and go over this confused about what's happpening 
#in the official solution - on line 15

# class Application

  #   @@items = []
  #   def call(env)
  #     resp = Rack::Response.new
  #     req = Rack::Request.new(env)
  
  #     if req.path.match(/items/)
  #       item_name = req.path.split("/items/").last
  #       #what is happening in this line?!
  #       if item =@@items.find{|i| i.name == item_name}
  #         resp.write item.price
  #       else 
  #         resp.status = 400
  #         resp.write "Item not found"
  #       end
  #     else
  #       resp.status=404
  #       resp.write "Route not found"
  #     end
  #     resp.finish
  #   end
  
  # end




#-----------not sure why my answer didn't work below -----------

#require 'pry'

class Application
    @@items = []
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            item_instance = @@items.find{|item|
                item.name == item_name}
            
                if item_instance
                    resp.write item_instance.price
                else
                    resp.write "Item not found"
                    resp.status = 400
                end
            

        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end