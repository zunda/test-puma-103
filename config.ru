Page = <<_HTML
<html>
<head>
<title>Hello</title>
<link rel="stylesheet" href="style.css" type="text/css" media="all">
</head>
<body><p>Hello, World!</p></body>
</html>
_HTML

Style = <<_CSS
body{
  color: #0000F0;
}
_CSS

class Application
  def call(env)
    case env["PATH_INFO"]
    when "/"
      res = [
        200,
        {
          "Content-Type" => "text/html",
          "Link" => "</style.css>; rel=preload; as=style"
        },
        [ Page ]
      ]
    when "/style.css"
      res = [200, { "Content-Type" => "text/css" }, [ Style ]]
    else
      res = [404, {}, []]
    end

    res
  end
end

run Application.new
