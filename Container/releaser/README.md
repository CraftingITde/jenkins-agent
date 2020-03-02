
# jenkins-agent-releaser 
![](https://badgen.net/docker/pulls/craftingit/jenkins-agent-releaser?icon=docker&label=pulls)
![](https://badgen.net/docker/stars/craftingit/jenkins-agent-releaser?icon=docker&label=stars)
![](https://badgen.net/github/release/craftingitde/jenkins-agent-releaser/stable)

Extension of the [JenkinsCI/docker-slave](https://github.com/jenkinsci/docker-slave) repository.

## Sample Configuration
``` yaml
agent_docker:
    image: craftingit/jenkins-agent-releaser
    restart: always
    privileged: true
    environment:
     - TZ="Europe/Berlin"
     - JENKINS_URL=https://jenkins.example.de/
     - JENKINS_SECRET=SuperSecret
     - JENKINS_AGENT_NAME=Docker
    volumes:
      - /etc/localtime:/etc/localtime:ro
```