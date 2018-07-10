class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item.price}\n"
      else
        resp.write "Item not found"
      end
    end
    if req.path=="/items"
      resp.write "You requested the items"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
end
