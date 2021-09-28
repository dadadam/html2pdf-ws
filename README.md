# html2pdf-ws

Web-service based on aquavitae/docker-weasyprint

## PDF Generator

The following endpoints are available:

- POST to `/pdf?filename=myfile.pdf`. The body should contain html
- POST to `/multiple?filename=myfile.pdf`. The body should contain a JSON list of html strings. They will each be rendered and combined into a single pdf


## Installed fonts
- Alegreya-Sans
- Alegreya
- Alice
- Amatic_SC
- Balsamiq-Sans
- Cairo
- Caveat
- Fira_Sans
- Lato
- Mulish
- Open_Sans_Condensed
- Play
- Roboto_Mono
- Comfortaa
- Fira_Sans_Condensed
- M_PLUS_Rounded_1c
- Noto_Sans
- PT_Mono
- Poiret_One
- Source_Code_Pro
- Cormorant_Garamond
- Fira_Sans_Extra_Condensed
- Manrope
- Noto_Sans_Display
- PT_Sans_Caption
- Press_Start_2P
- Source_Serif_Pro
- Didact_Gothic
- IBM_Plex_Serif
- Maven_Pro
- Nunito
- PT_Sans_Narrow
- Raleway
- Space_Grotesk
- Dosis
- Inconsolata
- Montserrat
- Nunito_Sans
- Pacifico
- Roboto
- Space_Mono
- Exo_2
- Istok_Web
- Montserrat_Alternates
- Open_Sans
- Philosopher
- Roboto_Condensed
- Ubuntu