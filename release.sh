cd zkgrails

grails release-plugin -zipOnly -skipDocs -username=$CODEHAUS_ACC -password=$CODEHAUS_PWD -message="release ZKGrails"

cd..

for name in ee hibernate redis mongodb codemirror
do
    cd zkgrails-${name}

    grails release-plugin -zipOnly -skipDocs -username=$CODEHAUS_ACC -password=$CODEHAUS_PWD -message="release zk-${name}"

    cd ..
done

