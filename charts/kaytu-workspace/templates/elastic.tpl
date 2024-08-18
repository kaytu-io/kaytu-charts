{{- define "elastic.envs"}}
{{- if eq (.Values.kaytu.aksOpensearch.enabled | toString) "true" }}
- name: ELASTICSEARCH_ADDRESS
  value: "https://opensearch-cluster-master.{{ .Release.Namespace }}.svc.cluster.local:9200"
- name: ELASTICSEARCH_USERNAME
  value: "admin"
- name: ELASTICSEARCH_PASSWORD
  value: "myStrongPassword@123!"
- name: ELASTICSEARCH_INGESTION_ENDPOINT
  value: "https://{{ .Values.kaytu.opensearch.ingestionPipelineEndpoint }}/resource-sink"
- name: ELASTICSEARCH_ISONAKS
  value: "true"
{{- else if eq (.Values.kaytu.opensearch.enabled | toString) "true" }}
- name: ELASTICSEARCH_ADDRESS
  value: "{{ .Values.kaytu.opensearch.endpoint }}"
- name: ELASTICSEARCH_ISOPENSEARCH
  value: "true"
- name: ELASTICSEARCH_AWS_REGION
  value: "us-east-2"
- name: ELASTICSEARCH_AWSREGION
  value: "us-east-2"
- name: ELASTICSEARCH_INGESTION_ENDPOINT
  value: "https://{{ .Values.kaytu.opensearch.ingestionPipelineEndpoint }}/resource-sink"
- name: ELASTICSEARCH_ASSUME_ROLE_ARN
  value: "arn:aws:iam::{{ .Values.aws.accountID | toString }}:role/opensearch-master-{{ .Release.Namespace }}"
{{- else }}
- name: ELASTICSEARCH_ADDRESS
  value: "https://{{ .Values.elasticsearch.name }}-es-http:9200/"
- name: ELASTICSEARCH_USERNAME
  value: "elastic"
- name: ELASTICSEARCH_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.elasticsearch.name }}-es-elastic-user
      key: elastic
- name: ELASTICSEARCH_INGESTION_ENDPOINT
  value: "https://{{ .Values.kaytu.opensearch.ingestionPipelineEndpoint }}/resource-sink"
{{- end }}
{{- end }}