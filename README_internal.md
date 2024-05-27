# Context

API Protect devs need a way to experiment and evaluate all the API Protect products. 
Crapi offers services that cover most. 
A developer will deploy to dt-crapi for research or qa.

Therefore, a VM has been setup in our [GCP project](https://console.cloud.google.com/welcome?project=dt-crapi)
to deploy crAPI.


## VM configuration

- The firewall rules are set to only allow internal connections (GCP) and specific devs IP v4 addresses - see [this page](https://console.cloud.google.com/networking/firewalls/list?project=dt-crapi) 
- Docker was installed following [these instructions](https://docs.docker.com/engine/install/ubuntu/)
- Docker was configured to allow to run it without `sudo` and to start automatically when the VM starts
using [these instructions](https://docs.docker.com/engine/install/linux-postinstall/)
- GCP project `dt-crapi` contains a service account to allow the bitbucket pipeline to connect via SSH.
The SA has been created with "Compute OS Admin Login" and "Service Account User" permissions
- The bitbucket project `dt-crapi` contains a public SSH key from the VM to allow the latter
to `git pull` the repo
