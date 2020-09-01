#/bin/bash
docker run \
  -e VSTS_ACCOUNT=<ACCOUNT> \
  -e VSTS_TOKEN=<TOKEN> \
  -e VSTS_AGENT='$(hostname)-agent-${RANDOM}' \
  -e VSTS_POOL=aws-agents \
  -e VSTS_WORK='/var/vsts/$VSTS_AGENT' \
  -v /var/vsts:/var/vsts \
   <DOCKERIMAGE>
