{{- define "common.apiLabels" -}}
app: {{ .Release.Name }}-api
helm.sh/chart: {{ include "common.chart" . }}
{{ include "common.apiSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "common.apiSelectorLabels" -}}
app.kubernetes.io/name: {{ include "common.name" . }}-api
app.kubernetes.io/instance: {{ .Release.Name }}-api
{{- end }}
