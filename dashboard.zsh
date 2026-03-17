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

# rabbit mq
function k8s_mq {
  kubectl -n c2-production port-forward service/c2-rabbitmq-production 15672:15672 &
  sleep 2s
  open http://localhost:15672
}

# traefik
function k8s_traefik {
  case "$1" in
    public) ns="ingress" ;;
    internal) ns="ingress-internal" ;;
    *) echo "Usage: k8s_traefik {public|internal} [local-port]"; return 1 ;;
  esac

  local port="${2:-8080}"

  kubectl --context prd-azgwc-aks-001 -n "$ns" port-forward svc/traefik-api "$port:8080"
  sleep 2s
  open "http://localhost:$port/dashboard/"
}
