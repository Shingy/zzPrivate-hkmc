# rm zzdeploy_all
# ln -s ../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_all.sh zzdeploy_all

cd /home/user/projects/Workspace_2

# ./zzcf_login $1 $2

echo -e "start deploy sales_portal\n"

cd sales_portal
./zzdeploy $1 $2

echo -e "end of deploy sales_portal\n"

echo -e "start deploy sales_portal_admin\n"

cd ../sales_portal_admin
./zzdeploy $1 $2

echo -e "end of deploy sales_portal_admin\n"

echo -e "start deploy sales_portal_api\n"

cd ../sales_portal_api
./zzdeploy $1 $2

echo -e "end of deploy sales_portal_api\n"

echo -e "start deploy sales_portal_backend\n"

cd ../sales_portal_backend
# ./zzcds_deploy $1 $2
./zzdeploy $1 $2

echo -e "end of deploy sales_portal_backend\n"

echo -e "start deploy sales_portal_collaboration\n"

cd ../sales_portal_collaboration
./zzdeploy $1 $2

echo -e "end of deploy sales_portal_collaboration\n"

echo -e "start deploy sales_portal_home\n"

cd ../sales_portal_home
./zzdeploy $1 $2

echo -e "end of deploy sales_portal_home\n"