###############################################################################################
#
#    Apis
#
###############################################################################################
{{- define "ws-flare-gateway.fullname" -}}
{{- printf "%s-ws-flare-gateway" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ws-flare-ui.fullname" -}}
{{- printf "%s-ws-flare-ui" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ws-flare-graphql.fullname" -}}
{{- printf "%s-ws-flare-graphql" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ws-flare-user-api.fullname" -}}
{{- printf "%s-ws-flare-user-api" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ws-flare-projects-api.fullname" -}}
{{- printf "%s-ws-flare-projects-api" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "ws-flare-jobs-api.fullname" -}}
{{- printf "%s-ws-flare-jobs-api" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

###############################################################################################
#
#    Databases
#
###############################################################################################
{{- define "storage-mysql.fullname" -}}
{{- printf "%s-storage-mysql" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
