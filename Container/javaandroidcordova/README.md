# jenkins-agent-javaandroid
![](https://badgen.net/docker/pulls/craftingit/jenkins-agent-javaandroid?icon=docker&label=pulls)
![](https://badgen.net/docker/stars/craftingit/jenkins-agent-javaandroid?icon=docker&label=stars)
![](https://badgen.net/github/release/craftingitde/jenkins-agent/stable)

Extension of the [JenkinsCI/docker-agent](https://github.com/jenkinsci/docker-agent) repository.

## Sample configuration
```yaml
slave_javaandroid:
    image: craftingit/jenkins-agent-javaandroid
    restart: always    
    environment:
     - TZ="Europe/Berlin"
     - JENKINS_URL=https://jenkins.example.de/
     - JENKINS_SECRET=SuperSecret
     - JENKINS_AGENT_NAME=Docker-javaandroid
    volumes:
      - /etc/localtime:/etc/localtime:ro
```