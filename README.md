# html2pdf-ws

Web-service based on aquavitae/docker-weasyprint

## PDF Generator

The following endpoints are available:

- POST to `/pdf?filename=myfile.pdf`. The body should contain html
- POST to `/multiple?filename=myfile.pdf`. The body should contain a JSON list of html strings. They will each be rendered and combined into a single pdf
