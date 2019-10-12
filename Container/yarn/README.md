# jenkins-agent-yarn
![](https://badgen.net/docker/pulls/craftingit/jenkins-agent-yarn?icon=docker&label=pulls)
![](https://badgen.net/docker/stars/craftingit/jenkins-agent-yarn?icon=docker&label=stars)
![](https://badgen.net/github/release/craftingitde/jenkins-agent/stable)

Extension of the [JenkinsCI/docker-slave](https://github.com/jenkinsci/docker-slave) repository.

## Sample configuration
````yaml
agent_yarn:
    image: craftingit/jenkins-agent-yarn
    restart: always
    environment:
     - TZ="Europe/Berlin"
     - JENKINS_URL=https://jenkins.example.de/
     - JENKINS_SECRET=SuperSecret
     - JENKINS_AGENT_NAME=Docker-Yarn
    volumes:
      - /etc/localtime:/etc/localtime:ro
```