# kaytu-agent chart
## Usage

Refer to the [kaytu-charts](https://github.com/kaytu-io/kaytu-charts) README for instructions on how to add the kaytu-io repo.

### Values
| Key                                                                            | Type   | Default                                                          | Description                                                                                                                                                                                                                                            |
|--------------------------------------------------------------------------------|--------|------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `kaytu.agent.grpc_port`                                                        | uint16 | `8001`                                                           | The port the agent listens on for gRPC requests.                                                                                                                                                                                                       |
| `kaytu.agent.image.name`                                                       | string | `"ghcr.io/kaytu-io/kaytu-agent"`                                 | The image name to use for the agent.                                                                                                                                                                                                                   |
| `kaytu.agent.image.tag`                                                        | string | \<Dependant on chart version\>                                   | The image tag to use for the agent.                                                                                                                                                                                                                    |
| `kaytu.agent.storage.class`                                                    | string | `""`                                                             | The storage class to use for the agent.                                                                                                                                                                                                                |
| `kaytu.agent.storage.size`                                                     | string | `"1Gi"`                                                          | The size of the storage to use for the agent.                                                                                                                                                                                                          |
| `kaytu.kaytu.observabilityDays`                                                | uint32 | `14`                                                             | The number of days to fetch observability data in a single cycle.                                                                                                                                                                                      |
| `kaytu.kaytu.authToken` <span style="color:red">\<*REQUIRED*></span>           | string | `"XXX"`                                                          | The auth token to use for the agent.                                                                                                                                                                                                                   |
| `kaytu.kaytu.prometheus.address` <span style="color:red">\<*IMPORTANT*></span> | string | `"http://prometheus-operated.monitoring.svc.cluster.local:9090"` | The address of the Prometheus compatible endpoint to fetch observability data from. if you are using a VictoriaMetrics cluster (not single server) the endpoint will look like `http://vmselect.monitoring.svc.cluster.local:8428/select/0/prometheus` |
| `kaytu.kaytu.prometheus.auth.username`                                         | string | `""`                                                             | The username to use for basic auth when fetching observability data. Conflicts with oauth2 fields below, default is empty for no auth                                                                                                                  |
| `kaytu.kaytu.prometheus.auth.password`                                         | string | `""`                                                             | The password to use for basic auth when fetching observability data. Conflicts with oauth2 fields below, default is empty for no auth                                                                                                                  |
| `kaytu.kaytu.prometheus.auth.clientId`                                         | string | `""`                                                             | The client id to use for oauth2 when fetching observability data. Conflicts with basic auth fields above, default is empty for no auth                                                                                                                 |
| `kaytu.kaytu.prometheus.auth.clientSecret`                                     | string | `""`                                                             | The client secret to use for oauth2 when fetching observability data. Conflicts with basic auth fields above, default is empty for no auth                                                                                                             |
| `kaytu.kaytu.prometheus.auth.tokenUrl`                                         | string | `""`                                                             | The token url to use for oauth2 when fetching observability data. Conflicts with basic auth fields above, default is empty for no auth                                                                                                                 |
| `kaytu.kaytu.prometheus.auth.scopes`                                           | string | `""`                                                             | The comma seperated scopes to use for oauth2 when fetching observability data. Conflicts with basic auth fields above, default is empty for no auth                                                                                                    |

### Installing the Chart
1. Get the values file for the chart:
    ```shell
    helm show values kaytu-io/kaytu-agent > kaytu-agent-values.yaml
    ```
2. Edit the values file to suit your needs. be sure to set the `kaytu.kaytu.authToken` and verify the `kaytu.kaytu.prometheus.address` value.
3. Install the kaytu-agent chart:
    ```shell
    helm install --create-namespace -n kaytu-system my-kaytu-agent kaytu-io/kaytu-agent -f kaytu-agent-values.yaml
    ```

### Uninstalling the Chart

To uninstall the chart:
```shell
helm delete my-kaytu-agent
```
