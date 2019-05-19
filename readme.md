# ws-flare-helm-chart

## Setup

This is the main helm chart for the ws-flare platform. 
This is designed to run on Google Kubernetes Engine.

## Prerequisites

This has only been tested on linux. I have not tested this on windows.

You will need to have a GKE account. To setup one go here [https://cloud.google.com/kubernetes-engine/](https://cloud.google.com/kubernetes-engine/).
Next go to the GKE console which can be found here [https://console.cloud.google.com](https://console.cloud.google.com).

Select "Kubernetes Engine" -> "Clusters" -> "Create Cluster". Select the following settings for the cluster.
*Note* the number of nodes can be any number but 10 is a good number for simulating heavy loads
The minimum Machine Type needs to be "Small - 1 Shared vCPU". Anything under this and MySQl and RabbitMQ will not start

| Number Of Nodes | Machine Type          |
|-----------------|-----------------------|
| 10              | Small - 1 Shared vCPU |

Once the cluster is created, a "Connect" button will appear on the cluster listing.
This will open a modal dialog with a command to connect to the cluster. Before running this command you need
to have the gcloud tools installed for your operating system. Instructions on how to install this tool are here
[https://cloud.google.com/appengine/docs/standard/go/download](https://cloud.google.com/appengine/docs/standard/go/download).
Once this is installed you can use the command given to connect to the cluster.

Next you will need to install helm package manager for kubernetes. Installation instructions can be found here
[https://helm.sh/docs/using_helm/#installing-helm](https://helm.sh/docs/using_helm/#installing-helm)

To deploy the application to GKE run the command below

```
./gke.bsh
```

This may take a few seconds to run. It will install helm and tiller onto the cluster then it will install this chart.
If for some reason the script fails you can run the command below manually to install the chart.

```
helm upgrade --install prod . --set environment=prod
```

The installation takes a few minutes. However you will need to wait about 10 minutes for GKE to assign an IP address to the cluster.
You can check the IP address by going to "Services" -> "prod-ws-flare-gateway" will show a link. While it is being assigned it will give a status of "Creating Ingress".
Wait for this to turn green and say "Ok". Once the IP address has been assigned you can then connect to the site using the link in the table.

After connecting to the site, you can create a new user by going to "Sign up" then logging in using the same credentials.

### Create Project

After logging in you can create a project by clicking the + button on the bottom right hand corner.

### Create Task

After creating a project, you will need to have a test web socket server deployed on Cloud Foundry before creating a task. Once you have cloud foundry login details and a web socket server deployed you can create a task in your project using the + button in the bottom right hand corner.
Provide the required details to the application and create the task.

An example script is provided below which simulates 5000 web socket connections.

```
[
    {
        "start": 0,
        "timeout": 55,
        "totalSimulators": 5000,
        "target": "wss://my-server:4443",
    }
]
```

### Start a Test Job

After creating a task you can start stress testing the web socket server deployed on Cloud Foundry. Click the run button on the bottom right hand corner of the screen when in a task to start a new job. The results will come in in real time. Clicking on the started job brings you to the results screen.

### Generate a CI Token for a task

When in a project click on the ellipses for the task you wish to generate a ci token. This will open a modal which displays the token.
