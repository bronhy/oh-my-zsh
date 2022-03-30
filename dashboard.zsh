# grafana
function k8s_grafana {
 kubectl -n monitoring port-forward service/kube-prometheus-stack-grafana 9060:80 &
 sleep 2s
 open http://localhost:9060
}

# prometheus
function k8s_prometheus {
 kubectl -n monitoring port-forward service/kube-prometheus-stack-prometheus 9061:9090 &
 sleep 2s
 open http://localhost:9061
}

# alert manager
function k8s_alertmanager {
  kubectl -n monitoring port-forward service/kube-prometheus-stack-alertmanager 9062:9093 &
  sleep 2s
  open http://localhost:9062
}
