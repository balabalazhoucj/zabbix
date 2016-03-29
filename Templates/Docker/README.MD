##获取docker基础信息


#####获取当前主机中container name,以json的方式显示

docker-container.sh 

####获取container 状态

```
container.sh status 'container id or name'

＃sh docker-container.sh 
{
        "data":[
        {
                "{#CONTAINER_NAME}":"fs_fs_front_1"
        },
        {
                "{#CONTAINER_NAME}":"fs_fs_app_1"
        },
        {
                "{#CONTAINER_NAME}":"dockerzabbix_zabbix-server_1"
        },
        {
                "{#CONTAINER_NAME}":"dockerzabbix_zabbix-db_1"
        },
        {
                "{#CONTAINER_NAME}":"lantop"
        },
        {
                "{#CONTAINER_NAME}":"ztc"
        },
        {
                "{#CONTAINER_NAME}":"mh2reading"
        }
        ]
}


```
####获取container硬盘使用空间

```
container.sh capacity 'conainer id or name'
```