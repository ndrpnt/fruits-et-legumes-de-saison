BEGIN:VCALENDAR
VERSION:2.0
CALSCALE:GREGORIAN
{{- range $M := .}}
BEGIN:VEVENT
DTSTART;VALUE=DATE:1970{{printf "%02d" $M.current}}01
DTEND;VALUE=DATE:1970{{printf "%02d" $M.next}}01
RRULE:FREQ=YEARLY
SUMMARY:Fruits & Légumes de saison
DESCRIPTION:
{{- range $C := $M.categories -}}
<h2>{{$C.name}}</h2><ul>{{range $I := $C.items}}<li>{{$I}}</li>{{end}}</ul>
{{- end -}}
<p>D'après <a href="https://www.greenpeace.fr/guetteur/calendrier">Greenpeace France</a>.</p>
END:VEVENT
{{- end}}
END:VCALENDAR
