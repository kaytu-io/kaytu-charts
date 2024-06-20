# kaytu-charts
## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

`helm repo add kaytu-io https://kaytu-io.github.io/kaytu-charts`

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
kaytu-io` to see the charts.

## Charts

[**kaytu-agent**](https://github.com/kaytu-io/kaytu-charts/blob/main/charts/kaytu-agent/): Kubernetes agent to gather and run optimizations suggestions regularly and asynchronously.

