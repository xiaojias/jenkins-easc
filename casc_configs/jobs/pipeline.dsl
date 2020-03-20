listView('job-dsl-plugin-dsl') {
    description('All new jobs for Job DSL')
    filterBuildQueue()
    filterExecutors()
    jobs {
        regex(/job-dsl-plugin.+/)
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

pipelineJob('job-dsl-plugin-app01-dsl') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('git@github.com:xiaojias/devops-cicd.git')
                        credentials('credential-github-xiaojias')
                    }
                    branch('*/wip')
                    scriptPath('app01.Jenkinsfile')
                }
            }
        lightweight()
        }
    }
}

pipelineJob('job-dsl-plugin-app02-dsl') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('git@github.com:xiaojias/devops-cicd.git')
                        credentials('credential-github-xiaojias')
                    }
                    branch('*/wip')
                    scriptPath('app02.Jenkinsfile')
                }
            }
        lightweight()
        }
    }
}