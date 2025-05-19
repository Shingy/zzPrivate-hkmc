# rm zzrun
# ln -s ../../zzPrivate/commands/run_backend.sh zzrun

cd /home/user/projects/Workspace_2/sales_portal_backend

../zzcf_login $1 $2

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi

ZEXIST_NODE=`find ./* -name "node_modules"`
if [ "$ZEXIST_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
else
  echo -e "\nnode_modules exist\n"
fi

if [ "${2,,}" != "prd" ];
then
    echo -e "\n${1,,}-${ZZ_CURR_TARGET,,}-setting\n"
    npm run ${1,,}-${ZZ_CURR_TARGET,,}-setting
else
    echo -e "\n${1,,}-${2,,}-setting\n"
    npm run ${1,,}-${2,,}-setting
fi

echo -e "start spring-boot : ${ZZ_CURR_SPACE:16}\n"
mvn clean spring-boot:run

if [ "${2,,}" == "del" ] || [ "${2,,}" == "delete" ] || [ "${3,,}" == "del" ] || [ "${3,,}" == "delete" ];
then
    echo -e "start delete node_modules\n"
    find ./* -name "node_modules" -exec rm -Rf {} +
    echo -e "end of delete node_modules\n"
fi
