listView('App01') {
    description('Pipelines for Application 01')
    filterBuildQueue()
    filterExecutors()
    jobs {
        regex(/app01_.+/)
        name('example')
    }
    columns {
        status()
        weather()
        name()
        lastSuccess()
        lastFailure()
        lastDuration()
        buildButton()
    }
}

pipelineJob('app01_pipeline01') {
    definition{
        description("Pipeline 01 for Application: app01")
        cpsScm {
            scm {
                git {
                    remote {
                        url('git@github.com:xiaojias/jenkins-easc.git')
                        credentials('credential-github-xiaojias')
                    }
                    branch('*/wip')
                    scriptPath('app01_pipeline01.Jenkinsfile')
                }
            }
        lightweight()
        }
    }
}

pipelineJob('app01_pipeline02') {
    definition{
        description("Pipeline 02 for Application: app01")
        cpsScm {
            scm {
                git {
                    remote {
                        url('git@github.com:xiaojias/jenkins-easc.git')
                        credentials('credential-github-xiaojias')
                    }
                    branch('*/wip')
                    scriptPath('app01_pipeline02.Jenkinsfile')
                }
            }
        lightweight()
        }
    }
}
