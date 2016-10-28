##zabbix docker LLD

| | |
|--------|----------|
|container_quantitis.sh|显示container和images|
|docker-container.sh|构建container name json|
|Running_containers_status.sh|显示container|



####运行docker-container.sh

```
docker-container.sh status 'container id or name'

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
