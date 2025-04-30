# rm zzdeploy_all
# ln -s ../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_all.sh zzdeploy_all

cd /home/user/projects/Workspace_2

./zzcf_login $1 $2

cd sales_portal
./zzdeploy $1 $2

# cd sales_portal_admin
cd ../sales_portal_admin
./zzdeploy $1 $2

cd ../sales_portal_api
./zzdeploy $1 $2

# cd ../sales_portal_backend
# ./zzdeploy $1 $2

cd ../sales_portal_collaboration
./zzdeploy $1 $2

cd ../sales_portal_home
./zzdeploy $1 $2
