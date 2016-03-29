##JMX_Templates（多端口监控）
zabbix通过动态发现监控单台服务器多个tomcat
###开启Tomcat JMX
考虑到环境的通用性，使用catalina-jmx-remote.jar，这样通过固定端口来抓取数据，避免防火墙或在Docker环境中出现不能获取数据的问题。

- 根据各个tomcat版本下载catalina-jmx-remote.jar

- $vi bin/catalina.sh

```
CATALINA_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun
.management.jmxremote.ssl=false -Djava.rmi.server.hostname=192.168.1.14"
```

- $vi conf/server.xml

```
<Listener className="org.apache.catalina.mbeans.JmxRemoteLifecycleListener" rmiRegistryPortPlatform="1234
3" rmiServerPortPlatform="12348"/>
```
###自动发现
创建jmx_port端口文件，jmx_discovery.sh通过读取端口文件发现本地服务器上运行的jmx
jmx_port格式如下：

```
12345
12346
```
>每个jmx端口一行

###JMX监控
把JMX_status.conf放到zabbix client所在本地配置路径下。

###模版文件
在zabbix server上导入zabbix_jmx_templates.xml

>以上方法在tomcat1.7/1.8部署在docker中测试通过。