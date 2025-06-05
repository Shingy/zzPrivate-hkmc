#!/bin/bash
cd /home/user/projects/zzPrivate/workscripts/deploy_scripts

../../commands/cf_login.sh $1 $2

source ./__base_import

ZZ_LOG_FILE_NAME=$(create_logfile_name "sales_portal")
find /home/user/projects/Workspace_2/zzdeploy_logs/${1^^} -name "_${ZZ_LOG_SPACE}_sales_portal_*.log" $ZZ_MTIME_OR_MMIN -delete
./__deploy_sales_portal.sh $1 $2 $3 > /home/user/projects/Workspace_2/zzdeploy_logs/${1^^}/$ZZ_LOG_FILE_NAME
echo -e "\n${RED__}$ZZ_LOG_FILE_NAME is completed....${NOCOLOR}"
