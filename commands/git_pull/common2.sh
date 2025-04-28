# in Workspace_2 :
# ln -s ../zzPrivate/commands/git_pull/all_2nd.sh zzgit_pull
# ./zzgit_pull

echo -e "\nstart git_pull 2nd common projects\n"

echo -e "====================================\n"

echo -e "start git pull sales_portal\n"
cd /home/user/projects/Workspace_2/sales_portal
git pull
echo -e "\nend of git pull sales_portal\n"

echo -e "====================================\n"

echo -e "start git pull sales_portal_admin\n"
cd ../sales_portal_admin
git pull
echo -e "\nend of git pull sales_portal_admin\n"

echo -e "====================================\n"

echo -e "start git pull sales_portal_api\n"
cd ../sales_portal_api
git pull
echo -e "\nend of git pull sales_portal_api\n"

echo -e "====================================\n"

echo -e "start git pull sales_portal_backend\n"
cd ../sales_portal_backend
git pull
echo -e "\nend of git pull sales_portal_backend\n"

echo -e "====================================\n"

echo -e "start git pull sales_portal_collaboration\n"
cd ../sales_portal_collaboration
git pull
echo -e "\nend of git pull sales_portal_collaboration\n"

echo -e "====================================\n"

echo -e "start git pull sales_portal_home\n"
cd ../sales_portal_home
git pull
echo -e "\nend of git pull sales_portal_home\n"

echo -e "====================================\n"

echo -e "end of git_pull 2nd common projects\n"
