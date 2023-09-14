fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
version '1.0.0'

server_scripts {
	'server/main.lua'
}

client_scripts {
	'client/main.lua',
}


files({
	"html/html.html",
	"html/style.css",
	"html/Heebo-Bold.ttf",
	"html/app.js"
})

ui_page "html/html.html"
