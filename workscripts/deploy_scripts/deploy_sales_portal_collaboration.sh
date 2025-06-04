cd /home/user/projects/zzPrivate/workscripts/deploy_scripts

../../commands/cf_login.sh $1 $2

source ./__base_import

find /home/user/projects/Workspace_2/zzdeploy_logs -name "_${ZZ_LOG_SPACE}_collaboration_*.log" -mtime +2 -delete
./__deploy_sales_portal_collaboration.sh $1 $2 $3 > /home/user/projects/Workspace_2/zzdeploy_logs/_${ZZ_LOG_SPACE}_collaboration_`date -d "+9 hours" +%y%m%d_%H%M%S`.log
