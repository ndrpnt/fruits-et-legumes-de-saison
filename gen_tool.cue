package seasons

import (
	"text/template"
	"tool/file"
)

command: gen: {
	read: file.Read & {
		filename: "fruits-et-légumes-de-saison_html.ics.tpl"
		contents: string
	}
	rendered: {
		filename: "fruits-et-légumes-de-saison_html.ics"
		contents: template.Execute(read.contents, months)
	}
	write: file.Create & {
		filename: rendered.filename
		contents: rendered.contents
	}
}
