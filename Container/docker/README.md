
# jenkins-agent-docker 
![](https://badgen.net/docker/pulls/craftingit/jenkins-agent-docker?icon=docker&label=pulls)
![](https://badgen.net/docker/stars/craftingit/jenkins-agent-docker?icon=docker&label=stars)
![](https://badgen.net/github/release/craftingitde/jenkins-agent/stable)

Extension of the [JenkinsCI/docker-slave](https://github.com/jenkinsci/docker-slave) repository.

## Sample Configuration
```yaml
agent_docker:
    image: craftingit/jenkins-agent-docker
    restart: always
    privileged: true
    environment:
     - TZ="Europe/Berlin"
     - JENKINS_URL=https://jenkins.example.de/
     - JENKINS_SECRET=SuperSecret
     - JENKINS_AGENT_NAME=Docker
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock
```