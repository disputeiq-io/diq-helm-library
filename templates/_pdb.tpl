{{- define "diq.pdb" -}}
{{- if gt (int (.Values.replicaCount | default 1)) 1 -}}
{{- $name := include "diq.fullname" . -}}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ $name }}
  labels:
    {{- include "diq.labels" . | nindent 4 }}
spec:
  minAvailable: {{ .Values.pdb.minAvailable | default 1 }}
  selector:
    matchLabels:
      app.kubernetes.io/name: {{ $name }}
{{- end -}}
{{- end -}}
