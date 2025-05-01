# in Workspace_2 :
# ln -s ../zzPrivate/commands/git_pull/all_2nd.sh zzgit_pull
# ./zzgit_pull

if [ "$1" == "1" ];
then
    ZZ_VER="1st common"
elif [ "$1" == "2" ];
then
    ZZ_VER="2nd common"
fi

if [ "$ZZ_VER" != "" ];
then
    echo -e "\nstart git_pull $ZZ_VER projects\n"

    echo -e "====================================\n"

    echo -e "start git pull sales_portal\n"
    cd /home/user/projects/Workspace_$1/sales_portal
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

    if [ "$1" == "1" ];
    then
        echo -e "====================================\n"

        echo -e "start git pull ias_usersync_job\n"
        cd ../ias_usersync_job
        git pull
        echo -e "\nend of git pull ias_usersync_job\n"
    fi

    echo -e "====================================\n"

    echo -e "end of git_pull $ZZ_VER projects\n"
fi
