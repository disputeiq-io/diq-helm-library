{{- define "diq.service" -}}
{{- $name := include "diq.fullname" . -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ $name }}
  labels:
    {{- include "diq.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type | default "ClusterIP" }}
  selector:
    app.kubernetes.io/name: {{ $name }}
  ports:
    - name: http
      port: {{ .Values.service.port | default 8080 }}
      targetPort: http
      protocol: TCP
{{- end -}}
