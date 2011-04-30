#
# Build Script for ZKGrails
#

ZK_VER=`grep zk= zkgrails-build/build.properties | awk -Fzk= '{ print $2 }'`
ZKGRAILS_VER=`grep zkgrails= zkgrails-build/build.properties | awk -Fzkgrails= '{ print $2 }'`

cd zkgrails-aspect
./build.sh $ZK_VER

cd ..
cd zkgrails
./copylib ../zkgrails-aspect/injar/zkee-bin-eval-$ZK_VER
grails clean && grails package-plugin


for name in ee hibernate redis mongodb codemirror
do
    cd ..
    cd zkgrails-${name}

    if [ "${name}" == "ee" ]
    then
        ./copylib ../zkgrails-aspect/injar/zkee-bin-eval-$ZK_VER
    fi

    grails install-plugin --non-interactive ../zkgrails/grails-zk-$ZKGRAILS_VER.zip
    grails clean && grails package-plugin
done

