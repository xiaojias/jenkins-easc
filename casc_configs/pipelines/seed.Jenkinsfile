// Create Pipelines from DSL files

def source_git_test = 'https://github.com/xiaojias/python.git'
def source_git = 'https://github.com/xiaojias/jenkins-easc.git'

properties([
    buildDiscarder(
        logRotator(artifactDaysToKeepStr: '10', artifactNumToKeepStr: '10', daysToKeepStr: '10', numToKeepStr: '20')),
    parameters([
        gitParameter(
            name: 'branch_name_test',
            description: 'Testing Repository - Branch Name ( or TAG name)',
            type: 'PT_BRANCH_TAG',
            defaultValue: 'master'
        ),
        gitParameter(
            name: 'branch_name',
            description: 'Branch Name ( or TAG name)',
            type: 'PT_BRANCH_TAG',
            defaultValue: 'wip'
        )
    ])
])

node(){

    triggers {
        cron('H/15 8-19 * * 1-5')
    }

    stage("Clone codes from Testing Repository"){
        deleteDir()	
        println "Jenkins worker os is unix: ${isUnix()}"

        checkout([$class: 'GitSCM', 
                branches: [[name: "${params.branch_name_test}"]], 
                userRemoteConfigs: [[url: "${source_git_test}"]]]
        )        
    }

    stage("Seed Jobs"){
        deleteDir()	
        println "Jenkins worker os is unix: ${isUnix()}"

        checkout([$class: 'GitSCM', 
                branches: [[name: "${params.branch_name}"]], 
                userRemoteConfigs: [[url: "${source_git}"]]]
        )        

        println "Seed jobs from all .dsl files"

        jobDsl removedJobAction: 'DISABLE', sandbox: true,
            targets: """
                casc_configs/jobs/*.dsl
            """
    }
}