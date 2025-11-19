{{- define "cluster.name" -}}
    {{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "awsmachinetemplate.controlplane.name" -}}
    {{- include "cluster.name" . }}-cp-mt
{{- end }}

{{- define "awsmachinetemplate.worker.name" -}}
    {{- include "cluster.name" . }}-worker-mt
{{- end }}

{{- define "awsmachinetemplatearm64.worker.name" -}}
    {{- include "cluster.name" . }}-worker-mt-arm64
{{- end }}

{{- define "k0scontrolplane.name" -}}
    {{- include "cluster.name" . }}-cp
{{- end }}

{{- define "k0sworkerconfigtemplate.name" -}}
    {{- include "cluster.name" . }}-machine-config
{{- end }}

{{- define "k0sworkerconfigtemplatearm64.name" -}}
    {{- include "cluster.name" . }}-machine-config-arm64
{{- end }}

{{- define "machinedeployment.name" -}}
    {{- include "cluster.name" . }}-md
{{- end }}

{{- define "machinedeploymentarm64.name" -}}
    {{- include "cluster.name" . }}-md-arm64
{{- end }}

{{- define "authentication-config.fullpath" -}}
    {{- include "authentication-config.dir" . }}/{{- include "authentication-config.file" . }}
{{- end }}

{{- define "authentication-config.dir" -}}
    /etc/k0s/auth
{{- end }}

{{- define "authentication-config.file" -}}
    {{- if .Values.auth.configSecret.hash -}}
    config-{{ .Values.auth.configSecret.hash }}.yaml
    {{- else -}}
    config.yaml
    {{- end -}}
{{- end }}
