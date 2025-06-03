# rm zzdeploy_all
# ln -s ../zzPrivate/workscripts/deploy_scripts/deploy_sales_portal_all.sh zzdeploy_all
NOCOLOR="\033[0m"    # no color
BLACK="\033[0;30m"   # font color : black
RED__="\033[1;31m"   # bold, font color : red
GREEN="\033[1;32m"   # bold, font color : green
YELLO="\033[0;33m"   # font color : yellow
BLUE_="\033[0;34m"   # font color : blue
MARGE="\033[0;35m"   # font color : margenta
CYAN_="\033[0;36m"   # font color : cyan
WHITE="\033[0;37m"   # font color : white / light gray

BG_BLACK="\033[0;30m"   # background color : black
BG_RED__="\033[0;31m"   # background color : red
BG_GREEN="\033[0;32m"   # background color : green
BG_YELLO="\033[0;33m"   # background color : yellow
BG_BLUE_="\033[0;34m"   # background color : blue
BG_MARGE="\033[0;35m"   # background color : margenta
BG_CYAN_="\033[0;36m"   # background color : cyan
BG_WHITE="\033[0;37m"   # background color : white / light gray
############################################

cd /home/user/projects/Workspace_2

# ./zzcf_login $1 $2

echo -e "\n${GREEN}start deploy sales_portal${NOCOLOR}\n"

cd sales_portal
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi
echo -e "\n${RED__}end of deploy sales_portal on ${ZZ_CURR_TARGET}\n"

echo -e "${GREEN}start deploy sales_portal_admin${NOCOLOR}\n"

cd ../sales_portal_admin
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi
echo -e "\n${RED__}end of deploy sales_portal_admin on ${ZZ_CURR_TARGET}\n"

echo -e "${GREEN}start deploy sales_portal_api${NOCOLOR}\n"

cd ../sales_portal_api
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi
echo -e "\n${RED__}end of deploy sales_portal_api on ${ZZ_CURR_TARGET}\n"

echo -e "${GREEN}start deploy sales_portal_backend${NOCOLOR}\n"

cd ../sales_portal_backend

echo -e "${BLUE_}start cds deploy${NOCOLOR}\n"

./zzcds_deploy $1 $2 $3

echo -e "\n${BLUE_}end of cds deploy\n"

echo -e "start service deploy${NOCOLOR}\n"

./zzdeploy $1 $2 $3

echo -e "\n${BLUE_}end of service deploy${NOCOLOR}\n"

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi
echo -e "\n${RED__}end of deploy sales_portal_backend on ${ZZ_CURR_TARGET}\n"

echo -e "${GREEN}start deploy sales_portal_collaboration${NOCOLOR}\n"

cd ../sales_portal_collaboration
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi
echo -e "\n${RED__}end of deploy sales_portal_collaboration on ${ZZ_CURR_TARGET}\n"

echo -e "${GREEN}start deploy sales_portal_home${NOCOLOR}\n"

cd ../sales_portal_home
./zzdeploy $1 $2 $3

ZZ_CURR_SPACE=`cf target|grep space`
ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 3)
if [ "${ZZ_CURR_TARGET}" == "" ];
then
    ZZ_CURR_TARGET=$(echo ${ZZ_CURR_SPACE:16}|cut -d'_' -f 2)
fi
echo -e "\n${RED__}end of deploy sales_portal_home on ${ZZ_CURR_TARGET}${NOCOLOR}\n"