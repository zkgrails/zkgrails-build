#
# Build Script for ZKGrails
#

ZK_VER=$1
ZKGRAILS_VER=$2

cd zkgrails-aspect
./build.sh $ZK_VER

cd ..
cd zkgrails
./copylib ../zkgrails-aspect/injar/zkee-bin-eval-$ZK_VER
grails clean && grails package-plugin

cd ..
cd zkgrails-ee
./copylib ../zkgrails-aspect/injar/zkee-bin-eval-$ZK_VER
grails install-plugin --non-interactive ../zkgrails/grails-zk-$ZKGRAILS_VER.zip
grails clean && grails package-plugin

cd ..
cd zkgrails-hibernate
grails install-plugin --non-interactive ../zkgrails/grails-zk-$ZKGRAILS_VER.zip
grails clean && grails package-plugin

cd ..
cd zkgrails-codemirror
grails install-plugin --non-interactive ../zkgrails/grails-zk-$ZKGRAILS_VER.zip
grails clean && grails package-plugin

