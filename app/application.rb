class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
    item = req.path.split("/items/").last
      if !item
        resp write "Item not found"
      else
        resp.write "#{item.price}"
    end
  elsif req.path=="/items"
      resp.write "You requested the items"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
