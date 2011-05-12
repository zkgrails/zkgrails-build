cd $1

grails release-plugin -zipOnly -skipDocs -username=$CODEHAUS_ACC -password=$CODEHAUS_PWD -message="release $1"

cd..

