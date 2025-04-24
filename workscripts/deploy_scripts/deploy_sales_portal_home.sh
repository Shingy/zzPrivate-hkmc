# ln -s ../../zzPrivate-hkmc/workscripts/deploy_scripts/deploy_sales_portal_home.sh zzdeploy

cd /home/user/projects/Workspace_2/sales_portal_home

../zzcf_login $1 $2

ZEXIST_NODE=`find ./* -name "node_modules"`
if [ "$ZEXIST_NODE" == "" ];
then
    echo -e "\nnpm install\n"
    npm i
else
  echo -e "\nnode_modules exist\n"
fi

npm run $1-home

echo -e "\nnpm build\n"
npm run build

echo -e "\nstart deploy\n"
npm run deploy
echo -e "\nend of deploy : ${1^^}_${2^^}\n"

if [ "${2,,}" == "del" ] || [ "${2,,}" == "delete" ] || [ "${3,,}" == "del" ] || [ "${3,,}" == "delete" ];
then
    echo -e "start delete node_modules\n"
    find ./* -name "node_modules" -exec rm -Rf {} +
    echo -e "end of delete node_modules\n"
fi

ZCHECK_MTA=`find ./* -name "Makefile_*.mta"`
if [ "$ZCHECK_MTA" != "" ];
then
  echo Delete Makefile_*.mta files
  rm Makefile_*.mta
fi
