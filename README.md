This is a bare-bones template project for generating GCP CI/CD and Terraform manifests (Helm files, Spinnaker JSON, Cloudbuild.yaml, Terraform files for CloudBuild trigger) with project specific information. This template repo also allows the optional generation of :
* NodeJS example source code, package.json and a Docker file for a "Hello World" application
* CloudSQL settings for Helm file(s)
* CloudSQL Terraform file for a **PostGres** DB

**Pre-requisite:** GCP Project, GCP Namespace and Spinanker Service Account should already be acquired before running next steps

**Pre-requisites for CloudSQL:** CloudSQL Instance, Google Service Account (GSA), Kubernetes Service Account (KSA)
# Setup

### Create a repository from this template

1. Click the big green button `Use this template` or click <a href="../../generate">here</a>.
2. Enter a Repository name and click `Create repository from template`
3. Head over to the created repository and complete the setup.

### Complete setup

1. In the a new repository, <a href="../../edit/main/cookiecutter.json">complete the project setup</a> by editing the `cookiecutter.json` file. 
   
   **Important:** A GitHub Action will kick in as soon as the first commit is done to generate the manifests. So the **fully populated** `cookiecutter.json` **should be the first commit**
2. Add the desired source code folder, a Docker file and update the files under `/helm` directory as required
3. (Optional) Update files under `/helm` directory. The following parameters may required to be changed depending on your Docker file and source code: `command`, `commandArgs`, `livenessProbe` and `readinessProbe`
  

### Expected Output
The following files should be generated with the parameters provided in `cookiecutter.json` file
1. `cloubuild.yaml`
2. Helm files under `/helm` directory
3. A file containing Spinnaker Pipeline JSON data under `/spinnaker` directory. This can be copied over to Spinnaker to create a new pipeline
4. Terraform files under `/terraform` directory

### I have a repository and some source code. Now what?
1. Create a GCP CloudBuild trigger for your repository
2. Run a CloudBuild and if everything was set up correctly, your Spinnaker pipeline should deploy to the GKE Cluster and GKE Namespace you put in the `cookiecutter.json` file.

# cookiecutter.json
The following attributes defined in this file is used to generate all the manifests

### General Attributes (Mandatory)

Attribute | Description
------------ | -------------
name | Name of the Project/Application. This really only affects the readme file
chart | HELM Chart Version#
application | Name of the application. Can be the same as name. Spinnaker pipelines and GKE Deployments will contain this name
namespace | GKE Namespace
clusterNp | GKE Non Production Cluster
clusterPr | GKE Production Cluster
cmdbId | CMDB ID
costCentre | Cost Centre
organization | Usually "CIO"
mailingList | Any notifications will be sent here
spinnakerServiceAccount | Spinnaker Service Account created by Cloud CoE
port | The PORT that will be exposed via a service

### CloudBuild Trigger Attribute (Mandatory)
Attribute | Description
------------ | -------------
githubRepo | Name of **this** repository (without the "/telus/")

### CloudSQL Attributes (optional)
Attribute | Description
------------ | -------------
**cloudsql** | **If set to true, helm files will contain CloudSQL Proxy and RBAC configuration and a Terraform file will be created**
gcpProjectIdNp | Non Production GCP Project ID
gcpProjectIdPr | Production GCP Project ID
cloudsqlConnNameNp | Non Production Connection name as seen in the GCP CloudSQL Console. [More Info](https://cloud.google.com/sql/docs/postgres/instance-info#connect_to_this_instance)
cloudsqlConnNamePr | Production Connection name as seen in the GCP CloudSQL Console
gsa | GCP Service Account, created via terraform
ksa | Kubernetes Service Account, created via terraform

### NodeJS Example Source Code (optional)
Attribute | Description
------------ | -------------
**nodejs** | **If set to true, A source code folder, package.json and a Dockerfile will be included**
