{{- define "dex.postgresHost" -}}
{{- if .Values.externalPostgresql.enabled -}}
{{ .Values.externalPostgresql.endpoint }}
{{- else -}}
{{- include "postgres.endpoint" . -}}
{{- end -}}
{{- end -}}

{{- define "dex.postgresPort" -}}
{{- if .Values.externalPostgresql.enabled -}}
{{ .Values.externalPostgresql.port }}
{{- else -}}
{{- include "postgres.port" . -}}
{{- end -}}
{{- end -}}
