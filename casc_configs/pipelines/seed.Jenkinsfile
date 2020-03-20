// Create Pipelines from DSL files

def source_git = 'https://github.com/xiaojias/jenkins-easc.git'

properties([
    buildDiscarder(
        logRotator(artifactDaysToKeepStr: '10', artifactNumToKeepStr: '10', daysToKeepStr: '10', numToKeepStr: '20')),
    parameters([
        gitParameter(
            name: 'branch_name',
            description: 'Branch Name ( or TAG name)',
            type: 'PT_BRANCH_TAG'
            userRemoteConfigs: [[url: "${source_git}"]]
        )
    ])
])

node('linux-x86_64'){
    stage("Clone codes"){
        deleteDir()	
        println "Jenkins worker os is unix: ${isUnix()}"

        checkout([$class: 'GitSCM', 
                branches: [[name: "${params.branch_name}"]], 
                userRemoteConfigs: [[url: "${source_git}"]]]
                )        
    }

    stage('Seed Jobs'){
        println "Seed jobs from all .dsl files"

        jobDsl ingoreMissingFiles: true, removedJobAction: 'DISABLE', sandbox: true,
            targets: """
                casc_configs/jobs/*.dsl
            """
    }
}