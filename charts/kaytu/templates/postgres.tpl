
{{- define "postgres.endpoint" -}}
{{- if .Values.externalPostgresql.enabled }}
{{- printf .Values.externalPostgresql.endpoint }}
{{- else }}
{{- printf "{{ .Release.Namespace }}-postgresql-primary.{{ .Release.Namespace }}.svc.cluster.local" }}
{{- end }}
{{- end }}

{{- define "postgres.port" -}}
{{- if .Values.externalPostgresql.enabled }}
{{- printf .Values.externalPostgresql.port }}
{{- else }}
{{- printf "5432" }}
{{- end }}
{{- end }}

{{- define "postgres.masterUser" -}}
{{- if .Values.externalPostgresql.enabled }}
{{- printf .Values.externalPostgresql.masterUser }}
{{- else }}
{{- printf "postgres" }}
{{- end }}
{{- end }}

{{- define "postgres.masterPassword" -}}
{{- if .Values.externalPostgresql.enabled }}
{{- printf .Values.externalPostgresql.masterPassword }}
{{- else }}
{{- printf .Values.postgresql.global.postgresql.auth.postgresPassword }}
{{- end }}
{{- end }}

{{- define "postgres.sslMode" -}}
{{- if .Values.externalPostgresql.enabled }}
{{- printf .Values.externalPostgresql.sslMode }}
{{- else }}
{{- printf "disable" }}
{{- end }}
{{- end }}