{{- define "diq.authorizationPolicy" -}}
{{- if .Values.mesh.allowedPrincipals -}}
{{- $name := include "diq.fullname" . -}}
apiVersion: security.istio.io/v1
kind: AuthorizationPolicy
metadata:
  name: {{ $name }}-callers
  labels:
    {{- include "diq.labels" . | nindent 4 }}
spec:
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ $name }}
  action: ALLOW
  rules:
    - from:
        - source:
            principals:
              {{- range .Values.mesh.allowedPrincipals }}
              - {{ . | quote }}
              {{- end }}
{{- end -}}
{{- end -}}
