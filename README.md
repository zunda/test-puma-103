# Test PUma 103
A minimal app to respond with 103 Early Hints

## Usage
Local:

```sh
$ bundle install
$ bundle exec puma &
$ curl -i http://localhost:3000
HTTP/1.1 103 Early Hints
Link: </style.css>; rel=preload; as=style

HTTP/1.1 200 OK
content-type: text/html
link: </style.css>; rel=preload; as=style
content-length: 154

<html>
<head>
<title>Hello</title>
<link rel="stylesheet" href="style.css" type="text/css" media="all">
</head>
<body><p>Hello, World!</p></body>
</html>
```

Heroku:

```sh
$ heroku create
$ git push heroku
$ heroku open
```
