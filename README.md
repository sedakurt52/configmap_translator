 configmap_translator
 If you want to take your project configmap item as file format, you can use these scripts
----for Openshift Configmaps-----
When you run the script, the script will ask you to enter ocp login url and login
 
 ./cmtranslator.sh
 
 Please enter your openshift url:
 ocp.local.host
 
 Please Enter your project name:
 myfirstproject
 
 login successed

Script will create the configmap files under /Project/"$YOUR_OPC_PROJECT_NAME"_configmaps/ path


