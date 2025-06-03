cd /home/user/projects/zzPrivate/workscripts/deploy_scripts

../../commands/cf_login.sh $1 $2

source ./__base_import

find /home/user/projects/Workspace_2/zzdeploy_logs -name "_${ZZ_CURR_SPACE:16}_*.log" -mtime +2 -delete
./__deploy_sales_portal.sh $1 $2 $3 > /home/user/projects/Workspace_2/zzdeploy_logs/_${ZZ_CURR_SPACE:16}_`date -d "+9 hours" +%y%m%d_%H%M%S`.log
