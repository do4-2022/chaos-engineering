resource "helm_release" "chaos-mesh" {
  repository = "https://charts.chaos-mesh.org"
  chart = "chaos-mesh"
  name = "chaos-mesh"
  namespace = "chaos-mesh"
  atomic = true
  cleanup_on_fail = true
  create_namespace = true   

  values = [
    file("${path.module}/values/values.yaml")
  ]
}

resource "kubectl_manifest" "app_ns" {
  yaml_body = <<-YAML
apiVersion: v1
kind: Namespace
metadata:
  annotations:
    chaos-mesh.org/inject: enabled
  name: app
  YAML
}