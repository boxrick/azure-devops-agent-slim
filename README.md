# azure-devops-agent-slim

## What is this

This repo is loosely based on this one
https://github.com/microsoft/vsts-agent-docker

And the docs here:

https://docs.microsoft.com/en-gb/azure/devops/pipelines/agents/docker?view=azure-devops

The main difference being the docs above doesn't appear to remove the agent correctly on shutdown, yet the old Microsoft images do but are obviously deprecated and massive.

I did a little bit of combining of these to produce this.

## ENV vars
* `VSTS_ACCOUNT=<azure_devops_account>`
* `VSTS_TOKEN=<PAT TOKEN>`
* `VSTS_POOL=<AGENT_GROUP_NAME>`

## Running
Install Docker, use run-agent.sh as an example to start

## Supported tags

* `latest`

## License

MIT
