{{- define "diq.serviceAccount" -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "diq.fullname" . }}
  labels:
    {{- include "diq.labels" . | nindent 4 }}
automountServiceAccountToken: false
{{- end -}}

{{- define "diq.fullname" -}}
{{- .Values.nameOverride | default .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "diq.labels" -}}
app.kubernetes.io/name: {{ include "diq.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: disputeiq
{{- end -}}
