ZK_VER=5.0.7-FL-2011-04-20
ZKGRAILS_VER=1.1-M1

cd zkgrails-aspect
./build.sh $ZK_VER

cd ..
cd zkgrails
./copylib ../zkgrails-aspect/injar/zkee-bin-eval-$ZK_VER
grails clean && grails package-plugin

cd ..
cd zkgrails-ee
./copylib ../zkgrails-aspect/injar/zkee-bin-eval-$ZK_VER
grails clean && grails package-plugin

cd ..
cd zkgrails-hibernate
grails install-plugin --non-interactive ../zkgrails/grails-zk-$ZKGRAILS_VER.zip
grails clean && grails package-plugin

cd ..
cd zkgrails-codemirror
grails install-plugin --non-interactive ../zkgrails/grails-zk-$ZKGRAILS_VER.zip
grails clean && grails package-plugin

