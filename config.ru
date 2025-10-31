class Application
  def call(env)
    headers = { "Content-Type" => "text/plain" }
    body = [ "Hello, World!\n" ]

    [200, headers, body]
  end
end

run Application.new
