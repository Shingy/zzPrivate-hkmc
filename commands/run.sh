./cf_login.sh $1 $2
if [ $? -ne 0 ];
then
    cd /home/user/projects/zzPrivate/commands
    ./cf_login.sh $1 $2
fi

cd /home/user/projects/Workspace_2/sales_portal

ZZ_CURR_SPACE=`cf target|grep space`

ZEXIST_APP_NODE=`find ./approuter-local/* -name "node_modules"`
ZEXIST_NODE=`find ./* -name "node_modules"`
if [ "$ZEXIST_NODE" == "" ] || [ "$ZEXIST_APP_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
    cd approuter-local
    npm i
    cd ..
else
  echo -e "\nnode_modules exist\n"
fi

if [ "$2" != "" ];
then
    npm run ${1,,}-${2,,}-setting
else
    npm run ${1,,}-temp-setting
fi

echo -e "start local approuter : ${ZZ_CURR_SPACE:16}\n"
npm run approuter
