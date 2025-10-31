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

EarlyHintsHeaders = {
  "Link" => "</style.css>; rel=preload; as=style"
}

class Application
  def call(env)
    case env["PATH_INFO"]
    when "/"
      env[Puma::Const::EARLY_HINTS]&.call(EarlyHintsHeaders)
      res = [
        200,
        {
          "Content-Type" => "text/html",
        }.merge(EarlyHintsHeaders),
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
